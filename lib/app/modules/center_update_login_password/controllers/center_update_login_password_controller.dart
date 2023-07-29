import 'package:flutter_comm/http/request.dart';
import 'package:get/get.dart';

import '../../../../http/ret_code.dart';
import '../../../../util/Log.dart';
import '../../../../util/loading_util.dart';
import '../../../../widget/input_field.dart';

class CenterUpdateLoginPasswordController extends GetxController {
  EditNode psw1EditNode = EditNode(regExp: pswRegExp);
  EditNode psw2EditNode = EditNode(regExp: pswRegExp);
  EditNode psw3EditNode = EditNode(regExp: pswRegExp, isNotVerifyOnErr: true);

  bool checkInput() {
    bool isSame = psw2EditNode.text.value == psw3EditNode.text.value;
    bool isOk = !psw1EditNode.checkInput() && !psw2EditNode.checkInput() && !psw3EditNode.checkInput() && isSame;
    return isOk;
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
    } catch (e, stack) {
      Log.e("$e \n $stack");
    }
    AppLoading.close();
  }
}
