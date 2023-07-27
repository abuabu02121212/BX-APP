import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.width,
    required this.height,
    required this.text,
    required this.onClick,
    this.colorList = colorList1,
    this.disableColorList = disableColorList1,
    this.disable = false,
    required this.radius,
    this.textColor = Colors.white,
  });

  final double width;
  final double height;
  final String text;
  final VoidCallback onClick;
  final List<Color> colorList;
  final List<Color> disableColorList;
  final double radius;
  final Color textColor;
  final bool disable;

  static const colorList1 = [Color(0xff0ED1F4), Color(0xff1373EF)];
  static const disableColorList1 = [Color(0x880ED1F4), Color(0x881373EF)];
  static const colorList2 = [Color(0xffFFD500), Color(0xffFF9901)];
  static const disableColorList2 = [Color(0x88FFD500), Color(0x88FF9901)];

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: disable ? null : onClick,
      minSize: 0,
      pressedOpacity: 0.8,
      padding: const EdgeInsets.all(0),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: disable ? disableColorList : colorList),
          borderRadius: BorderRadius.circular(radius),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 28.w,
            color: textColor,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
