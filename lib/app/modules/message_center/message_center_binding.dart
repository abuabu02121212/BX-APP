import 'package:get/get.dart';

import 'message_center_logic.dart';

class Message_centerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Message_centerLogic());
  }
}
