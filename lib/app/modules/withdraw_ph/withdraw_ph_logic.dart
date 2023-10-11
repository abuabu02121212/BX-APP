import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../generated/l10n.dart';
import 'withdraw_ph_state.dart';

class Withdraw_phLogic extends GetxController
    with SingleGetTickerProviderMixin {
  final Withdraw_phState state = Withdraw_phState();
  late final PageController pageController = PageController(initialPage: 0);
  late TabController tabController = TabController(
    initialIndex: 0,
    length: 4,
    vsync: this,
  );

  var index = 4.abs();
  var list_name = [0, 1, 2, 3, 4, 5, 1, 2, 3, 4, 5];
  var list_name1 = [0, 1, 2, 3, 4, 5];

  final List<String> imgListY = [
    '4',
    '2',
    '1',
    '3',
    '5',
    '6',
  ];

  final List<String> nameList = [
    S.current.cards,
    S.current.finishing,
    S.current.slot,
    S.current.live,
    S.current.support,
    S.current.cockFighting,
  ];

  var index3 = 0.obs;

  TextEditingController controller = TextEditingController(text: "");
  String thisText = "";
  int pinLength = 6;
  var hasError = true.obs;
  String? errorMessage;

  @override
  void onReady() {
    // TODO: implement onReady
    tabController = TabController(
      initialIndex: 0,
      length: 4,
      vsync: this,
    );
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    controller.dispose();
    super.onClose();
  }
}
