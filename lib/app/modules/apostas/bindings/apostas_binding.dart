import 'package:get/get.dart';

import '../controllers/apostas_controller.dart';

class ApostasBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApostasController>(
      () => ApostasController(),
    );
  }
}
