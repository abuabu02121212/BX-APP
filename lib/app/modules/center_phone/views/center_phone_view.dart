import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/center_phone_controller.dart';

class CenterPhoneView extends GetView<CenterPhoneController> {
  const CenterPhoneView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CenterPhoneView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'CenterPhoneView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
