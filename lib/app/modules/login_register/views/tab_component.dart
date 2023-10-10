import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../widget/horizontal_indicator_tab.dart';

class LoginRegisterTabComponent extends StatelessWidget {
  const LoginRegisterTabComponent({super.key, required this.onSelectChanged});

  final Callback<int, bool> onSelectChanged;

  static const List<String> tabNames = ["Entrar", "Cadastre-se"];

  @override
  Widget build(BuildContext context) {
    return HorizontalIndicatorTab(
      size: tabNames.length,
      itemBuilder: _buildIndicatorTabItemBuilder,
      height: 80.w,
      itemWidthList: List.generate(tabNames.length, (index) => getTabItemWidth(index)),
      onSelectChanged: onSelectChanged,
      bgColor: Colors.transparent,
      indicator: Image.asset("assets/images/indicator-1.webp", width: 90.w),
     // indicatorAttr: IndicatorAttr(color: const Color(0xff0ED1F4), height: 6.w, width: 80.w),
      controller: IndicatorTabController(),
    );
  }

  double getTabItemWidth(int pos) {
    return 300.w;
  }

  Widget _buildIndicatorTabItemBuilder(BuildContext context, int index, int selectedPos) {
    bool selected = index == selectedPos;
    Color color = selected ? const Color(0xff0ED1F4) : const Color.fromRGBO(255, 255, 255, 0.69);
    FontWeight fontWeight = selected ? FontWeight.w700 : FontWeight.w400;
    return Container(
      width: getTabItemWidth(index),
      alignment: Alignment.center,
      child: Text(
        tabNames[index],
        style: TextStyle(color: color, fontSize: 26.w, fontWeight: fontWeight),
      ),
    );
  }
}
