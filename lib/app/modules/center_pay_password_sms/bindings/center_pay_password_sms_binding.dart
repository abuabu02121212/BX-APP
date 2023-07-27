import 'package:get/get.dart';

import '../controllers/center_pay_password_sms_controller.dart';

class CenterPayPasswordSmsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CenterPayPasswordSmsController>(
      () => CenterPayPasswordSmsController(),
    );
  }
}
