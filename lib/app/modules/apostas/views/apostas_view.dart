import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/apostas_controller.dart';

class ApostasView extends GetView<ApostasController> {
  const ApostasView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ApostasView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ApostasView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
