import 'package:get/get.dart';

import 'interest_logic.dart';

class InterestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InterestLogic());
  }
}
