import 'package:get/get.dart';

import '../controllers/center_bank_list_controller.dart';

class CenterBankListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CenterBankListController>(
      () => CenterBankListController(),
    );
  }
}
