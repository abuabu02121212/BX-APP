import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../../util/toast_util.dart';
import '../../../app_style.dart';
import '../../../component/app_button.dart';
import '../../../component/app_header.dart';
import '../../../component/app_user_info_input_field.dart';
import '../controllers/center_phone_controller.dart';

class CenterPhoneView extends GetView<CenterPhoneController> {
  const CenterPhoneView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        titleSpacing: 0,
        leadingWidth: 0,
        toolbarHeight: 110.w,
        title: const AppHeader(title: "Verificação de telefone"),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 30.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity.w,
                margin: EdgeInsets.only(top: 10.w),
                child: UserInfoInputField(
                  height: 106.w,
                  prefixIcon: 'assets/images/i-phone.webp',
                  editNode: controller.phoneEditNode,
                  prefixIconWidth: 28.w,
                  hint: 'Phone',
                  errText: '',
                  bgColor: const Color(0xff011A51),
                  border: Border.all(color: const Color(0xff2A2E3E), width: 1.w),
                  radius: 8.w,
                  isPhone: true,
                ),
              ),

              Container(
                width: double.infinity.w,
                margin: EdgeInsets.only(top: 0.w),
                child: UserInfoInputField(
                  height: 106.w,
                  prefixIcon: 'assets/images/reg-code.webp',
                  editNode: controller.codeEditNode,
                  prefixIconWidth: 28.w,
                  hint: 'Código de verificação',
                  errText: '',
                  bgColor: const Color(0xff011A51),
                  border: Border.all(color: const Color(0xff2A2E3E), width: 1.w),
                  radius: 8.w,
                  codeName: "Mandar",
                  codeSender: controller.phoneCodeSender,
                  isCode: true,
                ),
              ),
              SizedBox(height: 5.w),
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
