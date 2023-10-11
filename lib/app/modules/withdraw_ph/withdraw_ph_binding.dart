import 'package:get/get.dart';

import 'withdraw_ph_logic.dart';

class Withdraw_phBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Withdraw_phLogic());
  }
}
