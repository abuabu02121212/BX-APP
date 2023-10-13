import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'message_center_state.dart';

class Message_centerLogic extends GetxController with SingleGetTickerProviderMixin{
  final Message_centerState state = Message_centerState();
  late final PageController pageController = PageController(initialPage: 0);
  late TabController tabController = TabController(
    initialIndex: 0,
    length: 5,
    vsync: this,
  );

  @override
  void onReady() {
    // TODO: implement onReady
    tabController = TabController(
      initialIndex: 0,
      length: 5,
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
