import 'package:flutter_comm/http/phone_code_send_helper.dart';
import 'package:flutter_comm/widget/input_field.dart';
import 'package:get/get.dart';

class CenterPhoneController extends GetxController {

  EditNode phoneEditNode = EditNode();
  EditNode emailEditNode = EditNode();
  EditNode codeEditNode = EditNode();
  late CodeSender phoneCodeSender = CodeSender(tarEditNode: phoneEditNode, regExp: phoneNumExp, isForgetPsw: true);
  late CodeSender emailCodeSender = CodeSender(tarEditNode: emailEditNode, regExp: emailExp, codeType: 2, isForgetPsw: true);

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
