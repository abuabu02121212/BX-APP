import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_comm/app/modules/deposit/views/deposit_view.dart';
import 'package:flutter_comm/app/modules/home/views/home_view.dart';
import 'package:flutter_comm/app/modules/main/views/tab_component.dart';
import 'package:flutter_comm/app/modules/mine/views/mine_view.dart';
import 'package:flutter_comm/app/modules/promotion/views/promotion_view.dart';
import 'package:flutter_comm/app/modules/vip/views/vip_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../../util/Log.dart';
import '../../../../util/toast_util.dart';
import '../../../app_style.dart';
import '../../../routes/app_pages.dart';
import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  MainView({Key? key}) : super(key: key);
  final List<Widget> pageList = [const HomeView(), const PromotionView(), const DepositView(), const VipView(), const MineView()];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: statusBarColor));
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0.w),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: Container(
              width: double.infinity,
              alignment: Alignment.center,
              color: Colors.purple,
              child: PageView.builder(
                  itemCount: 5,
                  controller: controller.pageController,
                  itemBuilder: (BuildContext context, int index) {
                    return pageList[index];
                  }),
            )),
            MainHorizontalTabComponent(
              onSelectChanged: (pos) {
                controller.pageController.jumpToPage(pos);
                Toast.show("$pos");
                if (pos == 5) {
                  Log.d("去组件测试页面");
                  Get.toNamed(Routes.COMPONENT_TEST);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
