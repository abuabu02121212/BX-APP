import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_comm/skin/skin_manager.dart';
import 'package:flutter_comm/util/Log.dart';
import 'package:flutter_comm/util/sp_util.dart';
import 'package:flutter_comm/util/sp_util_key.dart';
import 'package:get/get.dart';
import 'env.dart';
import 'app/entity/user_info.dart';
import 'http/request.dart';

class GlobeController extends GetxController with WidgetsBindingObserver {
  GlobeController(this.context);

  final BuildContext context;
  final userInfoEntity = Rx<UserInfoEntity?>(null);

  bool isLogin() {
    return userInfoEntity.value != null;
  }

  Future<void> loginOut() async {
     userInfoEntity.value = null;
     await spUtil.setString(keyLoginToken, "");
     apiRequest.httpUtil.loginToken = "";
  }

  @override
  Future<void> onInit() async {
    /// 强制竖屏
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
    await spUtil.init();
  }

  @override
  void didChangePlatformBrightness() {
    Log.d("当前系统主题模式改变");
    syncSystemThemeMode(context);
  }

  @override
  void onReady() {
    super.onReady();
    syncSystemThemeMode(context);
    printEnv();
  }

  Future<void> printEnv() async {
    var appInfo = await EnvironmentConfig.getAppInfo();
    Log.i(EnvironmentConfig.getEnvInfo() + appInfo);
  }
}
