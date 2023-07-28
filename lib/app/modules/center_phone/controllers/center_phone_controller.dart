import 'package:flutter_comm/http/phone_code_send_helper.dart';
import 'package:flutter_comm/http/request.dart';
import 'package:flutter_comm/util/loading_util.dart';
import 'package:flutter_comm/widget/input_field.dart';
import 'package:get/get.dart';

import '../../../../globe_controller.dart';
import '../../../../http/comm_request.dart';
import '../../../../http/ret_code.dart';
import '../../../../util/Log.dart';
import '../../../../util/toast_util.dart';
import '../../../entity/user_info.dart';

class CenterPhoneController extends GetxController {
  EditNode phoneEditNode = EditNode();
  EditNode emailEditNode = EditNode();
  EditNode codeEditNode = EditNode();

  late CodeSender phoneCodeSender = CodeSender(tarEditNode: phoneEditNode, regExp: phoneNumExp, codeType: 3);
  late CodeSender emailCodeSender = CodeSender(tarEditNode: emailEditNode, regExp: emailExp, codeType: 4);

  final GlobeController globeController = Get.find<GlobeController>();

  late var isShowBindPhone = globeController.isNeedBindPhone();

  late UserInfoEntity userInfoEntity = globeController.userInfoEntity.value!;

  @override
  void onInit() {
    super.onInit();
    emailEditNode.text.value = userInfoEntity.email ?? "";
    phoneEditNode.text.value = userInfoEntity.phone ?? "";
  }

  bool checkInput() {
    codeEditNode.isDisplayErrHint.value = !codeRegExp.hasMatch(codeEditNode.text.value);
    if (codeEditNode.isDisplayErrHint.value) {
      // Toast.show("code err");
    }
    if (isShowBindPhone) {
      phoneEditNode.isDisplayErrHint.value = !phoneNumExp.hasMatch(phoneEditNode.text.value);
      if (phoneEditNode.isDisplayErrHint.value) {
        //   Toast.show("phone err");
      }
      return !phoneEditNode.isDisplayErrHint.value && !codeEditNode.isDisplayErrHint.value;
    } else {
      emailEditNode.isDisplayErrHint.value = !emailExp.hasMatch(emailEditNode.text.value);
      if (emailEditNode.isDisplayErrHint.value) {
        //  Toast.show("email err");
      }
      return !emailEditNode.isDisplayErrHint.value && !codeEditNode.isDisplayErrHint.value;
    }
    return false;
  }

  Future<void> commit() async {
    if (!checkInput()) return;
    if (isShowBindPhone) {
      if (!phoneCodeSender.isHasSuccessSendVerifyCode) {
        /// 请发送验证吗
        Toast.show("Por Favor, Envie O Código De Verificação");
        return;
      }
    } else {
      if (!emailCodeSender.isHasSuccessSendVerifyCode) {
        /// 请发送验证吗
        Toast.show("Por Favor, Envie O Código De Verificação");
        return;
      }
    }
    if (!isShowBindPhone) {
      AppLoading.show();
      try {
        var ret = await apiRequest.requestMemberBindEmail(
          params: {
            "sid": emailCodeSender.sid,
            "ts": emailCodeSender.ts,
            "code": codeEditNode.text.value,
            "email": emailEditNode.text.value,
          },
        );
        if (ret == retCodeSuccess) {
          requestUserInfo();
          Get.back();
        }
      } catch (e) {
        Log.e(e);
      }
      AppLoading.close();
    } else {
      AppLoading.show();
      try {
        var ret = await apiRequest.requestMemberBindPhone(
          params: {
            "sid": phoneCodeSender.sid,
            "ts": phoneCodeSender.ts,
            "code": codeEditNode.text.value,
            "phone": phoneEditNode.text.value,
          },
        );
        if (ret == retCodeSuccess) {
          requestUserInfo();
          Get.back();
        }
      } catch (e) {
        Log.e(e);
      }
      AppLoading.close();
    }
  }
}
