import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../generated/l10n.dart';
import '../../../../widget/horizontal_indicator_tab.dart';
import '../../../app_style.dart';

class GameTypeTabs extends StatelessWidget {
  GameTypeTabs({
    super.key,
    required this.onSelectChanged,
    required this.indicatorTabController,
  });

  final Callback<int> onSelectChanged;
  final IndicatorTabController indicatorTabController;


  final List<String> nameList = [
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

  @override
  Widget build(BuildContext context) {
    int size = 10;
    return HorizontalIndicatorTab(
      size: size,
      itemBuilder: _buildIndicatorTabItemBuilder,
      height: 115.w,
      itemWidthList: List.generate(size, (index) => getTabItemWidth(index)),
      onSelectChanged: onSelectChanged,
      bgColor: bottomBgColor,
      //  bgImgPath: "assets/images/app-footer-bg.webp",
      indicatorAttr: IndicatorAttr(color: const Color(0xff3EA1F8), height: 4.w, width: 100.w),
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
            nameList[index],
            style: TextStyle(color: color, fontSize: 24.w),
          )
        ],
      ),
    );
  }
}
