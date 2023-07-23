import 'package:flutter/cupertino.dart';
import 'package:flutter_comm/app/entity/game_tag.dart';
import 'package:flutter_comm/app/modules/login_register/views/login_regiseter_widget.dart';
import 'package:flutter_comm/app/modules/main/controllers/main_controller.dart';
import 'package:flutter_comm/globe_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../app_config.dart';
import '../../../../http/request.dart';
import '../../../../http/ret_code.dart';
import '../../../../util/Log.dart';
import '../../../../util/double_click_exit_app.dart';
import '../../../../util/loading_util.dart';
import '../../../../util/pagination_helper.dart';
import '../../../../util/text_util.dart';
import '../../../../util/toast_util.dart';
import '../../../../util/weburl_util.dart';
import '../../../entity/banner.dart';
import '../../../entity/game_item.dart';
import '../../../entity/game_nav.dart';
import '../../../entity/game_type.dart';
import '../../../entity/last_win.dart';
import '../../../entity/notice.dart';
import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  final gameTypes = RxList<GameTypeEntity>(GameTypeEntity.getList());
  final selectedGameTypeIndex = (-1).obs;
  final selectedTagIndex = 0.obs;
  final selectedChildTabIndex = 0.obs;
  final List<int> gameTypePressedRecordList = [-1];
  final ScrollController scrollController = ScrollController();
  final showingMarqueeText = "".obs;
  final noticeListRx = RxList<NoticeEntity>();

  final List<GameNavEntity> navItemList = [];

  void addPressedRecord(int index) {
    gameTypePressedRecordList.add(index);
    requestSubTypeListData(index);
    Log.d("========addPressedRecord：$gameTypePressedRecordList");
  }

  void requestSubTypeListData(int index) {
    paginationHelper.reset();
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
    Log.d("当前路由是：${appNavigatorObserver.curRouterName} list:${appNavigatorObserver.routerNameList}");
    if (appNavigatorObserver.curRouterName != Routes.SPLASH) {
      return false;
    }
    MainController mainController = Get.find<MainController>();
    if (mainController.indicatorTabController.selectedIndexNotifier.value == 0) {
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
    }
    doubleClickExitApp.onClick();
    return true;
  }

  final subTypeGameList = RxList<GameEntity>();
  final lastWinListRx = RxList<LastWinEntity>();
  final verticalListPos0ShowSize = 0.obs;
  final gameTagList = RxList<GameTagEntity>();
  final PaginationHelper paginationHelper = PaginationHelper(15);

  final recommend0GameList = RxList<GameEntity>();
  final recommend1GameList = RxList<GameEntity>();
  final recommend2GameList = RxList<GameEntity>();
  final recommend3GameList = RxList<GameEntity>();
  final recommend4GameList = RxList<GameEntity>();
  final recommend5GameList = RxList<GameEntity>();
  final recommend6GameList = RxList<GameEntity>();

  late final recList = <RxList<GameEntity>>[
    recommend0GameList,
    recommend1GameList,
    recommend2GameList,
    recommend3GameList,
    recommend4GameList,
    recommend5GameList,
    recommend6GameList,
  ];

  final bannerList = RxList<BannerEntity>();

  // 滚动监听回调
  void _scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent && !scrollController.position.outOfRange) {
      if (selectedChildTabIndex.value == 3) {
        requestGameSearch(keyWord: lastKeyWord, platformId: lastPlatformId);
      } else if (selectedGameTypeIndex.value == 0) {
        requestHotGameList();
      } else if (selectedGameTypeIndex.value == 1) {
        requestFavGameList();
      } else if (selectedGameTypeIndex.value > 1) {
        requestGameList();
      }
      Log.d("=============滚动到了底部==============");
    }
  }

  void onGameTypeTitleBarSelected(int index) {
    selectedTagIndex.value = 0;
    selectedChildTabIndex.value = index;
    if (index != 3) {
      paginationHelper.reset();
    }
    if (index == 0) {
      requestGameList();
    } else if (index == 1) {
      requestHotGameList(ty: getCurGameType());
    } else if (index == 2) {
      requestMemberFavList2(ty: getCurGameType());
    }
  }

  Future<void> pageShowHotGameList() async {
    if (verticalListPos0ShowSize.value < subTypeGameList.length) {
      AppLoading.show();
      // await Future.delayed(const Duration(milliseconds: 200));
      int temSize = verticalListPos0ShowSize.value + 100;
      if (temSize <= subTypeGameList.length) {
        verticalListPos0ShowSize.value = temSize;
      } else {
        verticalListPos0ShowSize.value = subTypeGameList.length;
      }
      scrollController.animateTo(scrollController.offset + 30.w, duration: const Duration(milliseconds: 250), curve: Curves.ease);
      AppLoading.close();
    }
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    scrollController.addListener(_scrollListener);
    requestMemberNav();
    requestNotice();
    requestLastWin();

    /// 请求banner列表
    var bannerJson = await apiRequest.requestBanner();
    bannerList.value = BannerEntity.getList(bannerJson);
    Log.d("bannerArr 的长度：${bannerList.length}");

    /// 请求推荐游戏列表
    requestRecommendGameList();
  }

  void requestRecommendGameList() {
    requestHotGameListForRec();
    requestFavGameListForRec();
    for (int i = 2; i < recList.length; i++) {
      RxList<GameEntity> item = recList[i];
      requestRecGameList(i - 1, item);
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
    var values = navJson.values;
    List<GameNavEntity> ls = [];
    for (var items in values) {
      for (var item in items) {
        var entity = GameNavEntity.fromJson(item);
        ls.add(entity);
      }
    }
    navItemList.clear();
    navItemList.addAll(ls);
    Log.d("nav的数据size是：${navItemList.length} ");
  }

  Future<void> requestRecGameList(int ty, RxList<GameEntity> rx) async {
    var retArr1 = await apiRequest.requestGameRecList(params: {
      'ty': ty,
      'page': 1,
      'page_size': 19,
      'platform_id': 0,
    });
    rx.value = GameEntity.getList(retArr1['d']);
    Log.d("=======ty:$ty 推荐游戏数目：${rx.length}");
  }

  Future<void> requestHotGameListForRec() async {
    var tarRx = recList[0];
    try {
      var retData = await apiRequest.requestHotGameList({
        'ty': 0,
        'page': 1,
        'page_size': 19,
        'platform_id': 0,
      });
      var list = GameEntity.getList(retData['d']);
      tarRx.value = list;
      Log.d("推荐热门游戏数目：${tarRx.length}");
    } catch (e, stack) {
      Log.e("$e, $stack");
    }
  }

  Future<void> requestFavGameListForRec() async {
    var tarRx = recList[1];
    try {
      var retData = await apiRequest.requestGameFavList(params: {
        'page': 1,
        'page_size': 19,
        'platform_id': 0,
      });
      var list = GameEntity.getList(retData['d']);
      tarRx.value = list;
      Log.d("推荐收藏游戏数目：${tarRx.length}");
    } catch (e, stack) {
      Log.e("$e, $stack");
    }
    Log.d("推荐收藏游戏数目：${subTypeGameList.length}");
  }

  Future<void> requestHotGameList({ty = "0"}) async {
    if (paginationHelper.isHasRequestedAllData()) {
      return;
    }
    AppLoading.show();
    try {
      var curRequestPageIndex = paginationHelper.getCurRequestPageIndex();
      var retData = await apiRequest.requestHotGameList({
        'ty': ty,
        'page': curRequestPageIndex,
        'page_size': paginationHelper.perPageSize,
        'platform_id': 0,
      });
      onPaginationRequestFinish(curRequestPageIndex, retData['d']);
      Log.d("热门游戏数目：${subTypeGameList.length}");
    } catch (e, stack) {
      subTypeGameList.value = [];
      Log.e("$e, $stack");
    }
    AppLoading.close();
  }

  Future<void> requestFavGameList({ty = "0"}) async {
    if (paginationHelper.isHasRequestedAllData()) {
      return;
    }
    AppLoading.show();
    try {
      var curRequestPageIndex = paginationHelper.getCurRequestPageIndex();
      var retData = await apiRequest.requestGameFavList(params: {
        'ty': ty,
        'page': curRequestPageIndex,
        'page_size': paginationHelper.perPageSize,
        // 'l': 500,
        'platform_id': 0,
      });
      onPaginationRequestFinish(curRequestPageIndex, retData['d']);
    } catch (e, stack) {
      subTypeGameList.value = [];
      Log.e("$e, $stack");
    }
    AppLoading.close();
    Log.d("收藏游戏数目：${subTypeGameList.length}");
  }
Future<void> requestMemberFavList2({ty = "0"}) async {
    if (paginationHelper.isHasRequestedAllData()) {
      return;
    }
    AppLoading.show();
    try {
      var curRequestPageIndex = paginationHelper.getCurRequestPageIndex();
      var retData = await apiRequest.requestMemberFavList(params: {
        'ty': ty,
        'page': curRequestPageIndex,
        'page_size': paginationHelper.perPageSize,
        'platform_id': 0,
      });
      onPaginationRequestFinish(curRequestPageIndex, retData);
    } catch (e, stack) {
      subTypeGameList.value = [];
      Log.e("$e, $stack");
    }
    AppLoading.close();
    Log.d("收藏游戏2数目：${subTypeGameList.length}");
  }

  Future<void> requestGameList({tagId = 0}) async {
    if (paginationHelper.isHasRequestedAllData()) {
      return;
    }
    AppLoading.show();
    var curRequestPageIndex = paginationHelper.getCurRequestPageIndex();
    try {
      var retData = await apiRequest.requestGameList(params: {
        'game_type': getCurGameType(),
        'page': curRequestPageIndex,
        'page_size': paginationHelper.perPageSize,
        'platform_id': 0,
        'tag_id': tagId,
      });
      onPaginationRequestFinish(curRequestPageIndex, retData['d']);
    } catch (e, stack) {
      subTypeGameList.value = [];
      Log.e("$e, $stack");
    }
    AppLoading.close();
    Log.d("==子类=====游戏数目：${subTypeGameList.length}");
  }

  String lastKeyWord = "";
  String lastPlatformId = "";

  Future<void> requestGameSearch({keyWord = '', platformId = "0"}) async {
    if (paginationHelper.isHasRequestedAllData()) {
      return;
    }
    lastKeyWord = keyWord;
    lastPlatformId = platformId;
    AppLoading.show();
    var curGameType = getCurGameType();
    var curRequestPageIndex = paginationHelper.getCurRequestPageIndex();
    try {
      var retData = await apiRequest.requestGameSearch(params: {
        'ty': curGameType,
        'page': curRequestPageIndex,
        'page_size': paginationHelper.perPageSize,
        'w': keyWord,
        'platform_id': platformId,
        'tag_id': 0,
      });
      onPaginationRequestFinish(curRequestPageIndex, retData['d']);
      onGameTypeTitleBarSelected(3);
    } catch (e, stack) {
      subTypeGameList.value = [];
      Log.e("$e, $stack");
    }
    AppLoading.close();
    Log.d("==game_type:$curGameType=====游戏搜索结果size：${subTypeGameList.length}");
  }

  Future<void> requestTagList() async {
    gameTagList.clear();
    gameTagList.add(GameTagEntity.def);
    gameTagList.refresh();
    try {
      var json = await apiRequest.requestTagList(params: {
        'game_type': getCurGameType(),
        'platform_id': 0,
      });
      gameTagList.clear();
      gameTagList.add(GameTagEntity.def);
      gameTagList.addAll(GameTagEntity.getList(json));
      gameTagList.refresh();
    } catch (e, stack) {
      subTypeGameList.value = [];
      Log.e("$e, $stack");
    }
    Log.d("=======游戏tag列表长度：${gameTagList.length} ");
  }

  void onPaginationRequestFinish(int curRequestPageIndex, retArr) {
    var list = GameEntity.getList(retArr);
    if (curRequestPageIndex == 1) {
      subTypeGameList.value = list;
    } else if (curRequestPageIndex > 1) {
      subTypeGameList.addAll(list);
      subTypeGameList.refresh();
    }
    if (list.length > 2) {
      Future.delayed(const Duration(milliseconds: 250), () {
        scrollController.jumpTo(scrollController.offset + 20.w);
      });
    }
    paginationHelper.onRequestDataOk(list.length);
  }

  Future<void> requestNotice() async {
    var json = await apiRequest.requestNotice();
    var noticeList = NoticeEntity.getList(json);
    noticeListRx.value = noticeList;
    if (noticeList.isNotEmpty) {
      String temp = '';
      for (var item in noticeList) {
        temp += '${item.content}   ';
      }
      temp = getUrlDecodeStr(temp);
      showingMarqueeText.value = temp.trim();
      Log.d("=======通知返回 size：${noticeList.length} ");
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

  Future<void> requestLastWin() async {
    AppLoading.show();
    try {
      var ret = await apiRequest.requestLastWin();
      var listJson = ret['d'];
      var list = LastWinEntity.getList(listJson);
      lastWinListRx.value = list;
      Log.d("请求最近获奖结果size：${list.length}");
    } catch (e, stack) {
      Log.e("stack: $stack");
    }
    AppLoading.close();
  }

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
}
