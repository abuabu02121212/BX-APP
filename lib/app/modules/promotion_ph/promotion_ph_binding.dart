import 'package:flutter_comm/app/modules/promotion_ph/promotion_ph_logic.dart';
import 'package:get/get.dart';

class PromotionPHBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PromotionPHLogic>(
          () => PromotionPHLogic(),
    );
  }
}
