import 'package:get/get.dart';

import '../controllers/forget_psw_controller.dart';

class ForgetPswBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgetPswController>(
      () => ForgetPswController(),
    );
  }
}
