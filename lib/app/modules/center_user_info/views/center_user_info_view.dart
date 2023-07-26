import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../../util/toast_util.dart';
import '../../../app_style.dart';
import '../../../component/app_button.dart';
import '../../../component/app_header.dart';
import '../../../component/app_user_info_input_field.dart';
import '../controllers/center_user_info_controller.dart';

class CenterUserInfoView extends GetView<CenterUserInfoController> {
  const CenterUserInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        titleSpacing: 0,
        leadingWidth: 0,
        toolbarHeight: 110.w,
        title: const AppHeader(title: "Minha conta"),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 30.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Nome do usuário: qiaofeng88",
                style: TextStyle(
                  fontSize: 28.w,
                  color: const Color(0xffffffff),
                  fontWeight: FontWeight.w400,
                ),
              ),
              Container(
                width: double.infinity.w,
                margin: EdgeInsets.only(top: 10.w),
                child: UserInfoInputField(
                  height: 106.w,
                  prefixIcon: 'assets/images/reg-email.webp',
                  editNode: controller.emailEditNode,
                  hint: 'Por favor introduza o seu e-mail',
                  errText: '',
                  bgColor: const Color(0xff011A51),
                  border: Border.all(color: const Color(0xff2A2E3E), width: 1.w),
                  radius: 8.w,
                  editEnable: false,
                  isEmail: true,
                ),
              ),

              Container(
                width: double.infinity.w,
                margin: EdgeInsets.only(top: 0.w),
                child: UserInfoInputField(
                  height: 106.w,
                  prefixIcon: 'assets/images/user_info_username.webp',
                  editNode: controller.usernameEditNode,
                  prefixIconWidth: 46.w,
                  paddingLeft: 12.w,
                  paddingRight: 2.w,
                  hint: '',
                  errText: '',
                  bgColor:bgColor,
                  border: Border.all(color: const Color(0xff2A2E3E), width: 1.w),
                  radius: 8.w,
                  editEnable: false,
                  isUserName: true,
                ),
              ),

              Container(
                width: double.infinity.w,
                margin: EdgeInsets.only(top: 0.w),
                child: UserInfoInputField(
                  height: 106.w,
                  prefixIcon: 'assets/images/user_info_telegram.webp',
                  editNode: controller.telegramEditNode,
                  prefixIconWidth: 46.w,
                  paddingLeft: 12.w,
                  paddingRight: 2.w,
                  hint: 'Por favor introduza o seu e-mail',
                  errText: '',
                  bgColor: const Color(0xff011A51),
                  border: Border.all(color: const Color(0xff2A2E3E), width: 1.w),
                  radius: 8.w,
                ),
              ),

              Center(
                child: AppButton(
                  width: 580.w,
                  height: 90.w,
                  radius: 100.w,
                  text: 'Enviar',
                  onClick: () {
                    Toast.show("按钮被点击");
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
