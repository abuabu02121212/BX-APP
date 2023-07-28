import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_comm/app/entity/balance.dart';
import 'package:flutter_comm/skin/skin_manager.dart';
import 'package:flutter_comm/util/Log.dart';
import 'package:flutter_comm/util/dialog.dart';
import 'package:flutter_comm/util/sp_util.dart';
import 'package:flutter_comm/util/sp_util_key.dart';
import 'package:flutter_comm/util/system_util.dart';
import 'package:get/get.dart';
import 'env.dart';
import 'app/entity/user_info.dart';
import 'http/comm_request.dart';
import 'http/request.dart';

class GlobeController extends GetxController with WidgetsBindingObserver {
  GlobeController(this.context);

  final BuildContext context;
  final userInfoEntity = Rx<UserInfoEntity?>(null);
  final balance = Rx<BalanceEntity?>(null);

  bool isLogin() {
    return userInfoEntity.value != null;
  }

  Future<void> loginOut() async {
     userInfoEntity.value = null;
     balance.value = null;
     await spUtil.setString(keyLoginToken, "");
     apiRequest.httpUtil.loginToken = "";
     Log.d("已经退出登陆...");
  }

  bool isNeedBindPhone(){
    UserInfoEntity? entity = userInfoEntity.value;
    if(entity == null){
      return false;
    }
    return entity.phoneVerify != '1';
  }

  bool isNeedBindEmail(){
    UserInfoEntity? entity = userInfoEntity.value;
    if(entity == null){
      return false;
    }
    return entity.emailVerify != '1';
  }

  bool isUserKeyInfoAllSetup() {
    UserInfoEntity? entity = userInfoEntity.value;
    if(entity == null){
      return false;
    }
    return entity.phone!.isNotEmpty && entity.email!.isNotEmpty && entity.telegram!.isNotEmpty;
  }

  @override
  Future<void> onInit() async {
    /// 强制竖屏
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
    await spUtil.init();
    await SysUtil.init();
    await requestUserInfo();
    await requestCommBalance();
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
