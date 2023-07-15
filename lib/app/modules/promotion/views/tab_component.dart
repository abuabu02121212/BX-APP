import 'package:flutter/material.dart';
import 'package:flutter_comm/app/app_style.dart';
import 'package:flutter_comm/util/text_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../widget/horizontal_indicator_tab.dart';

class PromotionTabComponent extends StatelessWidget {
  PromotionTabComponent({
    super.key,
    required this.onSelectChanged,
  });

  static const List<String> tabNames = ["Tudo", "Depósito", "Baixar APP", "Desconto", "Classificação", "Outros"];
  final Callback<int> onSelectChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: tabBgLinearGradient),
      child: HorizontalIndicatorTab(
        size: tabNames.length,
        itemBuilder: _buildIndicatorTabItemBuilder,
        height: 100.w,
        itemWidthList: List.generate(tabNames.length, (index) => getTabItemWidth(index)),
        onSelectChanged: onSelectChanged,
        bgColor: Colors.transparent,
        indicator: Image.asset("assets/images/indicator-1.webp", width: 90.w),
        // indicatorAttr: IndicatorAttr(color: const Color(0xff0ED1F4), height: 6.w, width: 80.w),
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
    return Container(
      width: getTabItemWidth(index),
      alignment: Alignment.center,
      child: Text(
        tabNames[index],
        style: TextStyle(color: color, fontSize: tabTextFontSize, fontWeight: weight),
      ),
    );
  }
}
