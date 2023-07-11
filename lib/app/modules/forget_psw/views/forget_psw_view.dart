import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/forget_psw_controller.dart';

class ForgetPswView extends GetView<ForgetPswController> {
  const ForgetPswView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ForgetPswView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ForgetPswView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
