import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../generated/l10n.dart';
import '../../../../widget/horizontal_indicator_tab.dart';
import '../../../app_style.dart';

class MainHorizontalTabComponent extends StatelessWidget {
  MainHorizontalTabComponent({
    super.key,
    required this.onSelectChanged,
    required this.indicatorTabController,
  }) {
    Future.delayed(const Duration(milliseconds: 250), () {
      animScale.value = maxScale;
    });
  }

  final Callback<int, bool> onSelectChanged;
  final IndicatorTabController indicatorTabController;

  static List<String> tabNames = [
    S.current.home,
    S.current.promo,
    S.current.support,
    S.current.VIP,
    S.current.profile,
    //  "组件测试页",
  ];
  static const miniScale = 1.3;
  static const maxScale = 1.6;
  final animScale = miniScale.obs;

  @override
  Widget build(BuildContext context) {
    return HorizontalIndicatorTab(
      size: tabNames.length,
      itemBuilder: _buildIndicatorTabItemBuilder,
      height: 125.w,
      itemWidthList:
          List.generate(tabNames.length, (index) => getTabItemWidth(index)),
      onSelectChanged: onSelectChanged,
      bgColor: bottomBgColor,
    //  bgImgPath: "assets/images/app-footer-bg.webp",
      indicatorAttr: IndicatorAttr(
          color: const Color(0xffd54f7d), height: 0.w),
      controller: indicatorTabController,
    );
  }

  double getTabItemWidth(int pos) {
    return 1.sw / 5;
  }

  Widget _buildIndicatorTabItemBuilder(
      BuildContext context, int index, int selectedPos) {
    bool selected = index == selectedPos;
    Color color = selected
        ? const Color(0xff0ED1F4)
        : const Color.fromRGBO(255, 255, 255, 0.6);
    String imgPath =
        selected ?  "main_tab_${index + 1}": "main_tab_un_${index + 1}";
    imgPath = "assets/images/$imgPath.webp";
    return Container(
      width: getTabItemWidth(index),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Image.asset(imgPath, width: 54.w, gaplessPlayback: true),
            ],
          ),
          SizedBox(height: 5.w),
          Text(
            tabNames[index],
            style: TextStyle(color: color, fontSize: 24.w),
          )
        ],
      ),
    );
  }
}
