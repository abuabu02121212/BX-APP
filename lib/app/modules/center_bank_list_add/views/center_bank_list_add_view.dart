import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/center_bank_list_add_controller.dart';

class CenterBankListAddView extends GetView<CenterBankListAddController> {
  const CenterBankListAddView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CenterBankListAddView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'CenterBankListAddView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
