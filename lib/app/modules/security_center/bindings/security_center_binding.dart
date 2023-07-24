import 'package:get/get.dart';

import '../controllers/security_center_controller.dart';

class SecurityCenterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SecurityCenterController>(
      () => SecurityCenterController(),
    );
  }
}
