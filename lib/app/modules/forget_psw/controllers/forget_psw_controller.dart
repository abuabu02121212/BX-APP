import 'package:get/get.dart';

import '../../../../http/phone_code_send_helper.dart';
import '../../../../widget/input_field.dart';

class ForgetPswController extends GetxController {
  final EditNode emailEditNode = EditNode();
  final EditNode emailKeyEditNode = EditNode();
  final EditNode emailCodeEditNode = EditNode();

  final EditNode phoneEditNode = EditNode();
  final EditNode phoneKeyEditNode = EditNode();
  final EditNode phoneCodeEditNode = EditNode();

  late CodeSender phoneCodeSender = CodeSender(tarEditNode: phoneEditNode, regExp: phoneNumExp);
  late CodeSender emailCodeSender = CodeSender(tarEditNode: phoneEditNode, regExp: phoneNumExp, codeType: 2);
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
