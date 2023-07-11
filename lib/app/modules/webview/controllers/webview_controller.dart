import 'package:get/get.dart';

class WebviewController extends GetxController {
  //TODO: Implement WebviewController
   RxBool isAppBarVisible = true.obs;

  final count = 0.obs;
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
