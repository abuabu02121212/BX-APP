import 'package:flutter_comm/http/comm_request.dart';
import 'package:get/get.dart';

import '../../../../app_config.dart';
import '../../../../globe_controller.dart';
import '../../../../util/Log.dart';
import '../../../routes/app_pages.dart';

class SecurityCenterController extends GetxController {
  final GlobeController globeController = Get.find<GlobeController>();

  List<RxBool> isShowList1 = [false.obs, false.obs, false.obs, false.obs, false.obs, false.obs];
  List<RxBool> isShowList2 = [true.obs, true.obs, true.obs, true.obs, true.obs, true.obs];
  List<RxBool> isShowList3 = [true.obs, true.obs, true.obs, true.obs, true.obs, true.obs];

  Future<void> refreshData() async {
    await requestUserInfo();
    setupData();
  }

  void setupData() {
    isShowList1[0].value = globeController.isUserKeyInfoAllSetup();
    isShowList2[0].value = !isShowList1[0].value;

    /// 更新手机UI显示状态
    isShowList1[4].value = !globeController.isNeedBindPhone();
    isShowList2[4].value = !isShowList1[4].value;
    isShowList3[4].value = !isShowList1[4].value;

    /// 更新邮箱UI显示状态
    isShowList1[5].value = !globeController.isNeedBindEmail();
    isShowList2[5].value = !isShowList1[5].value;
    isShowList3[5].value = !isShowList1[5].value;
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
