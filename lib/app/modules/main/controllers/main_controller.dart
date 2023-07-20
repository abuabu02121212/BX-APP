import 'package:flutter/cupertino.dart';
import 'package:flutter_comm/app/entity/app_upgrade.dart';
import 'package:flutter_comm/util/app_util.dart';
import 'package:flutter_comm/util/toast_util.dart';
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

  void changeSelectedTab(int selectedIndex){
    indicatorTabController.onItemSelectChanged(selectedIndex);
  }

  void toHome(){
   // Get.until((router) => router.settings.name == Routes.SPLASH);
    Log.d("当前路由是：${appNavigatorObserver.curRouterName} list:${appNavigatorObserver.routerNameList}");
    changeSelectedTab(0);
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
    Log.d("===========onInit================");
    Get.lazyPut(() => MineController());
    getAppUpgradeInfo();
  }

  @override
  void onClose() {
    Get.delete<MineController>();
    Log.d("===========onClose================");
    super.onClose();
  }
}
