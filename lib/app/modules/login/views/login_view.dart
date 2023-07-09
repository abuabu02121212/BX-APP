import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../component/app_user_info_input_field.dart';
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
  LoginWidget({super.key});

  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 40.w),
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
            prefixIcon: 'assets/images/user-gray.webp',
            editNode: controller.userNameEditNode,
            hint: 'Senha (4-12 letras e números)',
            errText: 'Senha (4-12 letras e números)',
            isPassword: true,
          ),
        ),
      ],
    );
  }
}
