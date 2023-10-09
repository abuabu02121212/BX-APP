import 'package:flutter/material.dart';
import 'package:flutter_comm/app/modules/deposit/views/deposit_view.dart';
import 'package:flutter_comm/app/modules/home/views/home_view.dart';
import 'package:flutter_comm/app/modules/main/views/tab_component.dart';
import 'package:flutter_comm/app/modules/my_ph/my_ph_view.dart';
import 'package:flutter_comm/app/modules/promotion_ph/promotion_ph_view.dart';
import 'package:flutter_comm/app/modules/vip_ph/vip_ph_view.dart';
import 'package:flutter_comm/app/routes/app_pages.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import '../../../../globe_controller.dart';
import '../../../../util/Log.dart';
import '../../../../widget/keep_alive_page.dart';
import '../../../app_style.dart';
import '../../login_register/views/login_regiseter_widget.dart';
import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: headerBgColor,
        titleSpacing: 0,
        leadingWidth: 0,
        elevation: 0,
        toolbarHeight: 0.w
      ),
      body: SafeArea(
        bottom: false,
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
                    switch (index) {
                      case 0:
                        return AliveWidget(child: HomeView());
                      case 1:
                        // return AliveWidget(child: PromotionView());
                        return const AliveWidget(child: PromotionPHPage());
                      case 2:
                        return AliveWidget(child: DepositView(isShowBack: false));
                      case 3:
                        // return AliveWidget(child: VipView());
                        return  const AliveWidget(child: Vip_phPage());
                        // return  Get.toNamed(Routes.VIP_PH);
                      case 4:
                        // return const AliveWidget(child: MineView());
                        return const AliveWidget(child: My_PHPage());
                    }
                    return const AliveWidget(child: SizedBox());
                  }),
            ),
            Positioned(
              left: 0.w,
              bottom: 0.w,
              child: Column(
                children: [
                  MainHorizontalTabComponent(
                    indicatorTabController: controller.indicatorTabController,
                    onSelectChanged: (pos) {
                      Log.d("==========onSelectChanged===pos:$pos====");
                      GlobeController globeController = Get.find<GlobeController>();
                      if (pos >= 9) {
                        if (!globeController.isLogin()) {
                          controller.indicatorTabController.back();
                          showLoginRegisterDialog();
                        } else {
                          Log.d("已经登陆");
                          if (pos == 9) {
                            controller.indicatorTabController.back();
                            Get.toNamed(Routes.DEPOSIT);
                          } else {
                            controller.pageController.jumpToPage(pos);
                          }
                        }
                      } else {
                        controller.pageController.jumpToPage(pos);
                      }
                    },
                  ),
                  Container(
                    width: 1.sw,
                    height: MediaQuery.of(context).padding.bottom,
                    color: bottomBgColor,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
