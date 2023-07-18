import 'package:flutter/cupertino.dart';
import 'package:flutter_comm/app/entity/game_tag.dart';
import 'package:get/get.dart';

import '../../../../http/request.dart';
import '../../../../http/ret_code.dart';
import '../../../../util/Log.dart';
import '../../../../util/double_click_exit_app.dart';
import '../../../../util/loading_util.dart';
import '../../../../util/pagination_helper.dart';
import '../../../../util/toast_util.dart';
import '../../../entity/banner.dart';
import '../../../entity/game_item.dart';
import '../../../entity/game_type.dart';
import '../../../entity/notice.dart';

class HomeController extends GetxController {
  final gameTypes = RxList<GameTypeEntity>(GameTypeEntity.getList());
  final selectedGameTypeIndex = (-1).obs;
  final selectedTagIndex = 0.obs;
  final selectedChildTabIndex = 0.obs;
  final List<int> gameTypePressedRecordList = [-1];
  final ScrollController scrollController = ScrollController();

  void addPressedRecord(int index) {
    gameTypePressedRecordList.add(index);
    requestSubTypeListData(index);
    Log.d("========addPressedRecord：$gameTypePressedRecordList");
  }

  void requestSubTypeListData(int index) {
    if (index == -1) {
      requestRecommendGameList();
    } else if (index == 0) {
      requestHotGameList();
    } else if (index == 1) {
      selectedChildTabIndex.value = 2;
      requestFavGameList();
    } else {
      selectedTagIndex.value = 0;
      selectedChildTabIndex.value = 0;
      requestGameList();
      requestTagList();
    }
  }

  String getCurGameType() {
    return gameTypes[selectedGameTypeIndex.value].gameType;
  }

  final DoubleClickExitApp doubleClickExitApp = DoubleClickExitApp();

  bool consumePressedRecord() {
    Log.d("========consumePressedRecord：$gameTypePressedRecordList  selectedGameTypeIndex:${selectedGameTypeIndex.value}");
    if (gameTypePressedRecordList.isNotEmpty) {
      var removeLast = gameTypePressedRecordList.removeLast();
      if (removeLast == selectedGameTypeIndex.value) {
        removeLast = gameTypePressedRecordList.removeLast();
      }
      selectedGameTypeIndex.value = removeLast;
      requestSubTypeListData(selectedGameTypeIndex.value);
      return true;
    }
    if (gameTypePressedRecordList.isEmpty && selectedGameTypeIndex.value != -1) {
      selectedGameTypeIndex.value = -1;
      requestSubTypeListData(selectedGameTypeIndex.value);
      Log.d("===222=====consumePressedRecord：$gameTypePressedRecordList  selectedGameTypeIndex:${selectedGameTypeIndex.value}");
      return true;
    }

    doubleClickExitApp.onClick();
    return true;
  }

  final subTypeGameList = RxList<GameEntity>();
  final gameTagList = RxList<GameTagEntity>();
  final PaginationHelper subTypeGameListPaginationHelper = PaginationHelper(15);

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
    requestRecommendGameList();
  }

  void requestRecommendGameList() {
    for (int i = 0; i < recList.length; i++) {
      RxList<GameEntity> item = recList[i];
      requestRecGameList(i, item);
    }
  }

  Future<void> requestMemberNav() async {
    Map<String, dynamic> navJson = await apiRequest.requestMemberNav();
    var preList = GameTypeEntity.preList;
    for (var item in preList) {
      if (navJson.containsKey(item.gameType)) {
        gameTypes.add(item);
      }
    }
    Log.d("nav的数据是：$navJson ");
  }

  Future<void> requestHotGameList({ty = "0"}) async {
    AppLoading.show();
    var retArr1 = await apiRequest.requestHotGameList({'ty': ty, 'l': 9999, 'platform_id': 0});
    AppLoading.close();
    subTypeGameList.value = GameEntity.getList(retArr1);
    Log.d("热门游戏数目：${subTypeGameList.length}");
  }

  Future<void> requestFavGameList({ty = "0"}) async {
    AppLoading.show();
    var retArr1 = await apiRequest.requestGameFavList(params: {'ty': ty, 'l': 18, 'platform_id': 0});
    subTypeGameList.value = GameEntity.getList(retArr1);
    AppLoading.close();
    Log.d("收藏游戏数目：${subTypeGameList.length}");
  }

  Future<void> requestRecGameList(int ty, RxList<GameEntity> rx) async {
    var retArr1 = await apiRequest.requestGameRecList(params: {'ty': ty, 'l': 18, 'platform_id': 0});
    rx.value = GameEntity.getList(retArr1);
    Log.d("=======ty:$ty 推荐游戏数目：${rx.length}");
  }

  Future<void> requestGameList({tagId = 0}) async {
    AppLoading.show();
    var curGameType = getCurGameType();
    var retArr1 = await apiRequest.requestGameList(params: {
      'game_type': curGameType,
      'page': 1,
      'page_size': 15,
      'platform_id': 0,
      'tag_id': tagId,
    });
    subTypeGameList.value = GameEntity.getList(retArr1['d']);
    subTypeGameListPaginationHelper.onRequestDataOk(subTypeGameList.length);
    AppLoading.close();
    Log.d("==game_type:$curGameType=====游戏数目：${subTypeGameList.length}");
  }

  Future<void> requestTagList() async {
    gameTagList.clear();
    gameTagList.add(GameTagEntity.def);
    gameTagList.refresh();
    var json = await apiRequest.requestTagList(params: {'game_type': getCurGameType(), 'platform_id': 0});
    gameTagList.clear();
    gameTagList.add(GameTagEntity.def);
    gameTagList.addAll(GameTagEntity.getList(json));
    gameTagList.refresh();
    Log.d("=======游戏tag列表长度：${gameTagList.length} ");
  }

  Future<void> requestNotice() async {
    var json = await apiRequest.requestNotice();
    var noticeList = NoticeEntity.getList(json);
    if (noticeList.isNotEmpty) {
      Log.d("=======通知返回content ：${noticeList[0].content} ");
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
