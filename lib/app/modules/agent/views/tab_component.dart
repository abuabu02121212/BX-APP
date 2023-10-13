import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../generated/l10n.dart';
import '../../../../widget/horizontal_indicator_tab.dart';

class AgentHorizontalTab extends StatelessWidget {
  const AgentHorizontalTab({
    super.key,
    required this.onSelectChanged,
    required this.indicatorTabController,
  });

  final Callback<int, bool> onSelectChanged;
  final IndicatorTabController indicatorTabController;

  static List<String> tabNames = [
    S.current.PromotionTutorial,
    S.current.MyReferral,
    S.current.MyPerformance,
    S.current.AllData,
    S.current.SubordinatesFinance,
    S.current.SubordinatesWagers,
    S.current.SubordinatesStats,
    S.current.SubordinatesClaims,
    S.current.AgentBonusRate,
    S.current.RegisterSubagents,
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
        itemWidthList: List.generate(
          tabNames.length,
          (index) => 140.w,
        ),
        onSelectChanged: onSelectChanged,
        // bgColor: Colors.yellow,
        //  bgImgPath: "assets/images/app-footer-bg.webp",
        indicatorAttr: IndicatorAttr(color: const Color(0xff3EA1F8), height: 4.w),
        controller: indicatorTabController,
      ),
    );
  }

  Widget _buildIndicatorTabItemBuilder(BuildContext context, int index, int selectedPos) {
    bool selected = index == selectedPos;
    Color color = selected ? const Color(0xff3EA1F8) : const Color(0xff5D656F);
    var fontWeight = selected ? FontWeight.w700 : FontWeight.w400;
    return Center(
      child: ClipRRect(
        child: Container(
          height: 50.w,
          padding: EdgeInsets.only(left: 10.w, right: 10.w),
        //  color: index % 2 == 0 ? Colors.red : Colors.pink,
          alignment: Alignment.center,
          child: Text(
            tabNames[index],
            style: TextStyle(
              color: color,
              fontSize: 28.w,
              fontWeight: fontWeight,
            ),
          ),
        ),
      ),
    );
  }
}
