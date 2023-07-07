import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../util/Log.dart';
import '../../../../util/toast_util.dart';
import '../../../../widget/horizontal_indicator_tab.dart';
import '../../../routes/app_pages.dart';

class MainHorizontalTabComponent extends StatelessWidget {
  const MainHorizontalTabComponent({super.key});

  static const List<String> tabNames = ["Casa", "Promoção", "Depósito", "VIP", "Minha", "组件页面"];
  static const selectedIconList = ["i-index.webp", "", "", "", ""];
  static const unselectedIconList = ["", "", "", "", ""];

  @override
  Widget build(BuildContext context) {
    return HorizontalIndicatorTab(
      size: tabNames.length,
      itemBuilder: _buildIndicatorTabItemBuilder,
      width: 1.sw,
      height: 125.w,
      itemWidthList: List.generate(tabNames.length, (index) => getTabItemWidth(index)),
      onSelectChanged: (pos) {
        Toast.show("$pos");
        if (pos == 5) {
          Log.d("去组件测试页面");
          Get.toNamed(Routes.COMPONENT_TEST);
        }
      },
      bgColor: const Color(0xff000000),
      alignment: Alignment.center,
      indicatorAttr: IndicatorAttr(color: const Color(0xffd54f7d), height: 0.w, width: 44.w),
      controller: IndicatorTabController(),
    );
  }

  double getTabItemWidth(int pos) {
    return 1.sw / 5;
  }

  Widget _buildIndicatorTabItemBuilder(BuildContext context, int index, int selectedPos) {
    bool selected = index == selectedPos;
    Color color = selected ? const Color(0xff0ED1F4) : const Color.fromRGBO(255, 255, 266, 0.6);
    return Container(
      width: getTabItemWidth(index),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //   Image.asset("name"),
          Text(
            tabNames[index],
            style: TextStyle(color: color, fontSize: 22.w),
          )
        ],
      ),
    );
  }
}
