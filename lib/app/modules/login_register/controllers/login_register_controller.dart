import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginRegisterController extends GetxController {

  PageController pageController = PageController();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
