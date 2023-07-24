import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/security_center_controller.dart';

class SecurityCenterView extends GetView<SecurityCenterController> {
  const SecurityCenterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SecurityCenterView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SecurityCenterView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
