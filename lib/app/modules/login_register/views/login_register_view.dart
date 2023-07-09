import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_register_controller.dart';
import 'login_regiseter_widget.dart';

/// 登陆注册页面
class LoginRegisterView extends GetView<LoginRegisterController> {
  const LoginRegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LoginRegisterWidget(),
      ),
    );
  }
}
