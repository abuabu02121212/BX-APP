import 'package:flutter_comm/util/loading_util.dart';
import 'package:flutter_comm/util/system_util.dart';
import 'package:flutter_comm/widget/input_field.dart';
import 'package:get/get.dart';

import '../../../../http/comm_request.dart';
import '../../../../http/phone_code_send_helper.dart';
import '../../../../http/request.dart';
import '../../../../util/Log.dart';
import '../../../../util/toast_util.dart';
import '../../main/controllers/main_controller.dart';

class RegisterController extends GetxController {
  final EditNode emailEditNode = EditNode();
  final EditNode phoneEditNode = EditNode();
  final EditNode keyEditNode = EditNode();
  final EditNode key2EditNode = EditNode();
  final EditNode codeEditNode = EditNode();
  final EditNode code2EditNode = EditNode();
  final isAgreed = false.obs;
  final selectedIndex = 0.obs;
  late CodeSender phoneCodeSender = CodeSender(tarEditNode: phoneEditNode, regExp: phoneNumExp);
  late CodeSender emailCodeSender = CodeSender(tarEditNode: emailEditNode, regExp: emailExp, codeType: 2);

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

  Future<void> register() async {
    Map<String, Object> param = {};
    bool inputIsOk = false;
    if (selectedIndex.value == 0) {
      inputIsOk = checkEmailRegInput();
    } else {
      inputIsOk = checkPhoneRegInput();
    }
    Log.d("inputIsOk:$inputIsOk");
    if (!inputIsOk) return;
    if (selectedIndex.value == 0) {
      if (!emailCodeSender.isHasSuccessSendVerifyCode) {
        /// 请发送验证吗
        Toast.show("Por Favor, Envie O Código De Verificação");
        return;
      }
    } else {
      if (!phoneCodeSender.isHasSuccessSendVerifyCode) {
        /// 请发送验证吗
        Toast.show("Por Favor, Envie O Código De Verificação");
        return;
      }
    }

    if (!isAgreed.value) {
      /// 请阅读并同意隐私政策
      Toast.show("Por Favor, Leia E Concorde Com A Política De Privacidade");
      return;
    }
    AppLoading.show();
    if (selectedIndex.value == 0) {
      param["email"] = emailEditNode.text.value;
      param["password"] = keyEditNode.text.value;
      param["verify_code"] = codeEditNode.text.value;
      param["sid"] = emailCodeSender.sid;
      param["ts"] = emailCodeSender.ts;
    } else {
      param["phone"] = phoneEditNode.text.value;
      param["password"] = key2EditNode.text.value;
      param["verify_code"] = code2EditNode.text.value;
      param["sid"] = phoneCodeSender.sid;
      param["ts"] = phoneCodeSender.ts;
    }
    param["device_no"] = SysUtil.deviceId;
    dynamic ret = await apiRequest.requestRegister(param);
    if (ret == '1000') {
      Toast.show("register success");
      Log.d("==========注册成功=====register success=================");
      await requestUserInfo();
      await requestCommBalance();
      Get.back();
      MainController mainController = Get.put(MainController());
      mainController.toHome();
    } else {
      Toast.show("$ret");
    }
    AppLoading.close();

    Log.d("注册接口请求返回： ret:$ret");
  }
}
