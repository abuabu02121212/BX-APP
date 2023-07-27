import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../app_style.dart';
import '../../../component/app_button.dart';
import '../../../component/app_header.dart';
import '../../../component/app_user_info_input_field.dart';
import '../controllers/center_phone_controller.dart';

class CenterPhoneView extends GetView<CenterPhoneController> {
  CenterPhoneView({Key? key}) : super(key: key);


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

              if(controller.isShowBindPhone)
                Container(
                  width: double.infinity.w,
                  margin: EdgeInsets.only(top: 10.w),
                  child: UserInfoInputField(
                    height: 106.w,
                    prefixIcon: 'assets/images/i-phone.webp',
                    editNode: controller.phoneEditNode,
                    prefixIconWidth: 28.w,
                    hint: 'Phone',
                    errText: 'Número de telefone errado',
                    bgColor: const Color(0xff011A51),
                    border: Border.all(color: const Color(0xff2A2E3E), width: 1.w),
                    radius: 8.w,
                    isPhone: true,
                  ),
                ) else
                Container(
                  width: double.infinity.w,
                  margin: EdgeInsets.only(top: 10.w),
                  child: UserInfoInputField(
                    height: 106.w,
                    prefixIcon: 'assets/images/reg-email.webp',
                    editNode: controller.emailEditNode,
                    hint: 'Por favor introduza o seu e-mail',
                    errText: 'Erro de e-mail',
                    bgColor: const Color(0xff011A51),
                    border: Border.all(color: const Color(0xff2A2E3E), width: 1.w),
                    radius: 8.w,
                    editEnable: true,
                    isEmail: true,
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
                  errText: 'Erro no código de verificação',
                  bgColor: const Color(0xff011A51),
                  border: Border.all(color: const Color(0xff2A2E3E), width: 1.w),
                  radius: 8.w,
                  codeName: "Mandar",
                  codeSender: controller.isShowBindPhone ? controller.phoneCodeSender : controller.emailCodeSender,
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
                    controller.commit();
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
