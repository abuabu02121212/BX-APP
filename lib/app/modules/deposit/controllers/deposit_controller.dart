import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../widget/input_field.dart';

class DepositController extends GetxController with GetSingleTickerProviderStateMixin {
  //TODO: Implement DepositController

  final count = 0.obs;
  final amountIndex = 0.obs;

  late ScrollController scrollViewController;
  late TabController tabController;
  EditNode amountNode = EditNode();

  final arguments = Get.arguments;

  setAmountValue(String value) {
    amountNode.editController.text = value;
    print('amountNode.editController.text: ${amountNode.text}');
  }


  @override
  void onInit() {
    super.onInit();
    int index = arguments != null ? arguments['index'] : 0;
    scrollViewController = ScrollController();
    tabController = TabController(length: 2, vsync: this, initialIndex: index);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    scrollViewController.dispose();
    tabController.dispose();
    amountNode.dispose();
  }

  void increment() => count.value++;
}
