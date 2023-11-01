import 'package:flutter/cupertino.dart';
import 'package:flutter_comm/app/entity/app_upgrade.dart';
import 'package:flutter_comm/util/app_util.dart';
import 'package:get/get.dart';

import '../../../../app_config.dart';
import '../../../../http/request.dart';
import '../../../../util/Log.dart';
import '../../../../util/dialog.dart';
import '../../../../widget/horizontal_indicator_tab.dart';
import '../../../routes/app_pages.dart';
import '../../mine/controllers/mine_controller.dart';

class MainController extends GetxController {
  PageController pageController = PageController();
  IndicatorTabController indicatorTabController = IndicatorTabController();

  final index = 0.obs;

  void changeSelectedTab(int selectedIndex){
    indicatorTabController.onItemSelectChanged(selectedIndex);
  }

  void toHome(){
     Get.until((router){
      // Log.d("当前路由是：${appNavigatorObserver.curRouterName} list:${appNavigatorObserver.routerNameList}");
       bool isAlive = appNavigatorObserver.curRouterName == Routes.SPLASH;
       Log.d("=============isAlive:$isAlive===========================");
       return isAlive;
     });
    changeSelectedTab(0);
  }

  void toDepost(){
    Get.until((router){
      // Log.d("当前路由是：${appNavigatorObserver.curRouterName} list:${appNavigatorObserver.routerNameList}");
      bool isAlive = appNavigatorObserver.curRouterName == Routes.SPLASH;
      Log.d("=============isAlive:$isAlive===========================");
      return isAlive;
    });
    changeSelectedTab(2);
  }

  void toVip(){
    Get.until((router){
      // Log.d("当前路由是：${appNavigatorObserver.curRouterName} list:${appNavigatorObserver.routerNameList}");
      bool isAlive = appNavigatorObserver.curRouterName == Routes.SPLASH;
      Log.d("=============isAlive:$isAlive===========================");
      return isAlive;
    });
    changeSelectedTab(3);
  }
  getAppUpgradeInfo() async {
    try {
      final d = await apiRequest.requestAppUpdate();
      AppUpgradeData appUpgrade = AppUpgradeData.fromJson(d);
      String version = appUpgrade.version ?? "";
      if (version.isNotEmpty) {
        if (await AppUtil.compareVersion(version)) {
          AppDialog.showUpdateAppDialog(appUpgrade);
        }
      }
    } catch (e) {
      Log.e("获取app更新信息失败");
    }
  }

  @override
  void onInit() {
    super.onInit();
    Get.lazyPut(() => MineController());
    getAppUpgradeInfo();
    Log.d("===========onInit=====finished===========");
  }

  @override
  void onClose() {
    Get.delete<MineController>();
    Log.d("===========onClose================");
    super.onClose();
  }
}
