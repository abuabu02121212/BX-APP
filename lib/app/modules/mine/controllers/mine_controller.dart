import 'package:flutter/animation.dart';
import 'package:get/get.dart';

import '../../../../globe_controller.dart';
import '../../../../http/comm_request.dart';
import '../../../../util/toast_util.dart';

class MineController extends GetxController with GetSingleTickerProviderStateMixin {
  //TODO: Implement MineController

  final count = 0.obs;

  final globeController = Get.find<GlobeController>();

  final userInfo = {}.obs;

  late AnimationController animationController;
  late Animation<double> rotationAnimation;

  void refreshBalance() async {
    animationController.repeat();
    await requestCommBalance();
    animationController.forward();
    Toast.show("Atualizado com sucesso");
  }

  // 获取当前进度
  double getProgress() {
    double p = double.parse(globeController.userInfoEntity.value?.depositAmount ?? '0') / double.parse(globeController.userInfoEntity.value?.nextDeposit ?? '0');
    return p;
  }


  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(duration: const Duration(seconds: 1), vsync: this);
    rotationAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(animationController);
    print('初始化MineController');
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }

  void increment() => count.value++;
}
