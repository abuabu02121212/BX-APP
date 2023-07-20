import 'package:get/get.dart';

import '../../../../http/comm_request.dart';
import '../../../../http/phone_code_send_helper.dart';
import '../../../../http/request.dart';
import '../../../../util/Log.dart';
import '../../../../util/loading_util.dart';
import '../../../../util/system_util.dart';
import '../../../../util/toast_util.dart';
import '../../../../widget/input_field.dart';

class ForgetPswController extends GetxController {
  final EditNode emailEditNode = EditNode();
  final EditNode emailKeyEditNode = EditNode();
  final EditNode emailCodeEditNode = EditNode();

  final EditNode phoneEditNode = EditNode();
  final EditNode phoneKeyEditNode = EditNode();
  final EditNode phoneCodeEditNode = EditNode();

  late CodeSender phoneCodeSender = CodeSender(tarEditNode: phoneEditNode, regExp: phoneNumExp, isForgetPsw: true);
  late CodeSender emailCodeSender = CodeSender(tarEditNode: emailEditNode, regExp: emailExp, codeType: 2, isForgetPsw: true);

  final selectedIndex = 0.obs;

  bool checkEmailRegInput() {
    emailEditNode.isDisplayErrHint.value = !emailExp.hasMatch(emailEditNode.text.value);
    emailKeyEditNode.isDisplayErrHint.value = !pswRegExp.hasMatch(emailKeyEditNode.text.value);
    emailCodeEditNode.isDisplayErrHint.value = !codeRegExp.hasMatch(emailCodeEditNode.text.value);
    return !emailEditNode.isDisplayErrHint.value && !emailKeyEditNode.isDisplayErrHint.value && !emailCodeEditNode.isDisplayErrHint.value;
  }

  bool checkPhoneRegInput() {
    phoneEditNode.isDisplayErrHint.value = !phoneNumExp.hasMatch(phoneEditNode.text.value);
    phoneKeyEditNode.isDisplayErrHint.value = !pswRegExp.hasMatch(phoneKeyEditNode.text.value);
    phoneCodeEditNode.isDisplayErrHint.value = !codeRegExp.hasMatch(phoneCodeEditNode.text.value);
    return !phoneEditNode.isDisplayErrHint.value && !phoneKeyEditNode.isDisplayErrHint.value && !phoneCodeEditNode.isDisplayErrHint.value;
  }

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> commitRequest() async {
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

    AppLoading.show();
    if (selectedIndex.value == 0) {
      param["email"] = emailEditNode.text.value;
    //  param["phone"] = '';
      param["password"] = emailKeyEditNode.text.value;
      param["code"] = emailCodeEditNode.text.value;
      param["sid"] = emailCodeSender.sid;
      param["ts"] = emailCodeSender.ts;
    } else {
    //  param["email"] = '';
      param["phone"] = phoneEditNode.text.value;
      param["password"] = phoneKeyEditNode.text.value;
      param["code"] = phoneCodeEditNode.text.value;
      param["sid"] = phoneCodeSender.sid;
      param["ts"] = phoneCodeSender.ts;
    }
    param["device_no"] = SysUtil.deviceId;
    dynamic ret = await apiRequest.requestForgetPsw(params: param);
    if (ret == '1000') {
      Toast.show("register success");
      Log.d("==========修改密码成功=====register success=================");
      await requestUserInfo();
      await requestCommBalance();
      Get.back();
    } else {
      Toast.show("$ret");
    }
    AppLoading.close();

    Log.d("忘记密码请求返回： ret:$ret");
  }
}
