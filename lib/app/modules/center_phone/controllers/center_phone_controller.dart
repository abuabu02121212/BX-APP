import 'package:flutter_comm/http/phone_code_send_helper.dart';
import 'package:flutter_comm/http/request.dart';
import 'package:flutter_comm/util/loading_util.dart';
import 'package:flutter_comm/widget/input_field.dart';
import 'package:get/get.dart';

import '../../../../globe_controller.dart';
import '../../../../util/Log.dart';
import '../../../../util/toast_util.dart';
import '../../../entity/user_info.dart';

class CenterPhoneController extends GetxController {
  EditNode phoneEditNode = EditNode();
  EditNode emailEditNode = EditNode();
  EditNode codeEditNode = EditNode();
  late CodeSender phoneCodeSender = CodeSender(tarEditNode: phoneEditNode, regExp: phoneNumExp, codeType: 3, isForgetPsw: true);
  late CodeSender emailCodeSender = CodeSender(tarEditNode: emailEditNode, regExp: emailExp, codeType: 4, isForgetPsw: true);

  final GlobeController globeController = Get.find<GlobeController>();
  late UserInfoEntity? userInfoEntity = globeController.userInfoEntity.value;
  late var isEmailNotExit = userInfoEntity != null && (userInfoEntity?.email ?? "").isEmpty;
  late var isPhoneNotExit = userInfoEntity != null && (userInfoEntity?.phone ?? "").isEmpty;

  bool checkInput() {
    codeEditNode.isDisplayErrHint.value = !codeRegExp.hasMatch(codeEditNode.text.value);
    if (isEmailNotExit) {
      emailEditNode.isDisplayErrHint.value = !emailExp.hasMatch(emailEditNode.text.value);
      return !emailEditNode.isDisplayErrHint.value && !codeEditNode.isDisplayErrHint.value;
    } else if (isPhoneNotExit) {
      phoneEditNode.isDisplayErrHint.value = !phoneNumExp.hasMatch(phoneEditNode.text.value);
      return !phoneEditNode.isDisplayErrHint.value && !codeEditNode.isDisplayErrHint.value;
    }
    return false;
  }

  Future<void> commit() async {
    if (!checkInput()) return;
    if (isEmailNotExit) {
      if (!emailCodeSender.isHasSuccessSendVerifyCode) {
        /// 请发送验证吗
        Toast.show("Por Favor, Envie O Código De Verificação");
        return;
      }
    } else if (isPhoneNotExit) {
      if (!phoneCodeSender.isHasSuccessSendVerifyCode) {
        /// 请发送验证吗
        Toast.show("Por Favor, Envie O Código De Verificação");
        return;
      }
    }
    if (isEmailNotExit) {
      AppLoading.show();
      var ret = await apiRequest.requestMemberBindEmail(
        params: {
          "sid": emailCodeSender.sid,
          "ts": emailCodeSender.ts,
          "code": codeEditNode.text.value,
          "email": emailEditNode.text.value,
        },
      );
      Log.d("ret$ret");
      AppLoading.close();
    } else if (isPhoneNotExit) {
      AppLoading.show();
      var ret = await apiRequest.requestMemberBindPhone(
        params: {
          "sid": phoneCodeSender.sid,
          "ts": phoneCodeSender.ts,
          "code": codeEditNode.text.value,
          "phone": phoneEditNode.text.value,
        },
      );
      Log.d("ret$ret");
      AppLoading.close();
    }
  }
}
