import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_comm/util/size.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../util/toast_util.dart';
import '../../app_style.dart';
import 'my_ph_view.dart';

/// 个人中心item 组件
class ItemView extends StatelessWidget {
  Function? click;
  ItemBean? itemBean;

  ItemView({
    Key? key,
    this.click,
    this.itemBean,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        padding: EdgeInsets.zero,
        child: SizedBox(
          height: 99.px,
          child: Row(
            children: [
              Image(
                image: AssetImage(itemBean!.img),
                width: 48.px,
              ),
              SizedBox(
                width: 30.px,
              ),
              Text(itemBean!.name,
                  style: pubTextStyle(
                      const Color(0xffffffff), 24.sp, FontWeight.w400)),
              const Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              if (itemBean!.type == '1' || itemBean!.type == '2')
                Text(itemBean!.nameR,
                    style: pubTextStyle(
                        itemBean!.type == '2'
                            ? const Color(0xff3EA1F8)
                            : const Color(0xff8F9DAB),
                        24.sp,
                        FontWeight.w400)),
              if (itemBean!.type == '3')
                Text.rich(TextSpan(children: [
                  TextSpan(
                      text: itemBean!.nameR1,
                      style: pubTextStyle(
                          const Color(0xffffffff), 24.sp, FontWeight.w400)),
                  TextSpan(
                      text: itemBean!.nameR,
                      style: pubTextStyle(
                          const Color(0xff07BB65), 24.sp, FontWeight.w400)),
                ])),
              SizedBox(
                width: 30.px,
              ),
              if (itemBean!.isBack)
                Image(
                  image: const AssetImage('assets/images/user/'
                      'ic_arrow_ash_deep.webp'),
                  width: 11.5.px,
                  height: 20.px,
                ),
            ],
          ),
        ),
        onPressed: () => {
              click!(),
              Toast.show('msg'),
            });
  }
}
