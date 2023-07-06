import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../widget/horizontal_indicator_tab.dart';

class HomeHorizontalTabComponent extends StatelessWidget {
  const HomeHorizontalTabComponent({super.key});

  static const List<String> tabNames = ["国产精选", "国产精选", "国产精选", "国产精选", "国产精选", "国产精选", "国产精选", "国产精选", "国产精选"];

  @override
  Widget build(BuildContext context) {
    return HorizontalIndicatorTab(
      size: tabNames.length,
      itemBuilder: _buildIndicatorTabItemBuilder,
      width: 1.sw,
      height: 36.w,
      itemWidthList: List.generate(tabNames.length, (index) => getTabItemWidth(index)),
      onSelectChanged: (pos) {},
      bgColor: Colors.transparent,
      alignment: Alignment.center,
      indicatorAttr: IndicatorAttr(color: const Color(0xffd54f7d), height: 3.w, width: 22.w),
      controller: IndicatorTabController(),
    );
  }

  double getTabItemWidth(int pos) {
    return tabNames[pos].length * 20.w;
  }

  Widget _buildIndicatorTabItemBuilder(BuildContext context, int index, int selectedPos) {
    bool selected = index == selectedPos;
    Color color = selected ? const Color(0xffd54f7d) : const Color(0xffc0c2c6);
    return Container(
      width: getTabItemWidth(index),
      alignment: Alignment.center,
      child: Center(
        child: Text(
          tabNames[index],
          style: TextStyle(color: color, fontSize: 17.w),
        ),
      ),
    );
  }
}
