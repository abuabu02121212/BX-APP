import 'package:flutter_comm/util/toast_util.dart';
import 'package:get/get.dart';

import '../../../../util/sp_util.dart';
import '../../../../util/sp_util_key.dart';
import '../../../../util/weburl_util.dart';

class WebviewController extends GetxController {
  //TODO: Implement WebviewController
  RxBool isAppBarVisible = true.obs;

  String title = Get.arguments['title'] ?? '';
  String url = Get.arguments['url'] ?? '';

  @override
  void onInit() {
    Toast.show('加载url地址: $url, token=${spUtil.getString(keyLoginToken) ?? "空"}');
    print('加载url地址: $url, token=${spUtil.getString(keyLoginToken) ?? ""}');
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
