import 'package:get/get.dart';

import '../controllers/center_user_info_controller.dart';

class CenterUserInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CenterUserInfoController>(
      () => CenterUserInfoController(),
    );
  }
}
