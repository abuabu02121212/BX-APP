import 'package:flutter/animation.dart';
import 'package:flutter_comm/app/entity/sign_config_data.dart';
import 'package:get/get.dart';

import '../../../../globe_controller.dart';
import '../../../../http/comm_request.dart';
import '../../../../http/request.dart';
import '../../../../util/toast_util.dart';

class MineController extends GetxController with GetSingleTickerProviderStateMixin {
  //TODO: Implement MineController

  final count = 0.obs;

  final globeController = Get.find<GlobeController>();

  final userInfo = {}.obs;

  final signProBonus = 0.0.obs;

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

  // 获取活动配置
  void requestSignConfig() async {
    try {
      var result = await apiRequest.requestSignConfig();
      int vip = int.parse(globeController.userInfoEntity.value?.vip ?? '0');
      List<SignConfigData> signConfigData = [];
      for (var item in result) {
        signConfigData.add(SignConfigData.fromJson(item));
      }
      final vipObj = signConfigData.firstWhere((element) => element.vip == vip).toJson();
      /**
       * {
          "vip": 1,
          "sign1_amount": "10.0000",
          "sign2_amount": "20.0000",
          "sign3_amount": "40.0000",
          "sign4_amount": "80.0000",
          "sign5_amount": "160.0000",
          "sign6_amount": "320.0000",
          "sign7_amount": "640.0000"
          },
       */
      // 循环相加
      double total = 0;
      for (var i = 1; i <= 7; i++) {
        total += double.parse(vipObj['sign${i}_amount'] ?? '0');
      }
      signProBonus.value = total;
    } catch (e) {
      print(e);
      signProBonus.value = 0;
    }
  }


  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(duration: const Duration(seconds: 1), vsync: this);
    rotationAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(animationController);
    requestSignConfig();
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
