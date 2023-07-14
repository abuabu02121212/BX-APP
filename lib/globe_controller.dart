import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_comm/skin/skin_manager.dart';
import 'package:flutter_comm/util/Log.dart';
import 'package:flutter_comm/util/sp_util.dart';
import 'package:get/get.dart';
import 'env.dart';
import 'app/entity/user_info.dart';

class GlobeController extends GetxController with WidgetsBindingObserver {
  GlobeController(this.context);

  final BuildContext context;
  UserInfoEntity? userInfoEntity;

  bool isLogin() {
    return userInfoEntity == null;
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
