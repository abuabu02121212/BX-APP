import 'package:flutter_comm/http/request.dart';
import 'package:get/get.dart';

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
