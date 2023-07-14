import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../mine/controllers/mine_controller.dart';

class MainController extends GetxController {
  //TODO: Implement MainController
  PageController pageController = PageController();


  @override
  void onInit() {
    super.onInit();
    Get.lazyPut(() => MineController());
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    Get.delete<MineController>();
    super.onClose();
  }

}
