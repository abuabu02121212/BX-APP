import 'package:get/get.dart';

import '../controllers/center_bank_list_add_controller.dart';

class CenterBankListAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CenterBankListAddController>(
      () => CenterBankListAddController(),
    );
  }
}
