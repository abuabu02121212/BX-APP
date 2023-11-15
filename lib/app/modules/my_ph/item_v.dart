import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_comm/util/size.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../generated/l10n.dart';
import '../../../util/toast_util.dart';
import '../../app_style.dart';
import '../../routes/app_pages.dart';
import 'item_bean.dart';

/// 个人中心item 组件
class ItemView extends StatelessWidget {
  ItemBean? itemBean;

  ItemView({
    Key? key,
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
              // click!(),
              Toast.show(
                itemBean!.name,
              ),

              if (itemBean!.name == S.current.Agent)
                {
                  Get.toNamed(Routes.AGENT),
                }
              else if (itemBean!.name == S.current.NetworkStatus)
                {
                  Get.toNamed(Routes.PERSONAL_INFORMATION),
                }
              else if (itemBean!.name == S.current.PersonalInformation)
                {
                  Get.toNamed(Routes.PERSONAL_INFORMATION),
                }
              else if (itemBean!.name == S.current.SecurityCenter)
                {
                  Get.toNamed(Routes.SECURITY_CENTER_PH),
                }
              else if (itemBean!.name == S.current.Language)
                {
                  // Get.toNamed(Routes.PERSONAL_INFORMATION),
                }
              else if (itemBean!.name == S.current.FAQ)
                {
                  Get.toNamed(Routes.MESSAGE_CENTER),
                }
              else if (itemBean!.name == S.current.FeedbackContent)
                {
                  Get.toNamed(Routes.MESSAGE_CENTER),
                }
              else if (itemBean!.name == S.current.PlayerID)
                {
                  // Get.toNamed(Routes.PERSONAL_INFORMATION),
                }
              else if (itemBean!.name == S.current.MobilePhone)
                {
                  // Get.toNamed(Routes.PERSONAL_INFORMATION),
                }
              else if (itemBean!.name == S.current.EmailAddress)
                {
                  // Get.toNamed(Routes.PERSONAL_INFORMATION),
                }
              else if (itemBean!.name == S.current.GoogleAuthenticator)
                {
                  // Get.toNamed(Routes.PERSONAL_INFORMATION),
                }
              else if (itemBean!.name == S.current.LoginPassword)
                {
                  // Get.toNamed(Routes.PERSONAL_INFORMATION),
                }
              else if (itemBean!.name == S.current.WithdrawPIN)
                {
                  // Get.toNamed(Routes.PERSONAL_INFORMATION),
                }
              else if (itemBean!.name == S.current.SecurityQuestion)
                {
                  // Get.toNamed(Routes.PERSONAL_INFORMATION),
                }
              else if (itemBean!.name == S.current.ThirdPartyBinding)
                {
                  // Get.toNamed(Routes.PERSONAL_INFORMATION),
                }
              // }
            });
  }
}
