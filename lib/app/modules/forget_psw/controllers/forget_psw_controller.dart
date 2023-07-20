import 'package:get/get.dart';

import '../../../../http/phone_code_send_helper.dart';
import '../../../../widget/input_field.dart';

class ForgetPswController extends GetxController {
  final EditNode phoneEditNode = EditNode();
  final EditNode keyEditNode = EditNode();
  final EditNode codeEditNode = EditNode();
  late CodeSender phoneCodeSender = CodeSender(tarEditNode: phoneEditNode, regExp: phoneNumExp);
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
