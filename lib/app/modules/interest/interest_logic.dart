import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'interest_state.dart';

class InterestLogic extends GetxController
    with SingleGetTickerProviderMixin {
  final InterestState state = InterestState();

  late final PageController pageController = PageController(initialPage: 0);
  late TabController tabController = TabController(
    initialIndex: 0,
    length: 3,
    vsync: this,
  );

  @override
  void onReady() {
    // TODO: implement onReady
    tabController = TabController(
      initialIndex: 0,
      length: 3,
      vsync: this,
    );
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
