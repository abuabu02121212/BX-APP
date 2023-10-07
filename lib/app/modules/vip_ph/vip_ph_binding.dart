import 'package:get/get.dart';

import 'vip_ph_logic.dart';

class Vip_phBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Vip_phLogic());
  }
}
