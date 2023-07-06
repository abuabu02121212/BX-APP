import 'package:flutter/material.dart';
import 'package:flutter_comm/app/component/app_header.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../../util/toast_util.dart';
import '../../../component/app_button.dart';
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
      body: SafeArea(
        child: ListView(children: [
          Container(
            color: Colors.purple,
            padding: const EdgeInsets.all(5),
            child: AppButton(
              width: 240.w,
              height: 80.w,
              radius: 40.w,
              text: 'Button示例',
              onClick: () {
                Toast.show("按钮被点击");
              },
            ),
          ),
        ]),
      ),
    );
  }
}
