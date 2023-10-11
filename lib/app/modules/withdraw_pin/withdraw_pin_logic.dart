import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'withdraw_pin_state.dart';

class Withdraw_pinLogic extends GetxController {
  final Withdraw_pinState state = Withdraw_pinState();

  TextEditingController controller = TextEditingController(text: "");
  String thisText = "";
  int pinLength = 6;
  var hasError = true.obs;
  String? errorMessage;

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
