import 'package:get/get.dart';

class ComponentTestController extends GetxController {
  //TODO: Implement ComponentTestController

  final count = 0.obs;
  final check = false.obs;
  @override
  void onInit() {
    super.onInit();
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
