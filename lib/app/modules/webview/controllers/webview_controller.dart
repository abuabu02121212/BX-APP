import 'package:get/get.dart';

class WebviewController extends GetxController {
  //TODO: Implement WebviewController
   RxBool isAppBarVisible = true.obs;

  final title = Get.arguments['title'] ?? '';
  final url = Get.arguments['url'] ?? '';

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

}
