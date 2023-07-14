import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../util/Log.dart';
import '../../../../widget/horizontal_indicator_tab.dart';
import '../../mine/controllers/mine_controller.dart';

class MainController extends GetxController {
  PageController pageController = PageController();
  IndicatorTabController indicatorTabController = IndicatorTabController();

  @override
  void onInit() {
    super.onInit();
    Log.d("===========onInit================");
    Get.lazyPut(() => MineController());
  }

  @override
  void onClose() {
    Get.delete<MineController>();
    Log.d("===========onClose================");
    super.onClose();
  }
}
