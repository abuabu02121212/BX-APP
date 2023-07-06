import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_comm/app/modules/home/views/tab_component.dart';
import 'package:flutter_comm/util/toast_util.dart';
import 'package:flutter_comm/widget/input_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import 'home_child_page.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("巴西足球"),
        backgroundColor: Colors.black,
        centerTitle: false,
      ),
      body: SafeArea(
        child: Container(
          color: Colors.black,
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: Column(
            children: [
              const HomeHorizontalTabComponent(),
              Expanded(
                child: PageView.builder(
                    itemCount: HomeHorizontalTabComponent.tabNames.length,
                    itemBuilder: (BuildContext context, int index) {
                      return HomeChildTabPage(key: ValueKey(index));
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
