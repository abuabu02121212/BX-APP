import 'package:flutter_comm/http/request.dart';
import 'package:get/get.dart';

import '../app/entity/balance.dart';
import '../app/entity/game_item.dart';
import '../app/entity/user_info.dart';
import '../globe_controller.dart';
import '../util/Log.dart';
import '../util/entity/entites.dart';
import '../util/load_more_help.dart';
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

Future<dynamic> requestCommPhoneVerifyCode(String tel, {isForgetPsw = false}) async {
  // ty: 1注册2忘记密码
  return await apiRequest.requestSms({'tel': tel, 'ty': isForgetPsw ? 2 : 1, 'flag': 'text'});
}

Future<dynamic> requestCommSmsSendMail(String mail, {isForgetPsw = false}) async {
  // ty: 1注册 2忘记密码
  return await apiRequest.requestSmsSendMail(params: {
    // 'username': '',
    'ty': isForgetPsw ? "2" : "1",
    'mail': mail,
  });
}

Future<RequestResultEntity?> requestGamePageData(
  method,
  Map<String, Object> param, {
  required String listUIKey,
  required LoadMorePageIndexHelper gameListPageIndexHelper,
  required int requestPageIndex,
  required RxList<GameEntity> tarRx,
  required int pageSize,
}) async {
  try {
    if(requestPageIndex == 1){
      gameListPageIndexHelper.clear(listUIKey);
    }
    if (gameListPageIndexHelper.isRequestedAllPage(listUIKey)){
      Log.d("requestPageIndex：$requestPageIndex 所有数据请求完毕 size: ${tarRx.length}");
      return null;
    }
    var tarPageIndex = gameListPageIndexHelper.getRequestPageIndex(listUIKey, requestPageIndex);
    param['page'] = tarPageIndex;
    var retData = await method(params: param);
    RequestResultEntity entity = handleGameListData(retData['d'], tarRx, pageSize, tarPageIndex);
    if (entity.isSuccess) {
      if (entity.isLastPage) {
        gameListPageIndexHelper.notifyRequestedAllPage(listUIKey);
      } else {
        gameListPageIndexHelper.updatePageIndex(listUIKey);
      }
    }
    return entity;
  } catch (e, stack) {
    tarRx.clear();
    tarRx.refresh();
    Log.e("$e, $stack");
  }
  return null;
}

RequestResultEntity handleGameListData(jsonList, RxList<GameEntity> tarList, int pageSize, pageIndex) {
  List<GameEntity> list = GameEntity.getList(jsonList);
  if (pageIndex == 1) {
    tarList.clear();
  }
  tarList.addAll(list);
  tarList.refresh();
  var listSize = list.length;
  return RequestResultEntity(true, listSize, listSize < pageSize);
}
