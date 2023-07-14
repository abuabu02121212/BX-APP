import 'package:flutter_comm/util/loading_util.dart';
import 'package:flutter_comm/util/system_util.dart';
import 'package:flutter_comm/widget/input_field.dart';
import 'package:get/get.dart';

import '../../../../http/request.dart';
import '../../../../http/verify_code_send_helper.dart';
import '../../../../util/Log.dart';

class RegisterController extends GetxController {
  final EditNode emailEditNode = EditNode();
  final EditNode phoneEditNode = EditNode();
  final EditNode keyEditNode = EditNode();
  final EditNode codeEditNode = EditNode();
  final isAgreed = true.obs;
  final selectedIndex = 0.obs;
  late VerifyCodeSender verifyCodeSender = VerifyCodeSender(phoneEditNode: phoneEditNode);

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  bool checkEmailRegInput() {
    emailEditNode.isDisplayErrHint.value = !emailExp.hasMatch(emailEditNode.text.value);
    keyEditNode.isDisplayErrHint.value = !pswRegExp.hasMatch(keyEditNode.text.value);
    codeEditNode.isDisplayErrHint.value = !emailExp.hasMatch(codeEditNode.text.value);
    return !emailEditNode.isDisplayErrHint.value && !keyEditNode.isDisplayErrHint.value && !codeEditNode.isDisplayErrHint.value;
  }

  bool checkPhoneRegInput() {
    phoneEditNode.isDisplayErrHint.value = !emailExp.hasMatch(phoneEditNode.text.value);
    keyEditNode.isDisplayErrHint.value = !pswRegExp.hasMatch(keyEditNode.text.value);
    codeEditNode.isDisplayErrHint.value = !emailExp.hasMatch(codeEditNode.text.value);
    return !phoneEditNode.isDisplayErrHint.value && !keyEditNode.isDisplayErrHint.value && !codeEditNode.isDisplayErrHint.value;
  }

  void register() {
    AppLoading.show();
    Map<String, Object> param = {};
    String username = '';
    bool inputIsOk = false;
    if (selectedIndex.value == 0) {
      username = emailEditNode.text.value;
      inputIsOk = checkEmailRegInput();
    } else {
      username = phoneEditNode.text.value;
      inputIsOk = checkPhoneRegInput();
    }
    Log.d("inputIsOk:$inputIsOk");
    if (!inputIsOk) return;
    param["username"] = username;
    param["password"] = keyEditNode.text.value;
    param["device_no"] = SysUtil.deviceId;
    // 图形验证码
    param["code"] = codeEditNode.text.value;
    // 图形验证码id
    param["vid"] = "";
    dynamic ret = apiRequest.requestRegister(param);
    AppLoading.close();
    Log.d("ret:$ret");
  }
}
