import 'package:get/get.dart';

import '../controllers/recompensas_controller.dart';

class RecompensasBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RecompensasController>(
      () => RecompensasController(),
    );
  }
}
