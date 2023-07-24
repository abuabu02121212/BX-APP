import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/center_pay_password_controller.dart';

class CenterPayPasswordView extends GetView<CenterPayPasswordController> {
  const CenterPayPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CenterPayPasswordView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'CenterPayPasswordView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
