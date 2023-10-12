import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_comm/util/size.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class BaseAppbarPH extends AppBar {
  BaseAppbarPH({
    required String title,
    List<Widget>? actions,
    dynamic result,
    bool showLeading = true,
    bool showLeadingText = false,
    bool isChatMain = false,
    double? fontSize,
    bool centerTitle = true,
    bool needCallback = false,
    Widget? deleteWidget,
    VoidCallback? callBack,
    double? titleSpacing,
    double? leadingWidth,
    PreferredSizeWidget? bottom,
  }) : super(
          title: Text(
            title,
            style: TextStyle(
                fontSize: fontSize ?? 32.px,
                color: const Color(0xFFFFFFFF),
                fontWeight: FontWeight.w400),
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
          backgroundColor: const Color(0xFF1A1C1F),
          centerTitle: centerTitle,
          titleSpacing: titleSpacing,
          bottom: bottom,
          elevation: 0,
          toolbarHeight: 100.px,
          flexibleSpace: Container(
            decoration: const BoxDecoration(color: Color(0xFF1A1C1F)),
          ),
          leadingWidth: leadingWidth,
          leading: _leftBack(showLeading, result, showLeadingText, isChatMain,
              deleteWidget, callBack, needCallback),
          actions: actions,
        );

  static _leftBack(
    bool showLeading,
    result,
    bool showLeadingText,
    bool isChatMain,
    Widget? deleteWidget,
    VoidCallback? callBack,
    bool needCallback,
  ) {
    if (showLeading) {
      return CupertinoButton(
          onPressed: (deleteWidget is Container || needCallback)
              ? callBack
              : () async {
                  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
                      overlays: SystemUiOverlay.values);
                  if (isChatMain) {
                    // ChatCache.needJump = false;
                  }
                  Get.back(result: result);
                },
          child: SizedBox(
            height: 80.px,
            width: 80.px,
            child: Row(
              children: [
                Image.asset(
                  "assets/images/ic_arrow_left_gray.webp",
                  width: deleteWidget is Container ? 16.px : 28.px,
                  height: deleteWidget is Container ? 16.px : 28.px,
                  color: const Color(0xFFFFFFFF),
                ),
                showLeadingText
                    ? Text(
                        'Trở Về',
                        style: TextStyle(
                            fontSize: 24.px, color: const Color(0xFFFFFFFF)),
                      )
                    : Container(),
              ],
            ),
          ));
    } else {
      return Container();
    }
  }
}
