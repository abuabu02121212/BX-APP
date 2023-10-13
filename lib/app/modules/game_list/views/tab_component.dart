import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../generated/l10n.dart';
import '../../../../widget/horizontal_indicator_tab.dart';
import '../../../app_style.dart';

class GameListHorizontalTab extends StatelessWidget {
  const GameListHorizontalTab({
    super.key,
    required this.onSelectChanged,
    required this.indicatorTabController,
  });

  final Callback<int, bool> onSelectChanged;
  final IndicatorTabController indicatorTabController;

  static List<String> tabNames = [
    S.current.All,
    S.current.hot,
    S.current.recent,
    S.current.favorite,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
     // padding: EdgeInsets.only(left: 5.w),
      child: HorizontalIndicatorTab(
        size: tabNames.length,
        itemBuilder: _buildIndicatorTabItemBuilder,
        height: 98.w,
        itemWidthList: List.generate(tabNames.length, (index) => 140.w),
        onSelectChanged: onSelectChanged,
        // bgColor: Colors.yellow,
        //  bgImgPath: "assets/images/app-footer-bg.webp",
        indicatorAttr: IndicatorAttr(color: const Color(0xffcccccc), height: 0.w),
        controller: indicatorTabController,
      ),
    );
  }


  Widget _buildIndicatorTabItemBuilder(BuildContext context, int index, int selectedPos) {
    bool selected = index == selectedPos;
    Color color = selected ? const Color(0xffffffff) : const Color(0xff5D656F);
    Color bgColor = selected ? const Color(0xff3EA1F8) : const Color(0xff1A1C1F);
    return Center(
      child: Padding(
        padding: EdgeInsets.only(right: 10.w),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25.w),
          child: Container(
            width: 140.w,
            height: 50.w,
            color: bgColor,
            alignment: Alignment.center,
            child: Text(
              tabNames[index],
              style: TextStyle(color: color, fontSize: 22.w),
            ),
          ),
        ),
      ),
    );
  }
}
