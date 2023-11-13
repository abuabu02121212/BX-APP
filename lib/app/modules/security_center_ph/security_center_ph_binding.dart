import 'package:get/get.dart';

import 'security_center_ph_logic.dart';

class Security_center_phBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Security_center_phLogic());
  }
}
