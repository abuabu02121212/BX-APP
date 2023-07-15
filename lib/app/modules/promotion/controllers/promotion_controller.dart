import 'package:get/get.dart';

import '../../../../util/Log.dart';
import '../../../entity/promotion_entity.dart';

class PromotionController extends GetxController {
  final List<List<PromotionEntity>> listData = PromotionEntity.getLocalData();
  final selectedIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    Log.d("=======PromotionController=======onInit==============");
  }
}
