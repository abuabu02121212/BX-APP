import 'package:flutter_comm/util/loading_util.dart';
import 'package:flutter_comm/util/system_util.dart';
import 'package:flutter_comm/widget/input_field.dart';
import 'package:get/get.dart';

import '../../../../http/phone_code_send_helper.dart';
import '../../../../http/request.dart';
import '../../../../util/Log.dart';
import '../../../../util/toast_util.dart';

class RegisterController extends GetxController {
  final EditNode emailEditNode = EditNode();
  final EditNode phoneEditNode = EditNode();
  final EditNode keyEditNode = EditNode();
  final EditNode key2EditNode = EditNode();
  final EditNode codeEditNode = EditNode();
  final EditNode code2EditNode = EditNode();
  final isAgreed = true.obs;
  final selectedIndex = 0.obs;
  late CodeSender verifyCodeSender = CodeSender(tarEditNode: phoneEditNode, regExp: phoneNumExp);

  bool checkEmailRegInput() {
    emailEditNode.isDisplayErrHint.value = !emailExp.hasMatch(emailEditNode.text.value);
    keyEditNode.isDisplayErrHint.value = !pswRegExp.hasMatch(keyEditNode.text.value);
    codeEditNode.isDisplayErrHint.value = !codeRegExp.hasMatch(codeEditNode.text.value);
    return !emailEditNode.isDisplayErrHint.value && !keyEditNode.isDisplayErrHint.value && !codeEditNode.isDisplayErrHint.value;
  }

  bool checkPhoneRegInput() {
    phoneEditNode.isDisplayErrHint.value = !phoneNumExp.hasMatch(phoneEditNode.text.value);
    key2EditNode.isDisplayErrHint.value = !pswRegExp.hasMatch(key2EditNode.text.value);
    code2EditNode.isDisplayErrHint.value = !codeRegExp.hasMatch(code2EditNode.text.value);
    return !phoneEditNode.isDisplayErrHint.value && !key2EditNode.isDisplayErrHint.value && !code2EditNode.isDisplayErrHint.value;
  }

  void register() {
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
    if(!verifyCodeSender.isHasSuccessSendVerifyCode){
      Toast.show("Please send code at first");
      return;
    }
    AppLoading.show();
    if (selectedIndex.value == 0) {
      param["email"] = username;
    }else{
      param["phone"] = username;
    }
    param["password"] = keyEditNode.text.value;
    param["sid"] = verifyCodeSender.sid;
    param["ts"] = verifyCodeSender.ts;
    param["device_no"] = SysUtil.deviceId;
    param["verify_code"] = codeEditNode.text.value;
    dynamic ret = apiRequest.requestRegister(param);
    AppLoading.close();
    Log.d("注册接口请求返回： ret:$ret");
  }
}
