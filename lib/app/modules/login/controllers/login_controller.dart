import 'dart:convert';

import 'package:flutter_comm/widget/input_field.dart';
import 'package:get/get.dart';
import 'package:cbor/cbor.dart';
import '../../../../http/request.dart';
import '../../../../util/Log.dart';

class LoginController extends GetxController {
  EditNode userNameEditNode = EditNode();
  EditNode keyEditNode = EditNode();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  bool checkInput() {
    userNameEditNode.isDisplayErrHint.value = !usernameRegExp.hasMatch(userNameEditNode.text.value);
    keyEditNode.isDisplayErrHint.value = !pswRegExp.hasMatch(keyEditNode.text.value);
    return !userNameEditNode.isDisplayErrHint.value && !keyEditNode.isDisplayErrHint.value;
  }
  
  

  Future<void> login() async {
    var inputIsOk = checkInput();
    Log.d("inputIsOk:$inputIsOk");
    if (!inputIsOk) return;
    Map<String, Object> param = {};
    param['username'] = userNameEditNode.text.value;
    param['password'] = keyEditNode.text.value;
    param['device_no'] = "${DateTime.now().millisecondsSinceEpoch}-test";
   // param['code'] = userNameEditNode.text.value;
   // param['vid'] = userNameEditNode.text.value;
    var loginRet = await apiRequest.requestLogin(param);
    Log.d("origin:$loginRet");
  //  cbor.decode(encoded);
   // final encoded = cbor.decode(loginRet);
    CborString cborString = CborString(loginRet);
    Log.d("loginRet:${cborString.toJson()}");
  }
}
