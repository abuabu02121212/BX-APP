import 'package:flutter/material.dart';
import 'package:flutter_comm/app/component/app_header.dart';

import 'package:get/get.dart';

import '../controllers/component_test_controller.dart';

class ComponentTestView extends GetView<ComponentTestController> {
  const ComponentTestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leadingWidth: 0,
        title: const AppHeader(title: "页面标题"),
      ),
      body: const SafeArea(
        child: Text(
          'ComponentTestView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
