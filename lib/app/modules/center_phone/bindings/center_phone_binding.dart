import 'package:get/get.dart';

import '../controllers/center_phone_controller.dart';

class CenterPhoneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CenterPhoneController>(
      () => CenterPhoneController(),
    );
  }
}
