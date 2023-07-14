import 'package:get/get.dart';

import '../../../../globe_controller.dart';

class MineController extends GetxController {
  //TODO: Implement MineController

  final count = 0.obs;

  final globeController = Get.find<GlobeController>();

  final userInfo = {}.obs;

  void initUserInfo() {

  }

  // 获取当前进度
  double getProgress() {
    double p = double.parse(globeController.userInfoEntity.value?.depositAmount ?? '0') / double.parse(globeController.userInfoEntity.value?.nextDeposit ?? '0');
    return p;
  }


  @override
  void onInit() {
    super.onInit();
    print('初始化MineController');
    initUserInfo();
    // Get.put(MineController());
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
