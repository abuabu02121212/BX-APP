import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_comm/app/routes/app_pages.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../../util/toast_util.dart';
import '../../../component/app_button.dart';
import '../../../component/app_user_info_input_field.dart';
import '../../forget_psw/views/forget_psw_widget.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginView'),
        centerTitle: true,
      ),
      body: Center(
        child: LoginWidget(),
      ),
    );
  }
}

class LoginWidget extends StatelessWidget {
  LoginWidget({super.key}){
    Get.create<LoginController>(() => LoginController());
    controller = Get.put(LoginController());
  }

 late final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 650.w,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 50.w),
          Image.asset(
            "assets/images/login-logo.webp",
            width: 100.w,
          ),
          Text(
            "LB88",
            style: TextStyle(fontSize: 26.w, color: Colors.white, fontWeight: FontWeight.w400),
          ),
          Container(
            width: 580.w,
            margin: EdgeInsets.only(top: 10.w),
            child: UserInfoInputField(
              prefixIcon: 'assets/images/user-gray.webp',
              editNode: controller.userNameEditNode,
              hint: 'Por favor, insira o nome de usuário',
              errText: 'Número de celular de 10 ou 11 dígitos',
              isUserName: true,
            ),
          ),
          SizedBox(
            width: 580.w,
            child: UserInfoInputField(
              prefixIcon: 'assets/images/key-gray.webp',
              editNode: controller.keyEditNode,
              hint: 'Senha (4-12 letras e números)',
              errText: 'Senha (4-12 letras e números)',
              isPassword: true,
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: CupertinoButton(
              onPressed: () {
                Get.back();
                showForgetPswDialog();
              },
              minSize: 0,
              padding: EdgeInsets.zero,
              child: Container(
                width: 240.w,
                height: 46.w,
                margin: EdgeInsets.only(left: 30.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.w),
                  border: Border.all(color: const Color(0xff0ED1F4), width: 1.w),
                ),
                alignment: Alignment.center,
                child: Text(
                  "Esqueça a senha",
                  style: TextStyle(
                    fontSize: 26.w,
                    color: const Color(0xff0ED1F4),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
        //  SizedBox(height: 50.w),
          Expanded(
            child: Center(
              child: AppButton(
                width: 580.w,
                height: 90.w,
                radius: 100.w,
                text: 'Entrar',
                onClick: () {
                  // controller.login();
                  Get.toNamed(Routes.CENTER_BANK_LIST_ADD);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
