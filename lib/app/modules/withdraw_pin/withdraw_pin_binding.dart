import 'package:get/get.dart';

import 'withdraw_pin_logic.dart';

class Withdraw_pinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Withdraw_pinLogic());
  }
}
