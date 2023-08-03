import 'package:flutter/cupertino.dart';
import 'package:flutter_comm/app/entity/game_tag.dart';
import 'package:flutter_comm/app/modules/main/controllers/main_controller.dart';
import 'package:get/get.dart';

import '../../../../app_config.dart';
import '../../../../http/request.dart';
import '../../../../util/Log.dart';
import '../../../../util/double_click_exit_app.dart';
import '../../../../util/dynamic_index_rx.dart';
import '../../../../util/loading_util.dart';
import '../../../entity/banner.dart';
import '../../../entity/cs.dart';
import '../../../entity/game_item.dart';
import '../../../entity/game_nav.dart';
import '../../../entity/game_type.dart';
import '../../../entity/last_win.dart';
import '../../../entity/notice.dart';
import '../../../routes/app_pages.dart';
import '../../home_menu/views/home_menu_view.dart';
import '../../login_register/views/login_regiseter_widget.dart';
import 'game_list_requests.dart';
import 'home_requests.dart';

class HomeController extends GetxController {
  final gameTypes = RxList<GameTypeEntity>(GameTypeEntity.getList());
  final selectedGameTypeIndex = 0.obs;

  final selectedSearchItemIndex = 0.obs;
  final List<int> gameTypePressedRecordList = [0];
  final ScrollController scrollController = ScrollController();
  final showingMarqueeText = "".obs;
  final noticeListRx = RxList<NoticeEntity>();

  final PageStorageBucket pageStorageBucket = PageStorageBucket();
  final PageStorageBucket pageStorageBucket2 = PageStorageBucket();
  final PageStorageBucket pageStorageBucket3 = PageStorageBucket();

  final List<GameNavEntity> navItemList = [];

  final lastWinListRx = RxList<LastWinEntity>();
  final verticalListPos0ShowSize = 0.obs;
 // final PaginationHelper paginationHelper = PaginationHelper(15);

  late final recList = RxList<RxList<GameEntity>>(List.generate(7, (index) => RxList<GameEntity>()));
  late final tab1List = RxList<RxList<GameEntity>>(List.generate(7, (index) => RxList<GameEntity>()));
  late final tab2List = RxList<RxList<GameEntity>>();
  late final tab2TagList = RxList<RxList<GameTagEntity>>();

  final bannerList = RxList<BannerEntity>();
  final IndexRxMap childTabSelectedIndexMap = IndexRxMap();
  final IndexRxMap tagTabSelectedIndexMap = IndexRxMap();


  void addPressedRecord(int index) {
    selectedGameTypeIndex.value = index;
    gameTypePressedRecordList.add(index);
    requestTabPageData(index);
    Log.d("========addPressedRecord：$gameTypePressedRecordList");
  }

  void requestTabPageData(int tabIndex) {
  //  paginationHelper.reset();
    if (tabIndex == 0) {
      requestTab0GameList();
    } else if (tabIndex == 1) {
      requestTab1FavGameList();
    } else {
      tagTabSelectedIndexMap.clear();
      requestTab2GameList();
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
    if(isLoinRegisterShowing){
      closeLoginRegisterDialog();
      return true;
    }
    if(isHomeDrawerShowing){
      closeHomeDrawer();
      return true;
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
        requestTabPageData(selectedGameTypeIndex.value);
        return true;
      }
    }
    doubleClickExitApp.onClick();
    return true;
  }

  // 滚动监听回调
  // void _scrollListener() {
  //   if (scrollController.offset >= scrollController.position.maxScrollExtent && !scrollController.position.outOfRange) {
  //     if (selectedChildTabIndex.value == 3) {
  //       requestGameSearch(keyWord: lastKeyWord, platformId: lastPlatformId);
  //     } else if (selectedGameTypeIndex.value == 0) {
  //       requestHotGameList();
  //     } else if (selectedGameTypeIndex.value == 1) {
  //       requestFavGameList();
  //     } else if (selectedGameTypeIndex.value > 1) {
  //       requestGameList();
  //     }
  //     Log.d("=============滚动到了底部==============");
  //   }
  // }

  /// 小按钮请求
  Future<void> onGameTypeTitleBarSelected(int index, {required listItemIndex}) async {
    Log.d2("onGameTypeTitleBarSelected=================index:$index============");
    tagTabSelectedIndexMap.getIndexRxByPos(listItemIndex).value = 0;
    childTabSelectedIndexMap.getIndexRxByPos(listItemIndex).value = index;
    if (index != 3) {
    //  paginationHelper.reset();
    }
    if (index == 0) {
      AppLoading.show();
      await requestGameList(tab2List[listItemIndex], getCurGameType(), platformId: curTab2GameNavEntityList[listItemIndex].id);
      AppLoading.close();
    } else if (index == 1) {
      requestHotGameList(tab2List[listItemIndex], getCurGameType(), platformId: curTab2GameNavEntityList[listItemIndex].id);
    } else if (index == 2) {
      requestMemberFavList2(tab2List[listItemIndex], getCurGameType(), platformId: curTab2GameNavEntityList[listItemIndex].id);
    }
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    //  scrollController.addListener(_scrollListener);
    requestMemberNav(navItemList, gameTypes);
    requestNotice(noticeListRx, showingMarqueeText);
    requestCsData(csEntity);
    requestLastWin(lastWinListRx);

    /// 请求banner列表
    var bannerJson = await apiRequest.requestBanner();
    bannerList.value = BannerEntity.getList(bannerJson);
    Log.d("bannerArr 的长度：${bannerList.length}");
    requestTab0GameList();
  }

  final csEntity = Rx<CsEntity?>(null);

  /// tab 0
  void requestTab0GameList() {
    requestHotGameListForRec(recList[0]);
    requestFavGameListForRec(recList[1]);
    List<int> tyList = [3, 2, 5, 4, 1];
    for (int i = 2; i < recList.length; i++) {
      RxList<GameEntity> item = recList[i];
      requestRecGameList(tyList[i - 2], item);
    }
  }

  /// tab 1
  Future<void> requestTab1FavGameList() async {
    List<int> tyList = [3, 2, 5, 4, 1];
    AppLoading.show();
    for (int i = 2; i < 7; i++) {
      RxList<GameEntity> item = tab1List[i];
      await requestFavGameList(item, ty: tyList[i - 2].toString());
    }
    AppLoading.close();
  }
  List<GameNavEntity> curTab2GameNavEntityList = [];
  /// tab 2 包含tag列表和游戏列表
  Future<void> requestTab2GameList() async {
    AppLoading.show();
    var tempTab2List = RxList<RxList<GameEntity>>();
    var tempTab2TagList = RxList<RxList<GameTagEntity>>();
    curTab2GameNavEntityList = navItemList.where((element) => getCurGameType() == element.gameType).toList();
    for (var item in curTab2GameNavEntityList) {
      var tarList = RxList<GameEntity>();
      var tarTagList = RxList<GameTagEntity>();
      tempTab2List.add(tarList);
      tempTab2TagList.add(tarTagList);
      await requestGameList(tarList, getCurGameType(), platformId: item.id);
      await requestTagList(tarTagList, getCurGameType(), platformId: 0);
    }
    tab2TagList.clear();
    tab2TagList.addAll(tempTab2TagList);

    tab2List.clear();
    tab2List.addAll(tempTab2List);

    tab2List.refresh();
    tab2TagList.refresh();


    AppLoading.close();
  }
}
