import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_comm/app/app_style.dart';
import 'package:flutter_comm/util/size.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

import '../generated/l10n.dart';
import '../util/toast_util.dart';

///低部钱组件
class Lowerpart extends StatelessWidget {
  Function? click;
  var name = ''; ///钱数
  var isSele = true;

  Lowerpart({
    Key? key,
    this.click,
    this.name = '',
    this.isSele = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        height: 124.h,
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(18.px, 24.px, 22.px, 0.px),
        color: const Color(0xff1A1C1F),
        alignment: Alignment.topCenter,
        child: Row(
          children: [
            Text(S.current.Pending, style: pubTextStyle_default()),
            SizedBox(
              width: 12.px,
            ),
            Text(name,
                style:
                    pubTextStyle_default(type: 3, fontWeight: FontWeight.w700)),
            const Expanded(child: SizedBox()),
            CupertinoButton(
              padding: EdgeInsets.zero,
              minSize: 0,
              onPressed: () => {click!()},
              child: Container(
                width: 190.px,
                alignment: Alignment.center,
                height: 80.px,
                decoration: pubBoxDecoration_r(),
                child: Text(S.current.CollectAll,
                    style: pubTextStyle_default(
                        type: 1, size: 26.sp, fontWeight: FontWeight.w700)),
              ),
            ),
          ],
        ));
  }
}
