import 'package:get/get.dart';

import 'my_ph_logic.dart';

class My_PHBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => My_PHLogic());
  }
}
