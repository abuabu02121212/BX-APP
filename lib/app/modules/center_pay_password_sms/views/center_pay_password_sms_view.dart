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
        title: const AppHeader(title: "发送验证吗"),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 95.w,
                padding: EdgeInsets.only(left: 20.w),
                alignment: Alignment.centerLeft,
                child: Text(
                  'O código de verificação foi enviado para xxx',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26.w,
                  ),
                ),
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
                    AppButton(
                      width: 150.w,
                      height: 54.w,
                      radius: 100.w,
                      colorList: const [Color(0xffFFD500), Color(0xffFF9901)],
                      text: 'Retirar',
                      onClick: () {

                      },
                    ),
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
                  onClick: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
