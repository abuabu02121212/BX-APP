import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_comm/util/size.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Color bgColor = const Color(0xff020a1c);
const Color headerBgColor = Color(0xff1A1C1F);
const Color bottomBgColor = Color(0xff1A1C1F);

LinearGradient headerLinearGradient = const LinearGradient(
  colors: [Color(0xff044B9A), Color(0xff011A51)],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

LinearGradient headerLinearGradient3 = const LinearGradient(
  colors: [Color(0x44044B9A), Color(0x44011A51)],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

LinearGradient yellowLinearGradient = const LinearGradient(
  colors: [Color.fromRGBO(255, 163, 5, 1), Color.fromRGBO(255, 204, 90, 1)],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);

LinearGradient activeBtnLinearGradient = const LinearGradient(
  colors: [Color.fromRGBO(19, 115, 239, 1), Color.fromRGBO(14, 209, 244, 1)],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

LinearGradient tabBgLinearGradient = const LinearGradient(
  colors: [Color(0xff020a1c), Color(0xff051a4b)],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

LinearGradient drawerItem1 = const LinearGradient(
  colors: [Color(0xff09BD94), Color(0xff2D4EE9)],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

LinearGradient drawerItem2 = const LinearGradient(
  colors: [Color(0xffFF9739), Color(0xffF23D32)],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

LinearGradient drawerItem3 = const LinearGradient(
  colors: [Color(0xffA14FD1), Color(0xffEF30A5)],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

LinearGradient drawerItem4 = const LinearGradient(
  colors: [Color(0xff9C27D7), Color(0xff2459FE)],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

// #, #011A51rgba(46, 50, 69, 0), rgba(1, 26, 81, 1)
LinearGradient btnLinearBg = const LinearGradient(
  colors: [Color(0x99011A51), Color(0xff011A51)],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

LinearGradient tabBgLinearGradientH = const LinearGradient(
  colors: [Color(0xff1A1C1F), Color(0xff1A1C1F)],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

// 主题背景色（黑色）---菲
Color blackBgColor_h = const Color(0xfff212226);

TextStyle pubTextStyle(var color, var size, var fontWeight,
    {height, wordSpacing}) {
  return TextStyle(
      fontSize: size,
      color: color,
      fontWeight: fontWeight,
      height: height,
      wordSpacing: wordSpacing);
}

///type 2：绿 1 ：白 3:黄 4:5D656F
TextStyle pubTextStyle_default(
    {Color? color,
    double? size,
    FontWeight? fontWeight,
    height,
    wordSpacing,
    int? type}) {
  return TextStyle(
      fontSize: size ?? 24.sp,
      color: color ??
          (type == 4
              ? const Color(0xff5D656F)
              :type == 3
              ? const Color(0xffF09B1B)
              :type == 2
              ? const Color(0xff3EA1F8)
              : type == 1
                  ? const Color(0xffffffff)
                  : const Color(0xff8F9DAB)),
      fontWeight: fontWeight ?? FontWeight.w400,
      height: height,
      wordSpacing: wordSpacing);
}

BoxDecoration pubBoxDecoration({Color? color, double? rs}) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(rs ?? 16.px),
    color: color ?? const Color(0xff252527),
    border:
        Border.all(color: const Color.fromRGBO(93, 101, 111, 0.40), width: 1.px),
  );
}

BoxDecoration pubBoxDecoration_r({Color? color, double? rs,Color? colorBorder, double? withs}) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(rs ?? 16.px),
    color: color ?? const Color(0xff8F9DAB),
    border:
    Border.all(color: colorBorder ??  Colors.transparent, width: withs??1.px),
  );
}

Divider pubLin() {
  return Divider(
    color: const Color.fromRGBO(93, 101, 111, 0.40),
    height: 1.px,
  );
}

BoxDecoration pubBotY({Color? color, double? rs}) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(rs ?? 16.px),
    color: color ?? const Color(0xFF3EA1F8),
  );
}

BoxDecoration pubBotN({Color? color, double? rs}) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(rs ?? 16.px),
    color: color ?? const Color(0xff8F9DAB),
  );
}
