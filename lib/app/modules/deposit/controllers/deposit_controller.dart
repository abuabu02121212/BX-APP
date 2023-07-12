import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DepositController extends GetxController with GetSingleTickerProviderStateMixin {
  //TODO: Implement DepositController

  final count = 0.obs;
  final amountIndex = 0.obs;

  late ScrollController scrollViewController;
  late TabController tabController;


  @override
  void onInit() {
    super.onInit();
    scrollViewController = ScrollController();
    tabController = TabController(length: 3, vsync: this);
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
  }

  void increment() => count.value++;
}
