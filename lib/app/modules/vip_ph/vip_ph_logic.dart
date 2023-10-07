import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'vip_ph_state.dart';

class Vip_phLogic extends GetxController with SingleGetTickerProviderMixin{
  final Vip_phState state = Vip_phState();
  late final PageController pageController  = PageController(initialPage: 0);
  late TabController tabController = TabController(
    initialIndex: 0,
    length: 4,
    vsync: this,
  );

  @override
  void onInit() {
    // TODO: implement onInit
    tabController = TabController(
        initialIndex: 0,
        length: 4,
        vsync: this,
    );
    super.onInit();

  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
