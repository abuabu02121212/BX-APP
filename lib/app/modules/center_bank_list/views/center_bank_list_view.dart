import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/center_bank_list_controller.dart';

class CenterBankListView extends GetView<CenterBankListController> {
  const CenterBankListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CenterBankListView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'CenterBankListView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
