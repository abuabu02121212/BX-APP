import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../http/request.dart';
import '../../../../http/ret_code.dart';
import '../../../../util/Log.dart';
import '../../../../util/double_click_exit_app.dart';
import '../../../../util/loading_util.dart';
import '../../../../util/toast_util.dart';
import '../../../entity/banner.dart';
import '../../../entity/hot_game.dart';

class HomeController extends GetxController {
  List<String> gameTypes = ["Quente", "Dentro \nDe Casa", "Slot", "Pesca", "Pôquer", "Esporte", "Ao Vivo", "Esports"];

  final selectedGameTypeIndex = (-1).obs;
  List<int> gameTypePressedRecordList = [-1];
  final ScrollController scrollController = ScrollController();

  void addPressedRecord(int index) {
    gameTypePressedRecordList.add(index);
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
    await requestHotGameList();

    var navJson = await apiRequest.requestMemberNav();
    // var navArr = GameTypeNav.getList(navJson);
    Log.d("navArr 1的的数据：${navJson['1']}");

    var bannerJson = await apiRequest.requestBanner();
    bannerList.value = BannerEntity.getList(bannerJson);
    Log.d("bannerArr 的长度：${bannerList.length}");

    for (int i = 0; i < recList.length; i++) {
      RxList<GameEntity> item = recList[i];
      requestRecGameList(i, item);
    }
  }

  Future<void> requestHotGameList() async {
    var retArr1 = await apiRequest.requestHotGameList({
      'ty': 0,
      'l': 9999,
      'platform_id': 0,
    });
    hotGameList.value = GameEntity.getList(retArr1);
    Log.d("热门游戏数目：${hotGameList.length}");
  }

  Future<void> requestRecGameList(int ty, RxList<GameEntity> rx) async {
    //  ?ty=3&l=18&platform_id=0
    var retArr1 = await apiRequest.requestGameRecList(params: {
      'ty': ty,
      'l': 18,
      'platform_id': 0,
    });
    rx.value = GameEntity.getList(retArr1);
    Log.d("=======ty:$ty 推荐游戏数目：${rx.length}");
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
