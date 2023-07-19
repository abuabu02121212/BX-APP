import 'dart:async';
import 'package:flutter_comm/util/loading_util.dart';
import 'package:flutter_comm/widget/input_field.dart';
import 'package:get/get.dart';

import '../util/Log.dart';
import '../util/toast_util.dart';
import 'comm_request.dart';

class CodeSender {
  bool isHasSuccessSendVerifyCode = false;
  Timer? myTimer;
  static const verifiedCodeCountDown = 300;
  final countTime = 0.obs;
  final inputCode = ''.obs;
  String ts = '';
  String sid = '';
  final EditNode tarEditNode;
  final RegExp regExp;
  final int codeType;

  CodeSender({required this.tarEditNode, required this.regExp, this.codeType = 1});

  bool checkInput() {
    bool isOk = regExp.hasMatch(tarEditNode.text.value);
    tarEditNode.isDisplayErrHint.value = !isOk;
    return isOk;
  }

  // 发送手机验证码
  Future<bool> requestSendVerifiedCode() async {
    // 发送验证码
    AppLoading.show();
    // data: 37869799820730321:1689392074476665
    String? data;
    if (codeType == 1) {
      data = await requestCommPhoneVerifyCode(tarEditNode.text.value);
    } else if (codeType == 2) {
      data = await requestCommSmsSendMail(tarEditNode.text.value);
    }
    var arr = data?.split(":");
    Log.d("验证码结果：data: $data  arr：$arr");
    if (data != null && arr?.length == 2) {
      Toast.show('send success');
      isHasSuccessSendVerifyCode = true;
      countTime.value = verifiedCodeCountDown;
      myTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
        countTime.value--;
        if (countTime.value <= 0) {
          timer.cancel();
        }
      });
      sid = arr![0];
      ts = arr[1];
      Log.d("=LLpp=发送验证码请求成功==sid:$sid  ts:$ts==");
    } else {
      Log.d("=LLpp=发送验证码请求失败======");
      // Toast.show('send fail');
    }
    AppLoading.close();
    return true;
  }

  void clear() {
    if (myTimer != null) {
      myTimer?.cancel();
    }
  }
}
