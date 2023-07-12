import 'package:get/get.dart';

import '../controllers/home_menu_controller.dart';

class HomeMenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeMenuController>(
      () => HomeMenuController(),
    );
  }
}
