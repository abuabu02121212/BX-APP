import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../util/Log.dart';
import '../../../../util/measure_util.dart';
import '../../../../util/text_util.dart';
import '../../../../widget/up_arrow_switcher.dart';
import '../../../app_style.dart';

class HomeGameTagComponent extends StatefulWidget {
  const HomeGameTagComponent({super.key});

  @override
  State<StatefulWidget> createState() {
    return MyState();
  }
}

class MyState extends State with SingleTickerProviderStateMixin {
  static const List<String> tabNames = [
    "Nova",
  ];

  @override
  void initState() {
    super.initState();
  }

  bool isOpen = false;
  WidgetSizeHelper widgetSizeHelper = WidgetSizeHelper();
  final double oneLineHeight = 60.w;
  double totalHeight = 0;
  late final curHeight = oneLineHeight.obs;

  @override
  Widget build(BuildContext context) {
    widgetSizeHelper.addListener((size) {
      totalHeight = size.height;
      Log.d("tag collapse 的大小是：$size");
    });
    return Container(
      width: double.infinity,
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Obx(() {
              return AnimatedContainer(
                height: curHeight.value,
                curve: Curves.ease,
                duration: const Duration(milliseconds: 200),
                child: FittedBox(
                  fit: BoxFit.none,
                  clipBehavior: Clip.hardEdge,
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                    width: 640.w,
                    child: Wrap(
                      key: widgetSizeHelper.globalKey,
                      spacing: 20.w,
                      runSpacing: 20.w,
                      children: List.generate(tabNames.length, (index) => _buildIndicatorTabItemBuilder(index, 0)),
                    ),
                  ),
                ),
              );
            }),
          ),
          Container(
              color: Colors.green,
              child: UpArrowSwitcher(
                color: Colors.white,
                size: 60.w,
                onClick: () {
                  isOpen = !isOpen;
                  if (isOpen) {
                    curHeight.value = oneLineHeight;
                  } else {
                    curHeight.value = totalHeight;
                  }
                },
              )),
        ],
      ),
    );
  }

  final tabTextFontSize = 24.w;
  final TextStyle textStyle = TextStyle(fontSize: 24.w);

  double getTabItemWidth(int pos) {
    var tabName = tabNames[pos];
    var textSize = TextMeasureUtil.getTextSize(text: tabName, maxWidth: 1000000, style: textStyle);
    return textSize.width + 60.w;
  }

  Widget _buildIndicatorTabItemBuilder(int index, int selectedPos) {
    bool selected = index == selectedPos;
    Color color = selected ? Colors.white : const Color.fromRGBO(255, 255, 255, 0.40);
    FontWeight weight = selected ? FontWeight.w700 : FontWeight.w400;
    return ClipRRect(
      borderRadius: BorderRadius.circular(30.w),
      child: Container(
        width: getTabItemWidth(index),
        height: 50.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(gradient: selected ? activeBtnLinearGradient : tabBgLinearGradient),
        child: Center(
          child: Text(
            tabNames[index],
            style: TextStyle(color: color, fontSize: tabTextFontSize, fontWeight: weight),
          ),
        ),
      ),
    );
  }
}
