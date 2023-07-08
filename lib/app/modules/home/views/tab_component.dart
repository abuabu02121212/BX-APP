import 'package:flutter/material.dart';
import 'package:flutter_comm/app/app_style.dart';
import 'package:flutter_comm/util/text_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../widget/horizontal_indicator_tab.dart';

class HomeGameChildTypeTabComponent extends StatelessWidget {
  HomeGameChildTypeTabComponent({super.key});

  static const List<String> tabNames = ["Nova", "Tudo", "3 Rolos", "5 Rolos"];

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30.w),
      child: HorizontalIndicatorTab(
        size: tabNames.length,
        itemBuilder: _buildIndicatorTabItemBuilder,
        height: 54.w,
        itemWidthList: List.generate(tabNames.length, (index) => getTabItemWidth(index)),
        onSelectChanged: (pos) {},
        bgColor: const Color(0xff011A51),
        indicatorAttr: null,
        controller: IndicatorTabController(),
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

  Widget _buildIndicatorTabItemBuilder(BuildContext context, int index, int selectedPos) {
    bool selected = index == selectedPos;
    Color color = selected ? Colors.white : const Color.fromRGBO(255, 255, 255, 0.40);
    FontWeight weight = selected ? FontWeight.w700 : FontWeight.w400;
    return ClipRRect(
      borderRadius: BorderRadius.circular(30.w),
      child: Container(
        width: getTabItemWidth(index),
        alignment: Alignment.center,
        decoration: BoxDecoration(gradient: selected ? activeBtnLinearGradient : null),
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
