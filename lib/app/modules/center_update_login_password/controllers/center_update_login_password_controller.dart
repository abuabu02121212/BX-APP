import 'package:flutter_comm/http/request.dart';
import 'package:get/get.dart';

import '../../../../widget/input_field.dart';

class CenterUpdateLoginPasswordController extends GetxController {
  EditNode psw1EditNode = EditNode();
  EditNode psw2EditNode = EditNode();
  EditNode psw3EditNode = EditNode();

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

  bool checkInput() {
    psw1EditNode.isDisplayErrHint.value = !pswRegExp.hasMatch(psw1EditNode.text.value);
    psw2EditNode.isDisplayErrHint.value = !pswRegExp.hasMatch(psw2EditNode.text.value);
    psw3EditNode.isDisplayErrHint.value = !pswRegExp.hasMatch(psw3EditNode.text.value);
    bool isSame = psw2EditNode.text.value == psw3EditNode.text.value;
    return !psw1EditNode.isDisplayErrHint.value && !psw2EditNode.isDisplayErrHint.value && !psw3EditNode.isDisplayErrHint.value && isSame;
  }

  void requestMemberPasswordUpdate() {
    if (!checkInput()) {
      return;
    }
    apiRequest.requestMemberPasswordUpdate(params: {
      "old_password": psw1EditNode.text,
      "password": psw2EditNode.text,
      "confirm_password": psw3EditNode.text,
    });
  }
}
