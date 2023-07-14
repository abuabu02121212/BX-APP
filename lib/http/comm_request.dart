import 'package:flutter_comm/http/request.dart';
import 'package:get/get.dart';

import '../app/entity/balance.dart';
import '../app/entity/user_info.dart';
import '../globe_controller.dart';
import '../util/Log.dart';
import '../util/sp_util.dart';
import '../util/sp_util_key.dart';

Future<void> requestUserInfo() async {
  String loginToken = spUtil.getString(keyLoginToken) ?? "";
  if (loginToken.isNotEmpty) {
    var userInfo = await apiRequest.requestMemberInfo();
    UserInfoEntity userInfoEntity = UserInfoEntity.fromJson(userInfo);
    GlobeController controller = Get.find<GlobeController>();
    controller.userInfoEntity.value = userInfoEntity;
    Log.d("封装后的数据是： userInfoEntity:${userInfoEntity.username}");
  } else {
    Log.d("用户还没有登陆，不请求用户信息");
  }
}

Future<void> requestCommBalance() async {
  String loginToken = spUtil.getString(keyLoginToken) ?? "";
  if (loginToken.isNotEmpty) {
    var json = await apiRequest.requestBalance();
    BalanceEntity entity = BalanceEntity.fromJson(json);
    GlobeController controller = Get.find<GlobeController>();
    controller.balance.value = entity;
    Log.d("封装后的数据是： BalanceEntity:$entity");
  } else {
    Log.d("用户还没有登陆，不请求余额");
  }
}

Future<dynamic> requestCommPhoneVerifyCode(String tel) async {
  // ty: 1注册2忘记密码
  return await apiRequest.requestSms({'tel': tel, 'ty': 1, 'flag': 'text'});
}
