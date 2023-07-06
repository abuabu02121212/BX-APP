import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/component_test_controller.dart';

class ComponentTestView extends GetView<ComponentTestController> {
  const ComponentTestView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ComponentTestView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ComponentTestView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
