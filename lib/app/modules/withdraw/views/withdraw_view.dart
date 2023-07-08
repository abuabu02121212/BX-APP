import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/withdraw_controller.dart';

class WithdrawView extends GetView<WithdrawController> {
  const WithdrawView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WithdrawView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'WithdrawView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
