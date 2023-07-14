import 'package:get/get.dart';

import '../../../../globe_controller.dart';

class MineController extends GetxController {
  //TODO: Implement MineController

  final count = 0.obs;
  // 头像下标
  final avatarIndex = 0.obs;

  final globeController = Get.find<GlobeController>();

  final userInfo = {}.obs;

  void initUserInfo() {

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
