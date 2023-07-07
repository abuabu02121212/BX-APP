import 'package:get/get.dart';

import '../controllers/component_test_controller.dart';

class ComponentTestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ComponentTestController>(
      () => ComponentTestController(),
    );
  }
}
