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
import '../../../../globe_controller.dart';
import '../../../../util/Log.dart';
import '../../../../util/toast_util.dart';
import '../../../../widget/keep_alive_page.dart';
import '../../../app_style.dart';
import '../../login_register/views/login_regiseter_widget.dart';
import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  MainView({Key? key}) : super(key: key);
  final List<Widget> pageList = [const HomeView(), PromotionView(), const DepositView(), const VipView(), const MineView()];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: statusBarColor));
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0.w),
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: PageView.builder(
                  itemCount: 5,
                  physics: const NeverScrollableScrollPhysics(),
                  controller: controller.pageController,
                  itemBuilder: (BuildContext context, int index) {
                    return AliveWidget(child: pageList[index]);
                  }),
            ),
            Positioned(
              left: 0.w,
              bottom: 0.w,
              child: MainHorizontalTabComponent(
                indicatorTabController: controller.indicatorTabController,
                onSelectChanged: (pos) {
                  GlobeController globeController = Get.find<GlobeController>();
                  if (pos >= 2) {
                    if (!globeController.isLogin()) {
                      Log.d("还没有登陆");
                      controller.indicatorTabController.back();
                      showLoginRegisterDialog();
                    } else {
                      Log.d("已经登陆");
                      controller.pageController.jumpToPage(pos);
                    }
                  } else {
                    controller.pageController.jumpToPage(pos);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
