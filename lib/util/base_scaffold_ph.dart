import 'package:flutter/material.dart';

class BaseScaffoldPH extends Scaffold {
  BaseScaffoldPH(
      {
      // Color? backgroundColor =  blackBgColor_h,
      Color? backgroundColor,
      PreferredSizeWidget? appBar,
      bool resize = true,
      Widget? body,
      Widget? bottomNavigationBar})
      : super(
            resizeToAvoidBottomInset: resize,
            backgroundColor: backgroundColor,
            appBar: appBar,
            body: body,
            bottomNavigationBar: bottomNavigationBar);
}
