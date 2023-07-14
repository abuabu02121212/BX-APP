import 'package:flutter/material.dart';
import 'package:flutter_comm/app/modules/deposit/controllers/deposit.dart';
import 'package:flutter_comm/app/modules/deposit/controllers/withdraw.dart';
import 'package:flutter_comm/app/modules/deposit/views/deposit_data.dart';
import 'package:get/get.dart';

import '../../../../widget/input_field.dart';

class DepositController extends GetxController with GetSingleTickerProviderStateMixin {

  late ScrollController scrollViewController;
  late TabController tabController;
  final arguments = Get.arguments;

  final depositControllerPage = DepositControllerPage();
  final withdrawControllerPage = WithdrawControllerPage();

  @override
  void onInit() {
    super.onInit();
    int index = arguments != null ? arguments['index'] : 0;
    depositControllerPage.onInit();
    withdrawControllerPage.onInit();
    scrollViewController = ScrollController();
    tabController = TabController(length: 2, vsync: this, initialIndex: index);
  }

  @override
  void onReady() {
    super.onReady();
    depositControllerPage.onReady();
    withdrawControllerPage.onReady();
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
