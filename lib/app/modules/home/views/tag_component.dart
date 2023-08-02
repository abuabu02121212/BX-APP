import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../util/Log.dart';
import '../../../../util/measure_util.dart';
import '../../../../util/text_util.dart';
import '../../../../widget/up_arrow_switcher.dart';
import '../../../app_style.dart';
import '../../../entity/game_tag.dart';
import '../controllers/home_controller.dart';

class HomeGameTagComponent extends StatefulWidget {
  HomeGameTagComponent({super.key, required this.listItemIndex});

  final HomeController controller = Get.put(HomeController());
  final int listItemIndex;

  @override
  State<StatefulWidget> createState() {
    return MyState();
  }
}

class MyState extends State<HomeGameTagComponent> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  bool isOpen = false;
  WidgetSizeHelper widgetSizeHelper = WidgetSizeHelper();
  final double oneLineHeight = 60.w;
  double totalHeight = 0;
  late final curHeight = oneLineHeight.obs;
  final UpArrowSwitcherController upArrowSwitcherController = UpArrowSwitcherController();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isShow = widget.controller.selectedGameTypeIndex > 1;
      return isShow
          ? Container(
              width: double.infinity,
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Obx(() {
                      var gameTagList = widget.controller.gameTagList;
                      widgetSizeHelper.addListener((size) {
                        totalHeight = size.height;
                        Log.d("tag collapse 的大小是：$size");
                      });
                      return AnimatedContainer(
                        height: curHeight.value,
                        curve: Curves.ease,
                        duration: const Duration(milliseconds: 250),
                        child: FittedBox(
                          fit: BoxFit.none,
                          clipBehavior: Clip.hardEdge,
                          alignment: Alignment.topLeft,
                          child: SizedBox(
                            width: 640.w,
                            child: Wrap(
                              key: widgetSizeHelper.globalKey,
                              spacing: 10.w,
                              runSpacing: 12.w,
                              children: List.generate(
                                gameTagList.length,
                                (index) => _buildTagItemWidget(index, widget.listItemIndex),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                  UpArrowSwitcher(
                    color: Colors.white,
                    size: 60.w,
                    onClick: () {
                      switchTagDrawer();
                    },
                    controller: upArrowSwitcherController,
                  ),
                ],
              ),
            )
          : const SizedBox();
    });
  }

  void switchTagDrawer() {
    if (isOpen) {
      curHeight.value = oneLineHeight;
    } else {
      curHeight.value = totalHeight;
    }
    isOpen = !isOpen;
  }

  final tabTextFontSize = 24.w;
  final TextStyle textStyle = TextStyle(fontSize: 24.w);

  double getTabItemWidth(int pos) {
    var tabName = widget.controller.gameTagList[pos].name.toString();
    var textSize = TextMeasureUtil.getTextSize(text: tabName, maxWidth: 1000000, style: textStyle);
    return textSize.width + 20.w;
  }

  Widget _buildTagItemWidget(int index, int listItemIndex) {
    return Obx(() {
      bool selected = widget.controller.selectedTagIndex.value == index;
      Color color = selected ? Colors.white : const Color.fromRGBO(255, 255, 255, 0.40);
      FontWeight weight = selected ? FontWeight.w700 : FontWeight.w400;
      GameTagEntity gameTagEntity = widget.controller.gameTagList[index];
      return CupertinoButton(
        onPressed: () {
          widget.controller.selectedTagIndex.value = index;
          widget.controller.getChildTabSelectIndexRx(listItemIndex).value = 0;
          if (isOpen) {
            switchTagDrawer();
            upArrowSwitcherController.startSwitch();
          }
          widget.controller.paginationHelper.reset();
          widget.controller.requestGameList(tagId: gameTagEntity.tid);
        },
        minSize: 0,
        padding: EdgeInsets.zero,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30.w),
          child: Container(
            width: getTabItemWidth(index),
            height: 50.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(gradient: selected ? activeBtnLinearGradient : tabBgLinearGradient),
            child: Center(
              child: Text(
                gameTagEntity.name,
                style: TextStyle(color: color, fontSize: tabTextFontSize, fontWeight: weight),
              ),
            ),
          ),
        ),
      );
    });
  }
}
