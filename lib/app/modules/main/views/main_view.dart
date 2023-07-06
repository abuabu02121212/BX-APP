import 'package:flutter/material.dart';
import 'package:flutter_comm/app/modules/main/views/tab_component.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MainView'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: Container(
              width: double.infinity,
              alignment: Alignment.center,
              color: Colors.purple,
              child: const Text(
                'MainView is working',
                style: TextStyle(fontSize: 20),
              ),
            )),
            const MainHorizontalTabComponent(),
          ],
        ),
      ),
    );
  }
}
