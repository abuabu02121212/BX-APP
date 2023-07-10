import 'package:get/get.dart';

class MineController extends GetxController {
  //TODO: Implement MineController

  final count = 0.obs;
  // 头像下标
  final avatarIndex = 0.obs;
  @override
  void onInit() {
    super.onInit();
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
