import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../generated/l10n.dart';
import '../../../../widget/horizontal_indicator_tab.dart';
import '../../../app_style.dart';
import '../controllers/home_controller.dart';
final List<String> gameTabNameList = [
  S.current.hot,
  S.current.slot,
  S.current.finishing,
  S.current.live,
  S.current.cards,
  S.current.support,
  S.current.cockFighting,
  S.current.recent,
  S.current.favorite,
  S.current.demo,
];

class GameTypeTabs extends StatelessWidget {
  GameTypeTabs({
    super.key,
    required this.onSelectChanged,
    required this.indicatorTabController,
  });

  final Callback<int, bool> onSelectChanged;
  final IndicatorTabController indicatorTabController;



  final HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    int size = 10;
    return HorizontalIndicatorTab(
      size: size,
      itemBuilder: _buildIndicatorTabItemBuilder,
      height: 120.w,
      itemWidthList: List.generate(size, (index) => getTabItemWidth(index)),
      onSelectChanged: onSelectChanged,
      bgColor: Colors.transparent,
      onScroll: (ScrollPosition scrollPosition){
        controller.isShowGameTypeLeftArrow.value = scrollPosition.extentBefore > 10.w;
        controller.isShowGameTypeRightArrow.value = scrollPosition.extentAfter > 10.w;
      },
      //  bgImgPath: "assets/images/app-footer-bg.webp",
      indicatorAttr: IndicatorAttr(color: const Color(0xff3EA1F8), height: 4.w),
      controller: indicatorTabController,
    );
  }

  double getTabItemWidth(int pos) {
    return 110.w;
  }

  Widget _buildIndicatorTabItemBuilder(BuildContext context, int index, int selectedPos) {
    bool selected = index == selectedPos;
    Color color = selected ? const Color.fromRGBO(62, 161, 248, 1) : const Color.fromRGBO(93, 101, 111, 1);
    String imgPath = selected ? "game-tab$index" : "game-tab-un$index";
    imgPath = "assets/images/$imgPath.webp";
    return Container(
      width: getTabItemWidth(index),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Image.asset(imgPath, width: 64.w, gaplessPlayback: true),
            ],
          ),
          Text(
            gameTabNameList[index],
            style: TextStyle(color: color, fontSize: 24.w, fontWeight: selected ? FontWeight.w700 : FontWeight.w400),
          )
        ],
      ),
    );
  }
}
