import 'package:get/get.dart';

import 'change_profile_logic.dart';

class Change_profileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Change_profileLogic());
  }
}
