import 'package:get/get.dart';

import 'personal_information_logic.dart';

class Personal_informationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Personal_informationLogic());
  }
}
