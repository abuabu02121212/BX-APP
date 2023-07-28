import 'package:flutter_comm/http/comm_request.dart';
import 'package:get/get.dart';

import '../../../../app_config.dart';
import '../../../../globe_controller.dart';
import '../../../../util/Log.dart';
import '../../../routes/app_pages.dart';

class SecurityCenterController extends GetxController {
  final GlobeController globeController = Get.find<GlobeController>();

  late var isShowBindPhone = globeController.isShowingBindPhone();
  List<RxBool> isSetupList = [false.obs, false.obs, false.obs, false.obs, false.obs, false.obs];

  Future<void> refreshData() async {
    await requestUserInfo();
    setupData();
  }

  void setupData() {
    isSetupList[0].value = globeController.isUserKeyInfoAllSetup();
    for (var element in isSetupList) {
      element.refresh();
      Log.d("element:${element.value}");
    }
  }

  late var popLister = (route, previousRoute) {
    var previousRouteName = previousRoute?.settings.name;
    if (previousRouteName == Routes.SECURITY_CENTER) {
      refreshData();
      Log.d("回到了安全中心页面");
    }
  };

  @override
  void onInit() {
    super.onInit();
    setupData();
    appNavigatorObserver.addPopListener(popLister);
  }

  @override
  void onClose() {
    appNavigatorObserver.removePopListener(popLister);
    super.onClose();
  }


}
