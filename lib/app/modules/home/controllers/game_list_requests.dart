import 'package:get/get.dart';

import '../../../../globe_controller.dart';
import '../../../../http/request.dart';
import '../../../../http/ret_code.dart';
import '../../../../util/Log.dart';
import '../../../../util/loading_util.dart';
import '../../../../util/toast_util.dart';
import '../../../entity/game_item.dart';
import '../../../entity/game_tag.dart';
import '../../../routes/app_pages.dart';
import '../../login_register/views/login_regiseter_widget.dart';

/// TAB 0-1. 推荐游戏列表 - 热门游戏
int pageSize = 20;

Future<void> requestHotGameListForRec(RxList<GameEntity> tarRx) async {
  try {
    var retData = await apiRequest.requestHotGameList({
      'ty': 0,
      'page': 1,
      'page_size': pageSize,
      'platform_id': 0,
    });
    var list = GameEntity.getList(retData['d']);
    tarRx.value = list;
    Log.d("推荐热门游戏数目：${tarRx.length}");
  } catch (e, stack) {
    Log.e("$e, $stack");
  }
}

/// TAB 0-2. 推荐游戏列表 - Fav游戏
Future<void> requestFavGameListForRec(RxList<GameEntity> tarRx) async {
  try {
    var retData = await apiRequest.requestGameFavList(params: {
      'page': 1,
      'page_size': pageSize,
      'platform_id': 0,
    });
    var list = GameEntity.getList(retData['d']);
    tarRx.value = list;
    Log.d("推荐收藏游戏数目：${tarRx.length}");
  } catch (e, stack) {
    Log.e("$e, $stack");
  }
}

/// TAB 0-3. 推荐游戏列表 - 五种不同gameType的推荐游戏
Future<void> requestRecGameList(int ty, RxList<GameEntity> rx) async {
  var retArr1 = await apiRequest.requestGameRecList(params: {
    'ty': ty,
    'page': 1,
    'page_size': pageSize,
    'platform_id': 0,
  });
  rx.value = GameEntity.getList(retArr1['d']);
  Log.d("=======ty:$ty 推荐游戏数目：${rx.length}");
}

/// TAB 1 游戏列表
Future<void> requestFavGameList(RxList<GameEntity> rx, {ty = "0"}) async {
  try {
    var retData = await apiRequest.requestGameFavList(params: {
      'ty': ty,
      'page': 1,
      'page_size': pageSize,
      'platform_id': 0,
    });
    List<GameEntity> list = GameEntity.getList(retData['d']);
    rx.value = list;
    Log.d("tab1-收藏游戏数目：${list.length}");
  } catch (e, stack) {
    Log.e("$e, $stack");
  }
}

/// TAB 2 以后 游戏列表
Future<void> requestGameList(RxList<GameEntity> tarRx, String gameType, {tagId = 0, platformId = 0}) async {
  try {
    var retData = await apiRequest.requestGameList(params: {
      'game_type': gameType,
      'page': 1,
      'page_size': pageSize,
      'platform_id': platformId,
      'tag_id': tagId,
    });
    List<GameEntity> list = handleGameListData(retData['d'], tarRx);
    Log.d("子类游戏数目：${list.length}");
  } catch (e, stack) {
    Log.e("$e, $stack");
  }
}

/// 小按钮的热门游戏列表
/// https://h5.cyestari.com/member/game/hot/list?ty=3&platform_id=16595015200303&page=1&page_size=20
/// https://h5.cyestari.com/member/game/hot/list?ty=3&page=15&page_size=1&platform_id=16595015200303
Future<void> requestHotGameList(RxList<GameEntity> tarRx, String gameType, {platformId = 0}) async {
  AppLoading.show();
  try {
    var retData = await apiRequest.requestHotGameList({
      'ty': gameType,
      'page': 1,
      'page_size': pageSize,
      'platform_id': platformId,
    });
    List<GameEntity> list = handleGameListData(retData['d'], tarRx);
    Log.d("小按钮-热门游戏数目：${list.length}");
  } catch (e, stack) {
    Log.e("$e, $stack");
  }
  AppLoading.close();
}

/// 小按钮的收藏游戏列表
Future<void> requestMemberFavList2(RxList<GameEntity> tarRx, String gameType, {platformId = 0}) async {
  // if (paginationHelper.isHasRequestedAllData()) {
  //   return;
  // }
  AppLoading.show();
  try {
    // var curRequestPageIndex = paginationHelper.getCurRequestPageIndex();
    var retData = await apiRequest.requestMemberFavList(params: {
      'ty': gameType,
      'page': 1,
      'page_size': pageSize,
      'platform_id': 0,
    });
    List<GameEntity> list = handleGameListData(retData, tarRx);
    Log.d("小按钮-收藏游戏数目：${list.length}");
  } catch (e, stack) {
    tarRx.clear();
    tarRx.refresh();
    Log.e("$e, $stack");
  }
  AppLoading.close();
}

Future<void> requestGameSearch(String curGameType, {keyWord = '', platformId = "0", onSuccess}) async {
  // if (paginationHelper.isHasRequestedAllData()) {
  //   return;
  // }
  lastKeyWord = keyWord;
  lastPlatformId = platformId;
  AppLoading.show();
  // var curRequestPageIndex = paginationHelper.getCurRequestPageIndex();
  try {
    var retData = await apiRequest.requestGameSearch(params: {
      'ty': curGameType,
      'page': 1,
      'page_size': pageSize,
      'w': keyWord,
      'platform_id': platformId,
      'tag_id': 0,
    });
    List list = retData['d'];
    Log.d("游戏搜索结果数目：${list.length}");
    onSuccess();
  } catch (e, stack) {
    //  subTypeGameList.value = [];
    Log.e("$e, $stack");
  }
  AppLoading.close();
}

List<GameEntity> handleGameListData(jsonList, RxList<GameEntity> tarList) {
  List<GameEntity> list = GameEntity.getList(jsonList);
  tarList.clear();
  tarList.addAll(list);
  tarList.refresh();
  return list;
}

/// Tag列表
Future<void> requestTagList(RxList<GameTagEntity> tarList, String gameType, {platformId = 0}) async {
  try {
    var json = await apiRequest.requestTagList(params: {
      'game_type': gameType,
      'platform_id': platformId,
    });
    var list = GameTagEntity.getList(json);
    tarList.clear();
    tarList.add(GameTagEntity.def);
    tarList.addAll(list);
    tarList.refresh();
  } catch (e, stack) {
    tarList.clear();
    tarList.add(GameTagEntity.def);
    Log.e("$e, $stack");
  }
  Log.d("=======游戏tag列表长度：${tarList.length} ");
}

String lastKeyWord = "";
String lastPlatformId = "";



Future<void> requestGameLaunch(GameEntity gameEntity) async {
  GlobeController globeController = Get.find<GlobeController>();
  if (globeController.isLogin()) {
    AppLoading.show();
    try {
      var url = await apiRequest.requestGameLaunch(params: {
        'pid': gameEntity.platformId,
        'code': gameEntity.gameId,
      });
      Get.toNamed(Routes.WEBVIEW, arguments: {"url": url, 'title': gameEntity.brAlias});
      Log.d("请求游戏Url结果：$url");
    } catch (e, stack) {
      Log.e("请求游戏Url结果异常 $e == > \n $stack");
    }
    AppLoading.close();
  } else {
    showLoginRegisterDialog();
  }
}

Future<void> requestAddFav(GameEntity gameEntity) async {
  AppLoading.show();
  var ret = await apiRequest.requestFavInsert(params: {"id": gameEntity.id});
  if (ret == retCodeSuccess) {
    gameEntity.switchFavState(true);
    // Toast.show("Success");
  } else {
    Toast.show("Fail:$ret");
  }
  AppLoading.close();
  Log.d("添加收藏结果：$ret");
}

Future<void> requestDelFav(GameEntity gameEntity) async {
  AppLoading.show();
  var ret = await apiRequest.requestFavDelete(params: {"id": gameEntity.id});
  if (ret == retCodeSuccess) {
    gameEntity.switchFavState(false);
    // Toast.show("Success");
  } else {
    Toast.show("Fail:$ret");
  }
  AppLoading.close();
  Log.d("删除收藏结果：$ret");
}
