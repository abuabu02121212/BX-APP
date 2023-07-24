import 'package:get/get.dart';

import '../controllers/center_pay_password_controller.dart';

class CenterPayPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CenterPayPasswordController>(
      () => CenterPayPasswordController(),
    );
  }
}
