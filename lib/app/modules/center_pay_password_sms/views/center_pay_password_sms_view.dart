import 'package:flutter/material.dart';
import 'package:flutter_comm/widget/input_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../app_style.dart';
import '../../../component/app_button.dart';
import '../../../component/app_header.dart';
import '../../../component/app_user_info_input_field.dart';
import '../controllers/center_pay_password_sms_controller.dart';

class CenterPayPasswordSmsView extends GetView<CenterPayPasswordSmsController> {
  const CenterPayPasswordSmsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        titleSpacing: 0,
        leadingWidth: 0,
        toolbarHeight: 110.w,
        backgroundColor: const Color.fromRGBO(3, 90, 202, 1),
        title: const AppHeader(title: "Código de verificação"),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 20.w, top: 20.w, bottom: 20.w),
                alignment: Alignment.centerLeft,
                child: Obx(() {
                  return Visibility(
                    visible: controller.isSendOk.value,
                    child: Text(
                      'O código de verificação foi enviado para ${controller.isVerifyPhone() ? controller.globeController.userInfoEntity.value?.phone : controller.globeController.userInfoEntity.value?.email}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26.w,
                      ),
                    ),
                  );
                }),
              ),
              Container(
                width: double.infinity.w,
                margin: EdgeInsets.only(top: 0.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.w),
                  border: Border.all(
                    color: const Color.fromRGBO(255, 255, 255, 0.10),
                    width: 1.w,
                  ),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(1, 26, 81, 1),
                      Color.fromRGBO(1, 26, 81, 1),
                    ],
                  ),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 25.w),
                    Image.asset(
                      'assets/images/reg-code.webp',
                      width: 38.w,
                      height: 38.w,
                    ),
                    Expanded(
                      child: MyInputFiled(
                        width: double.infinity,
                        bgColor: Colors.transparent,
                        height: 72.w,
                        hint: 'por favor insira o código de verificação',
                        editNode: controller.codeEditNode,
                      ),
                    ),
                    Obx(() {
                      return AppButton(
                        width: 150.w,
                        height: 54.w,
                        radius: 100.w,
                        colorList: [
                          const Color(0xffFFD500).withOpacity(
                              (controller.countDown.value == 0 && controller.isSending.isFalse)
                                  ? 1
                                  : 0.5),
                          const Color(0xffFF9901).withOpacity(
                              (controller.countDown.value == 0 && controller.isSending.isFalse)
                                  ? 1
                                  : 0.5)
                        ],
                        text: controller.getSendButtonText(),
                        onClick: () {
                          if (controller.countDown.value == 0 && controller.isSending.isFalse) {
                            controller.sendSms();
                          }
                        },
                      );
                    }),
                    SizedBox(width: 25.w),
                  ],
                ),
              ),
              SizedBox(height: 40.w),
              Center(
                child: AppButton(
                  width: 580.w,
                  height: 90.w,
                  radius: 100.w,
                  text: 'Enviar',
                  onClick: () {
                    controller.submit();
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
