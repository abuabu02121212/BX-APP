import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../widget/horizontal_indicator_tab.dart';

class MainHorizontalTabComponent extends StatelessWidget {
  MainHorizontalTabComponent({super.key, required this.onSelectChanged}) {
    Future.delayed(const Duration(milliseconds: 250), () {
      animScale.value = maxScale;
    });
  }

  final Callback<int> onSelectChanged;

  static const List<String> tabNames = ["Casa", "Promoção", "Depósito", "VIP", "Minha", "组件测试页"];
  static const selectedIconList = ["i-index", "i-promotion", "blue-circle", "i-vip", "i-personal", "i-personal"];
  static const unselectedIconList = ["i-index-gray", "i-promotion-gray", "blue-circle", "i-vip-gray", "i-personal-gray", "i-personal-gray"];
  static const miniScale = 1.3;
  static const maxScale = 1.6;
  final animScale = miniScale.obs;


  @override
  Widget build(BuildContext context) {
    return HorizontalIndicatorTab(
      size: tabNames.length,
      itemBuilder: _buildIndicatorTabItemBuilder,
      width: 1.sw,
      height: 125.w,
      itemWidthList: List.generate(tabNames.length, (index) => getTabItemWidth(index)),
      onSelectChanged: onSelectChanged,
      bgColor: Colors.transparent,
      bgImgPath: "assets/images/app-footer-bg.webp",
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
    Color color = selected ? const Color(0xff0ED1F4) : const Color.fromRGBO(255, 255, 255, 0.6);
    String imgPath = selected ? selectedIconList[index] : unselectedIconList[index];
    imgPath = "assets/images/$imgPath.webp";
    double offsetY = index == 2 ? -12.w : 0;
    double scale = index == 2 ? 1.5 : 1;
    return Container(
      width: getTabItemWidth(index),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Transform.translate(
                  offset: Offset(0, offsetY),
                  child: Transform.scale(
                    scale: scale,
                    child: Image.asset(imgPath, width: 45.w, gaplessPlayback: true),
                  )),
              if (index == 2)
                Obx(() {
                  return AnimatedScale(
                    scale: animScale.value,
                    duration: const Duration(milliseconds: 800),
                    onEnd: () {
                      animScale.value = animScale.value == miniScale ? maxScale : miniScale;
                    },
                    child: Transform.translate(
                        offset: Offset(0, -10.w),
                        child: Image.asset(
                          "assets/images/pig.webp",
                          width: 45.w,
                        )),
                  );
                }),
            ],
          ),
          SizedBox(height: 5.w),
          Text(
            tabNames[index],
            style: TextStyle(color: color, fontSize: 22.w),
          )
        ],
      ),
    );
  }
}
