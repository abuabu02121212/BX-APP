import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/center_update_login_password_controller.dart';

class CenterUpdateLoginPasswordView
    extends GetView<CenterUpdateLoginPasswordController> {
  const CenterUpdateLoginPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CenterUpdateLoginPasswordView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'CenterUpdateLoginPasswordView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
