import 'package:get/get.dart';

import '../../../../globe_controller.dart';
import '../../../../http/comm_request.dart';
import '../../../../http/request.dart';
import '../../../../http/ret_code.dart';
import '../../../../util/Log.dart';
import '../../../../util/entity/entites.dart';
import '../../../../util/extensions.dart';
import '../../../../util/load_more_help.dart';
import '../../../../util/loading_util.dart';
import '../../../../util/toast_util.dart';
import '../../../entity/game_item.dart';
import '../../../entity/game_tag.dart';
import '../../../routes/app_pages.dart';
import '../../login_register/views/login_regiseter_widget.dart';
import '../views/game_entrance_widget.dart';

/// TAB 0-1. 推荐游戏列表 - 热门游戏
int pageSize = 20;

Future<void> requestHotGameListForRec(RxList<GameEntity> tarRx) async {
  try {
    var retData = await apiRequest.requestHotGameList(params: {
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
Future<RequestResultEntity?> requestFavGameList(AppRxList<GameEntity> tarRx, {ty = "0", pageIndex=1}) async {
  var listUIKey = "GameFavList1-$ty";
  return await requestGamePageData(
    apiRequest.requestGameFavList,
    {
      'ty': ty,
      'page_size': pageSize,
      'platform_id': 0,
    },
    listUIKey: listUIKey,
    gameListPageIndexHelper: gameListPageIndexHelper,
    requestPageIndex: pageIndex,
    tarRx: tarRx,
    pageSize: pageSize,
  );
}

/// TAB 2 以后 游戏列表
LoadMorePageIndexHelper gameListPageIndexHelper = LoadMorePageIndexHelper();

Future<RequestResultEntity?> requestGameList(RxList<GameEntity> tarRx, String gameType, {tagId = 0, platformId = 0, pageIndex = 1}) async {
  var listUIKey = "GameList2-$gameType-$platformId-$tagId";
  return await requestGamePageData(
    apiRequest.requestGameList,
    {
      'game_type': gameType,
      'page_size': pageSize,
      'platform_id': platformId,
      'tag_id': tagId,
    },
    listUIKey: listUIKey,
    gameListPageIndexHelper: gameListPageIndexHelper,
    requestPageIndex: pageIndex,
    tarRx: tarRx,
    pageSize: pageSize,
  );
}

/// 小按钮的热门游戏列表
Future<RequestResultEntity?> requestHotGameList(RxList<GameEntity> tarRx, String gameType, {platformId = 0, pageIndex = 1}) async {
  AppLoading.show();
  var listUIKey = "HotGameList2-$gameType-$platformId";
  var ret = await requestGamePageData(
    apiRequest.requestHotGameList,
    {
      'ty': gameType,
      'page_size': pageSize,
      'platform_id': platformId,
    },
    listUIKey: listUIKey,
    gameListPageIndexHelper: gameListPageIndexHelper,
    requestPageIndex: pageIndex,
    tarRx: tarRx,
    pageSize: pageSize,
  );
  AppLoading.close();
  return ret;
}

/// 小按钮的收藏游戏列表
Future<RequestResultEntity?> requestMemberFavList2(RxList<GameEntity> tarRx, String gameType, {platformId = 0, pageIndex = 1}) async {
  AppLoading.show();
  var listUIKey = "MemberFavList2-$gameType-$platformId";
  var ret = await requestGamePageData(
    apiRequest.requestMemberFavList,
    {
      'ty': gameType,
      'page_size': pageSize,
      'platform_id': platformId,
    },
    listUIKey: listUIKey,
    gameListPageIndexHelper: gameListPageIndexHelper,
    requestPageIndex: pageIndex,
    tarRx: tarRx,
    pageSize: pageSize,
    isDData: false
  );
  AppLoading.close();
  return ret;
}

/// 小按钮的搜索游戏列表
Future<RequestResultEntity?> requestGameSearch(
  RxList<GameEntity> tarRx,
  String gameType, {
  keyWord = '',
  platformId = "0",
  onSuccess,
  pageIndex = 1,
}) async {
  lastKeyWord = keyWord;
  lastPlatformId = platformId;
  AppLoading.show();
  // var curRequestPageIndex = paginationHelper.getCurRequestPageIndex();
  try {
    var retData = await apiRequest.requestGameSearch(params: {
      'ty': gameType,
      'page': pageIndex,
      'page_size': pageSize,
      'w': keyWord,
      'platform_id': platformId,
      'tag_id': 0,
    });
    onSuccess();
    return handleGameListData(retData['d'], tarRx, pageSize, pageIndex);
  } catch (e, stack) {
    onRequestFail(tarRx);
    Log.e("$e, $stack");
  }
  AppLoading.close();
  return null;
}

void onRequestFail(RxList<GameEntity> tarRx) {
  tarRx.clear();
  tarRx.refresh();
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

Future<void> onGameItemClick(GameEntity gameEntity) async {
  GlobeController globeController = Get.find<GlobeController>();
  if (globeController.isLogin()) {
    showGameEntranceDialog(gameEntity);
  } else {
    showLoginRegisterDialog();
  }
}

Future<void> requestEnterGame(GameEntity gameEntity) async {
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
