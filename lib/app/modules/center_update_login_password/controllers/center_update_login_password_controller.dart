import 'package:flutter_comm/http/request.dart';
import 'package:get/get.dart';

import '../../../../http/ret_code.dart';
import '../../../../util/Log.dart';
import '../../../../util/loading_util.dart';
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
    Log.d("psw1EditNode.isDisplayErrHint.value:${psw1EditNode.isDisplayErrHint.value}");
    bool isSame = psw2EditNode.text.value == psw3EditNode.text.value;
    return !psw1EditNode.isDisplayErrHint.value && !psw2EditNode.isDisplayErrHint.value && !psw3EditNode.isDisplayErrHint.value && isSame;
  }

  Future<void> requestMemberPasswordUpdate() async {
    if (!checkInput()) {
      Log.d("输入校验失败...");
      return;
    }
    AppLoading.show();
    try {
      var ret = await apiRequest.requestMemberPasswordUpdate(params: {
        "old_password": psw1EditNode.text.value,
        "password": psw2EditNode.text.value,
        "confirm_password": psw3EditNode.text.value,
      });
      if (ret == retCodeSuccess) {
        Get.back();
      }
      Log.d("ret: $ret");
    } catch (e) {
      Log.e(e);
    }
    AppLoading.close();
  }
}
