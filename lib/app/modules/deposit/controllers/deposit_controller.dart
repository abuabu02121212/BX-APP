import 'package:flutter/material.dart';
import 'package:flutter_comm/app/modules/deposit/controllers/deposit.dart';
import 'package:flutter_comm/app/modules/deposit/controllers/withdraw.dart';
import 'package:flutter_comm/app/modules/deposit/views/deposit_data.dart';
import 'package:flutter_comm/util/toast_util.dart';
import 'package:get/get.dart';

import '../../../../globe_controller.dart';
import '../../../../widget/input_field.dart';
import '../../../entity/balance.dart';

class DepositController extends GetxController with GetSingleTickerProviderStateMixin {

  late ScrollController scrollViewController;
  late TabController tabController;
  int index = Get.arguments != null ? Get.arguments['index'] : 0;

  final depositControllerPage = DepositControllerPage();
  final withdrawControllerPage = WithdrawControllerPage();

  final globalController = Get.find<GlobeController>();
  late Rx<BalanceEntity?> balanceDetailInfo;


  @override
  void onInit() {
    super.onInit();
    balanceDetailInfo = globalController.balance;
    depositControllerPage.onInit();
    withdrawControllerPage.onInit();
    scrollViewController = ScrollController();
    tabController = TabController(length: 2, vsync: this, initialIndex: index);

    tabController.addListener(() {
      if (tabController.index == 1) {
        if (Get.isDialogOpen != true) {
          globalController.switchPayPasswordStatus();
        }
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
    depositControllerPage.onReady();
    withdrawControllerPage.onReady();
    if (index == 1) {
      globalController.switchPayPasswordStatus();
    }
  }

  @override
  void onClose() {
    scrollViewController.dispose();
    tabController.dispose();
    depositControllerPage.onClose();
    withdrawControllerPage.onClose();
    super.onClose();
  }
}
