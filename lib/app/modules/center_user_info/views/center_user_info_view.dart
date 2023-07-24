import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/center_user_info_controller.dart';

class CenterUserInfoView extends GetView<CenterUserInfoController> {
  const CenterUserInfoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CenterUserInfoView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'CenterUserInfoView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
