import 'package:flutter_comm/widget/input_field.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {

  final EditNode emailEditNode = EditNode();
  final EditNode phoneEditNode = EditNode();
  final EditNode keyEditNode = EditNode();
  final EditNode codeEditNode = EditNode();
  final isAgreed = true.obs;
  final selectedIndex = 0.obs;
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

}
