import 'dart:async';
import 'package:flutter_comm/util/loading_util.dart';
import 'package:flutter_comm/widget/input_field.dart';
import 'package:get/get.dart';

import '../util/Log.dart';
import '../util/toast_util.dart';
import 'comm_request.dart';

class VerifyCodeSender {
  bool isHasSuccessSendVerifyCode = false;
  dynamic myTimer;
  static const verifiedCodeCountDown = 300;
  final countTime = 0.obs;
  final inputCode = ''.obs;
  String p0 = '';
  String p1 = '';
  final EditNode phoneEditNode;

  VerifyCodeSender({required this.phoneEditNode});

  // 发送手机验证码
  Future<bool> requestSendVerifiedCode() async {
    // 发送验证码
    AppLoading.show();
    var result = await requestCommPhoneVerifyCode(phoneEditNode.text.value);
    if (result != null) {
      Toast.show('send success');
      isHasSuccessSendVerifyCode = true;
      countTime.value = verifiedCodeCountDown;
      myTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
        countTime.value--;
        if (countTime.value <= 0) {
          timer.cancel();
        }
      });
    //  var res = result['data'];
    //  p0 = res.split(':')[0];
   //   p1 = res.split(':')[1];
      Log.d("=LLpp=发送验证码请求成功====");
    } else {
      Log.d("=LLpp=发送验证码请求失败======");
      // Toast.show('send fail');
    }
    AppLoading.close();
    return true;
  }

}
