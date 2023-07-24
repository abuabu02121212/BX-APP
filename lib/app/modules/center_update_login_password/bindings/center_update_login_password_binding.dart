import 'package:get/get.dart';

import '../controllers/center_update_login_password_controller.dart';

class CenterUpdateLoginPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CenterUpdateLoginPasswordController>(
      () => CenterUpdateLoginPasswordController(),
    );
  }
}
