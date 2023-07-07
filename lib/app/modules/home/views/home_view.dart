import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_comm/app/modules/home/views/tab_component.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../app_style.dart';
import '../controllers/home_controller.dart';
import 'home_child_page.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 0,
        titleSpacing: 0,
        toolbarHeight: 110.w,
        title: Container(
          width: double.infinity,
          height: 110.w,
          decoration: BoxDecoration(gradient: headerLinearGradient),
        ),
        centerTitle: true,
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
           //   const HomeHorizontalTabComponent(),
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
