import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_comm/app/app_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

import '../generated/l10n.dart';
import '../util/toast_util.dart';

///通用按钮
class PubBot extends StatelessWidget {
  Function? click;
  var name = '';
  var isSele = true;

  PubBot({
    Key? key,
    this.click,
    this.name = '',
    this.isSele = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        CupertinoButton(
            padding: EdgeInsets.zero,
            minSize: 0,
            child: Container(
              height: 80.h,
              width: 710.w,
              margin: EdgeInsets.only(bottom: 26.h, top: 24.h),
              alignment: Alignment.center,
              decoration: isSele ? pubBotY() : pubBotN(),
              child: Text(
                name,
                style: pubTextStyle(
                    const Color(0xFFffffff), 26.sp, FontWeight.w700),
              ),
            ),
            onPressed: () => {
                  click!(),
                }),
        SizedBox(
          height: 26.h,
        ),
      ],
    );
  }
}
