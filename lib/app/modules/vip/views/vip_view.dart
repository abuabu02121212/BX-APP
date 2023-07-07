import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/vip_controller.dart';

class VipView extends GetView<VipController> {
  const VipView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VipView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'VipView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
