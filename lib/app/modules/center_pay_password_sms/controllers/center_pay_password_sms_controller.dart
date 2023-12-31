import 'dart:async';

import 'package:flutter_comm/http/comm_request.dart';
import 'package:flutter_comm/http/request.dart';
import 'package:flutter_comm/util/loading_util.dart';
import 'package:flutter_comm/util/sp_util.dart';
import 'package:flutter_comm/util/toast_util.dart';
import 'package:flutter_comm/widget/input_field.dart';
import 'package:get/get.dart';

import '../../../../globe_controller.dart';
import '../../../../util/Log.dart';
import '../../../entity/user_info.dart';

class CenterPayPasswordSmsController extends GetxController {
  EditNode codeEditNode = EditNode();
  String sid = "";
  String ts = "";

  String spUtilsCoundownKey = "countDownspUtilsCoundownKey";
  String password = Get.arguments['password'];
  String? oldPassword = Get.arguments['oldPassword'];

  final GlobeController globeController = Get.find<GlobeController>();
  late UserInfoEntity? userInfoEntity = globeController.userInfoEntity.value;
  final countDown = 0.obs;
  final isSending = false.obs;
  final isSendOk = false.obs;
  Timer? _timer;

  // 是否验证了手机
  bool isVerifyPhone() {
    return (globeController.userInfoEntity.value?.phoneVerify ?? "0").toString() == "1";
  }

  // 是否验证了邮箱
  bool isVerifyEmail() {
    return (globeController.userInfoEntity.value?.emailVerify ?? "0").toString() == "1";
  }

  // 获取发送按钮的文案
  String getSendButtonText() {
    if (isSending.isTrue) {
      return 'enviando...';
    } else if (countDown.value > 0) {
      return '${countDown.value}s';
    } else {
      return 'Retirar';
    }
  }

  startCountDown() async {
    int countDownTime = spUtil.getInt(spUtilsCoundownKey) ?? 0;
    countDown.value = countDownTime > 0 ? countDownTime : (60 * 5);

    //   await Future.delayed(const Duration(seconds: 1));
    //   countDown.value--;
    //   await spUtil.setInt(spUtilsCoundownKey, countDown.value);
    //   return countDown.value > 0;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      countDown.value--;
      await spUtil.setInt(spUtilsCoundownKey, countDown.value);
      if (countDown.value <= 0) {
        _timer?.cancel();
      }
    });
  }

  sendPhoneSms() async {
    if (isVerifyPhone() && (userInfoEntity?.phone ?? "").isNotEmpty) {
      isSending.value = true;
      try {
        // 发送短信
        final data = await apiRequest.requestSmsSendOnline(params: {
          "ty": 3, // 3=修改密码 4=提现 2=修改邮箱 5 修改手机
        });
        print('数据Phone：$data');
        List<String> list = data.split(":");
        sid = list[0];
        ts = list[1];
        isSendOk.value = true;
        startCountDown();
      } catch (e) {
        Log.d("发送短信失败：$e");
        Toast.show('Falha no envio do SMS, tente novamente');
      } finally {
        isSending.value = false;
      }
    }
  }

  sendEmailSms() async {
    if (isVerifyEmail() && (userInfoEntity?.email ?? "").isNotEmpty) {
      try {
        isSending.value = true;
        // 发送短信
        final data = await apiRequest.requestSmsSendOnlineMail(params: {
          "ty": 3, // 3=修改密码 4=提现 2=修改邮箱 5 修改手机
        });
        print('数据Email：$data');
        List<String> list = data.split(":");
        sid = list[0];
        ts = list[1];
        isSendOk.value = true;
        startCountDown();
      } catch (e) {
        Log.d("发送邮箱验证失败：$e");
        Toast.show('Falha no envio do e-mail, tente novamente');
      } finally {
        isSending.value = false;
      }
    }
  }

  void sendSms() {
    if (isVerifyPhone()) {
      sendPhoneSms();
    } else if (isVerifyEmail()) {
      sendEmailSms();
    }
  }

  init() {
    countDown.value = spUtil.getInt(spUtilsCoundownKey) ?? 0;
    if (countDown.value > 0) {
      startCountDown();
    } else {
      sendSms();
    }
  }

  void submit() async {
    if (sid.isEmpty || ts.isEmpty) {
      Toast.show('Por favor, obtenha o código de verificação primeiro');
      return;
    }

    if (codeEditNode.text.isEmpty) {
      Toast.show('por favor insira o código de verificação');
      return;
    }

    if (codeEditNode.text.value.length != 4) {
      Toast.show('Insira um código de verificação de 4 dígitos');
      return;
    }

    int ty = 1;
    if (isVerifyEmail()) {
      ty = 2;
    }

    final params = {
      "ty": ty,
      "sid": sid,
      "ts": ts,
      "code": codeEditNode.text.value,
      "password": password,
    };
    if (oldPassword != null) {
      params["old"] = oldPassword!;
    }
    print('params:$params');
    try {
      AppLoading.show();
      final data = await apiRequest.requestPasswordUpdate(params: params);
      await requestUserInfo();
      Toast.show('sucesso');
      _timer?.cancel();
      countDown.value = 0;
      await spUtil.setInt(spUtilsCoundownKey, 0);
      // 2秒后关闭
      Future.delayed(const Duration(seconds: 2), () {
        Get.back(result: true);
      });
    } catch (e) {
    } finally {
      AppLoading.close();
    }
  }

  @override
  void onInit() {
    init();
    super.onInit();
  }
}
