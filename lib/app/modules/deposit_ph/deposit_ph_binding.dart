import 'package:get/get.dart';

import 'deposit_ph_logic.dart';

class Deposit_PHBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Deposit_PHLogic());
  }
}
