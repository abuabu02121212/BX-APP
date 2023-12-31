import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:measure_size/measure_size.dart';

import '../util/Log.dart';
import 'comm_anim2.dart';

typedef ItemBuilder = Widget Function(BuildContext context, int index, int selectedPos);
typedef Callback<T, V> = void Function(T t, V v);
typedef OnScroll = void Function(ScrollPosition scrollPosition);

/// 基于 SingleChildScrollView 的水平tab ,适用于Tab比较少的情况.
class HorizontalIndicatorTab extends StatefulWidget {
  const HorizontalIndicatorTab(
      {super.key,
      required this.size,
      required this.itemBuilder,
      this.bgColor,
      required this.height,
      this.itemWidthList,
      required this.onSelectChanged,
      this.indicatorAttr,
      required this.controller,
      this.bgImgPath,
      this.indicator,
      this.onScroll});

  final int size;
  final ItemBuilder itemBuilder;
  final double height;

  final List<double>? itemWidthList;
  final Callback<int, bool> onSelectChanged;
  final Color? bgColor;
  final IndicatorAttr? indicatorAttr;
  final IndicatorTabController controller;
  final String? bgImgPath;
  final Widget? indicator;
  final OnScroll? onScroll;

  @override
  State<HorizontalIndicatorTab> createState() {
    return MyState();
  }
}

class MyState extends State<HorizontalIndicatorTab> with TickerProviderStateMixin {
  final ScrollController scrollController = ScrollController();
  late final List<double> itemWidthList = List.generate(widget.size, (index) => 0);
  late CommonTweenAnim<double> anim = CommonTweenAnim<double>()
    ..init(200, this, 0.0, 0.0)
    ..addListener(onUpdate);
  final ValueNotifier<double> leftNotifier = ValueNotifier<double>(0.0);

  @override
  void initState() {
    widget.controller.attach(this);
    scrollController.addListener(() {
      if (widget.onScroll != null) {
        widget.onScroll!(scrollController.position);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MeasureSize(
      onChange: (Size size) {
        parentWidth = size.width;
      },
      child: Container(
        height: widget.height,
        decoration: BoxDecoration(
          image: widget.bgImgPath == null ? null : DecorationImage(image: AssetImage(widget.bgImgPath!)),
          color: widget.bgColor,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          controller: scrollController,
          physics: const BouncingScrollPhysics(),
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              ValueListenableBuilder(
                valueListenable: widget.controller.selectedIndexNotifier,
                builder: (BuildContext context, int value, Widget? child) {
                  return Row(
                    children: List.generate(widget.size, (pos) {
                      return CupertinoButton(
                        minSize: 0,
                        padding: const EdgeInsets.all(0),
                        pressedOpacity: 0.8,
                        onPressed: () => onItemClick(pos, true),
                        child: MeasureSize(
                            onChange: (Size size) {
                              itemWidthList[pos] = size.width;
                              var selectedIndex = widget.controller.selectedIndexNotifier.value;
                              if(selectedIndex == pos){
                                leftNotifier.notifyListeners();
                              }

                              //Log.d("===MeasureSize===index:$index  size:$size");
                            },
                            child: _buildItem(context, pos)),
                      );
                    }),
                  );
                },
              ),

              /// indicator
              ValueListenableBuilder(
                valueListenable: leftNotifier,
                builder: (BuildContext context, double value, Widget? child) {
                  var selectedIndex = widget.controller.selectedIndexNotifier.value;
                  double itemWidth = itemWidthList[selectedIndex];
                  double indicatorWidth = itemWidth;
                  return AnimatedPositioned(
                    left: getItemWidthSum(selectedIndex - 1),
                    duration: const Duration(milliseconds: 250),
                    child: widget.indicator ??
                        ClipRRect(
                          borderRadius: BorderRadius.circular(widget.indicatorAttr?.height ?? 2 / 2.0),
                          child: AnimatedContainer(
                            width: indicatorWidth,
                            height: widget.indicatorAttr?.height,
                            color: widget.indicatorAttr?.color,
                            duration: const Duration(milliseconds: 250),
                          ),
                        ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItem(BuildContext context, int pos) {
    if (pos == 0) {
      return widget.itemBuilder(context, pos, widget.controller.selectedIndexNotifier.value);
    } else {
      return widget.itemBuilder(context, pos, widget.controller.selectedIndexNotifier.value);
    }
  }

  double getItemWidthSum(int itemIndex) {
    var sublist = itemWidthList.sublist(0, itemIndex + 1);
    // 0是初始积累值， 第一个参数是之前的累积值，第二个参数是当前的元素值
    double sumWidth = sublist.fold(0, (previousValue, element) => previousValue + element);
    return sumWidth;
  }

  void onItemClick(int pos, bool isClick) {
    if (widget.controller.selectedIndexNotifier.value != pos) {
      if (widget.indicatorAttr != null || widget.indicator != null) {
        anim.updateEndAndStart(getItemWidthSum(pos - 1));
      }
      widget.controller.selectedIndexNotifier.value = pos;
      if (pos != widget.controller.posList.last) {
        widget.controller.posList.add(pos);
      }
      widget.onSelectChanged(pos, isClick);
      autoScroll(pos);
    }
  }

  void onUpdate() {
    if (anim.animation != null) {
      leftNotifier.value = anim.animation!.value;
    }
  }
  double parentWidth = 0;
  void autoScroll(int selectedPos) {
    double contentWidth = getItemWidthSum(itemWidthList.length - 1);
    double width = contentWidth < parentWidth ? contentWidth : parentWidth;
    double selectedItemOriLeft = getItemWidthSum(selectedPos - 1);
    var offset = scrollController.offset;
    double itemLeft = selectedItemOriLeft - offset;
    double itemCenter = width / 2 - itemLeft - itemWidthList[selectedPos] / 2;
    double realNeedScrollDistance = 0;
    if (itemCenter < 0) {
      double canToLeftMaxScroll = contentWidth - width;
      double canToLeftScroll = canToLeftMaxScroll - offset;
      realNeedScrollDistance = canToLeftScroll < itemCenter.abs() ? -canToLeftScroll : itemCenter;
    } else {
      // 向右边滚动
      double canToRightScroll = offset;
      realNeedScrollDistance = canToRightScroll < itemCenter.abs() ? canToRightScroll : itemCenter;
    }
    // Log.d("realNeedScrollDistance:$realNeedScrollDistance");
    scrollController.animateTo(offset - realNeedScrollDistance, duration: const Duration(milliseconds: 200), curve: Curves.linear);
  }
}

class IndicatorAttr {
  IndicatorAttr({
    this.color,
    required this.height,
  });

  final Color? color;
  final double height;
}

class IndicatorTabController {
  MyState? myState;
  List<int> posList = [];

  IndicatorTabController({int defSelectPos = 0}) {
    selectedIndexNotifier.value = defSelectPos;
    posList.add(defSelectPos);
  }

  void attach(MyState state) {
    myState = state;
  }

  final ValueNotifier<int> selectedIndexNotifier = ValueNotifier<int>(0);

  void onItemSelectChanged(int pos, {isClick = false}) {
    myState?.onItemClick(pos, isClick);
  }

  void back({isClick = false}) {
    Log.d("posList: $posList ");
    if (posList.length > 1) {
      posList.removeLast();
      myState?.onItemClick(posList.last, isClick);
    }
  }
}
