import 'package:flutter_comm/util/loading_util.dart';
import 'package:flutter_comm/util/system_util.dart';
import 'package:flutter_comm/widget/input_field.dart';
import 'package:get/get.dart';

import '../../../../http/comm_request.dart';
import '../../../../http/request.dart';
import '../../../../util/Log.dart';
import '../../../../util/toast_util.dart';
import '../../main/controllers/main_controller.dart';

class RegisterController extends GetxController {
  final EditNode userEditNode = EditNode(regExp: usernameRegExp);
 // final EditNode phoneEditNode = EditNode();
  final EditNode pswEditNode = EditNode(regExp: pswRegExp);
  final EditNode rePswEditNode = EditNode(isNotVerifyOnErr: true);
  final isAgreed = true.obs;
  final selectedIndex = 0.obs;
  final isAgree = true.obs;

  bool checkRegInput() {
    userEditNode.isDisplayErrHint.value = userEditNode.checkInput();
    pswEditNode.isDisplayErrHint.value = pswEditNode.checkInput();
    rePswEditNode.isDisplayErrHint.value = rePswEditNode.checkInput();

    return !userEditNode.isDisplayErrHint.value && !pswEditNode.isDisplayErrHint.value && !rePswEditNode.isDisplayErrHint.value;
  }


  Future<void> register() async {
    Map<String, Object> param = {};
    bool inputIsOk = checkRegInput();
    Log.d("inputIsOk:$inputIsOk");
    if (!inputIsOk) return;
    // if (selectedIndex.value == 0) {
    //   if (!emailCodeSender.isHasSuccessSendVerifyCode) {
    //     /// 请发送验证吗
    //     Toast.show("Por Favor, Envie O Código De Verificação");
    //     return;
    //   }
    // } else {
    //   // if (!phoneCodeSender.isHasSuccessSendVerifyCode) {
    //   //   /// 请发送验证吗
    //   //   Toast.show("Por Favor, Envie O Código De Verificação");
    //   //   return;
    //   // }
    // }

    if (!isAgreed.value) {
      /// 请阅读并同意隐私政策
      Toast.show("Por Favor, Leia E Concorde Com A Política De Privacidade");
      return;
    }
    AppLoading.show();
    // if (selectedIndex.value == 0) {
    //   param["email"] = emailEditNode.text.value;
    //   param["password"] = keyEditNode.text.value;
    //   param["verify_code"] = codeEditNode.text.value;
    //   param["sid"] = emailCodeSender.sid;
    //   param["ts"] = emailCodeSender.ts;
    // } else {
    //   param["phone"] = phoneEditNode.text.value;
    //   param["password"] = key2EditNode.text.value;
    //   param["verify_code"] = code2EditNode.text.value;
    //   param["sid"] = phoneCodeSender.sid;
    //   param["ts"] = phoneCodeSender.ts;
    // }
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
