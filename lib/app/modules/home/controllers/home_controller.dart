import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../http/request.dart';
import '../../../../http/ret_code.dart';
import '../../../../util/Log.dart';
import '../../../../util/double_click_exit_app.dart';
import '../../../../util/loading_util.dart';
import '../../../../util/toast_util.dart';
import '../../../entity/banner.dart';
import '../../../entity/game_type.dart';
import '../../../entity/hot_game.dart';
import '../../../entity/notice.dart';

class HomeController extends GetxController {
  final gameTypes = RxList<GameTypeEntity>(GameTypeEntity.getList());
  final selectedGameTypeIndex = (-1).obs;
  final List<int> gameTypePressedRecordList = [-1];
  final ScrollController scrollController = ScrollController();

  void addPressedRecord(int index) {
    gameTypePressedRecordList.add(index);
    if (index == 0 && hotGameList.isEmpty) {
      requestHotGameList();
    } else if (index == 1 && favGameList.isEmpty) {
      requestFavGameList();
    }
    Log.d("========addPressedRecord：$gameTypePressedRecordList");
  }

  DoubleClickExitApp doubleClickExitApp = DoubleClickExitApp();

  bool consumePressedRecord() {
    Log.d("========consumePressedRecord：$gameTypePressedRecordList");
    if (gameTypePressedRecordList.isNotEmpty) {
      var removeLast = gameTypePressedRecordList.removeLast();
      if (removeLast == selectedGameTypeIndex.value) {
        removeLast = gameTypePressedRecordList.removeLast();
      }
      selectedGameTypeIndex.value = removeLast;
      return true;
    }
    doubleClickExitApp.onClick();
    return true;
  }

  final count = 0.obs;
  final hotGameList = RxList<GameEntity>();
  final favGameList = RxList<GameEntity>();
  final recommend0GameList = RxList<GameEntity>();
  final recommend1GameList = RxList<GameEntity>();
  final recommend2GameList = RxList<GameEntity>();
  final recommend3GameList = RxList<GameEntity>();
  final recommend4GameList = RxList<GameEntity>();
  final recommend5GameList = RxList<GameEntity>();

  late final recList = <RxList<GameEntity>>[
    recommend0GameList,
    recommend1GameList,
    recommend2GameList,
    recommend3GameList,
    recommend4GameList,
    recommend5GameList,
  ];

  final bannerList = RxList<BannerEntity>();

  @override
  Future<void> onReady() async {
    super.onReady();
    requestMemberNav();
    requestNotice();

    /// 请求banner列表
    var bannerJson = await apiRequest.requestBanner();
    bannerList.value = BannerEntity.getList(bannerJson);
    Log.d("bannerArr 的长度：${bannerList.length}");

    /// 请求推荐游戏列表
    for (int i = 0; i < recList.length; i++) {
      RxList<GameEntity> item = recList[i];
      requestRecGameList(i, item);
    }
  }

  Future<void> requestMemberNav() async {
    Map<String, dynamic> navJson = await apiRequest.requestMemberNav();
    var preList = GameTypeEntity.preList;
    for(var item in preList){
      if(navJson.containsKey(item.gameType)){
        gameTypes.add(item);
      }
    }
    Log.d("nav的数据是：$navJson ");
  }

  Future<void> requestHotGameList() async {
    var retArr1 = await apiRequest.requestHotGameList({'ty': 0, 'l': 9999, 'platform_id': 0});
    hotGameList.value = GameEntity.getList(retArr1);
    Log.d("热门游戏数目：${hotGameList.length}");
  }

  Future<void> requestFavGameList() async {
    var retArr1 = await apiRequest.requestGameFavList(params: {'l': 18, 'platform_id': 0});
    favGameList.value = GameEntity.getList(retArr1);
    Log.d("收藏游戏数目：${favGameList.length}");
  }

  Future<void> requestRecGameList(int ty, RxList<GameEntity> rx) async {
    var retArr1 = await apiRequest.requestGameRecList(params: {'ty': ty, 'l': 18, 'platform_id': 0});
    rx.value = GameEntity.getList(retArr1);
    Log.d("=======ty:$ty 推荐游戏数目：${rx.length}");
  }

  Future<void> requestTagList(String gameType) async {
    var json = await apiRequest.requestTagList(params: {'game_type': gameType, 'platform_id': 0});
    Log.d("=======游戏tag列表：$json ");
  }

  Future<void> requestNotice() async {
    var json = await apiRequest.requestNotice();
    var noticeList = NoticeEntity.getList(json);
    if (noticeList.isNotEmpty) {
      Log.d("=======通知返回json ：${noticeList[0]} ");
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
}
