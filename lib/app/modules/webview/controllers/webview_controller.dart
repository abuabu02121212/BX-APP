import 'package:get/get.dart';

import '../../../../util/weburl_util.dart';

class WebviewController extends GetxController {
  //TODO: Implement WebviewController
  RxBool isAppBarVisible = true.obs;

  String title = Get.arguments['title'] ?? '';
  String url = Get.arguments['url'] ?? '';

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
