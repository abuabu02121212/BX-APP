import 'package:flutter/cupertino.dart';
import 'package:flutter_comm/app/entity/game_tag.dart';
import 'package:flutter_comm/app/modules/main/controllers/main_controller.dart';
import 'package:get/get.dart';

import '../../../../app_config.dart';
import '../../../../http/request.dart';
import '../../../../util/Log.dart';
import '../../../../util/double_click_exit_app.dart';
import '../../../../util/dynamic_index_rx.dart';
import '../../../../util/entity/entites.dart';
import '../../../../util/extensions.dart';
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
import '../views/game_search_dialog.dart';
import 'game_list_requests.dart';
import 'home_requests.dart';

class HomeController extends GetxController {
  final gameTypes = RxList<GameTypeEntity>(GameTypeEntity.getList());
  final selectedGameTypeIndex = 0.obs;

  // final selectedSearchItemIndex = 0.obs;
  final List<int> gameTypePressedRecordList = [0];
  final ScrollController scrollController = ScrollController();
  final showingMarqueeText = "".obs;
  final noticeListRx = RxList<NoticeEntity>();

  final List<GameNavEntity> navItemList = [];

  final lastWinListRx = RxList<LastWinEntity>();
  final verticalListPos0ShowSize = 0.obs;

  late final recList = AppRxList<AppRxList<GameEntity>>(List.generate(7, (index) => AppRxList<GameEntity>()));
  late final tab1List = AppRxList<AppRxList<GameEntity>>(List.generate(5, (index) => AppRxList<GameEntity>()));
  late final tab2List = AppRxList<AppRxList<GameEntity>>();
  late final searchRxList = AppRxList<GameEntity>();
  late final tab2TagList = AppRxList<AppRxList<GameTagEntity>>();

  final bannerList = RxList<BannerEntity>();

//  final IndexRxMap level2TabSelectedIndexMap = IndexRxMap();
  final IndexRxMap tagTabSelectedIndexMap = IndexRxMap();

  void switchTabWithAddPressedRecord(int index) {
    selectedGameTypeIndex.value = index;
    gameTypePressedRecordList.add(index);
    requestTabPageData(index);
  }

  final hotIsSelected = false.obs;
  final favIsSelected = false.obs;

  void requestTabPageData(int tabIndex) {
    hotIsSelected.value = false;
    favIsSelected.value = false;
    if(navItemList.isEmpty){
      requestMemberNav(navItemList, gameTypes);
    }
    if (tabIndex == 0) {
      requestTab0GameList();
    } else if (tabIndex == 1) {
      requestTab1GameList();
    } else {
      tagTabSelectedIndexMap.clear();
      requestTab2GameList();
    }
  }

  String getCurGameType() {
    return gameTypes[selectedGameTypeIndex.value].gameType;
  }

  List<String> tab0TyList = ["hot", "fav", "rec", "rec", "rec", "rec", "rec"];
  String tab1TyName = 'fav';

  String getInsertFavTy(int listItemIndex) {
    var selectedTypeIndex = selectedGameTypeIndex.value;
    if (selectedTypeIndex == 0) {
      return tab0TyList[listItemIndex];
    } else if (selectedTypeIndex == 1) {
      return tab1TyName;
    }
    if(listItemIndex == searchDialogListItemIndex){
      return 'hot';
    }
    return '';
  }

  final DoubleClickExitApp doubleClickExitApp = DoubleClickExitApp();

  bool consumePressedRecord() {
    Log.d("当前路由是：${appNavigatorObserver.curRouterName} list:${appNavigatorObserver.routerNameList}");
    if (appNavigatorObserver.curRouterName != Routes.SPLASH) {
      return false;
    }
    if (isHomeDrawerShowing) {
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

  /// 小按钮请求
  Future<RequestResultEntity?> onLevel2ListItemTabSwitch({required listItemIndex, pageIndex = 1}) async {
    // level2TabSelectedIndexMap.getIndexRxByPos(listItemIndex).value = tabIndex;
    int tabIndex = 0;
    // 刷新列表数据
    if (tabIndex == 0) {
      AppLoading.show();
      // await requestTab0FavGameList();
      AppLoading.close();
    } else if (tabIndex == 1) {
    } else if (tabIndex == 2) {
      /*return await requestMemberFavList2(
        tab2List[listItemIndex],
        getCurGameType(),
        platformId: curTab2GameNavEntityList[listItemIndex].id,
        pageIndex: pageIndex,
      );*/
    }
    return null;
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
  Future<void> requestTab0GameList() async {
    await requestHotGameListForRec(recList[0]);
    await requestFavGameListForRec(recList[1]);
    for (int i = 2; i < recList.length; i++) {
      RxList<GameEntity> item = recList[i];
      await requestRecGameList(gameTypeList[i - 2], item);
    }
  }

  /// tab 0 favs
  Future<void> requestTab0FavGameList() async {
    await requestMemberFavList2(recList[0], tab0TyList[0], gameType: 0);
    await requestMemberFavList2(recList[1], tab0TyList[1], gameType: 0);
    for (int i = 2; i < recList.length; i++) {
      AppRxList<GameEntity> item = recList[i];
      await requestMemberFavList2(item, tab0TyList[i], gameType: gameTypeList[i - 2]);
    }
  }

  List<int> gameTypeList = [3, 2, 5, 4, 1];

  /// tab 1
  Future<void> requestTab1GameList() async {
    AppLoading.show();
    for (int i = 0; i < tab1List.length; i++) {
      await requestFavGameList(tab1List[i], ty: gameTypeList[i].toString());
    }
    AppLoading.close();
  }

  /// tab 1 -fav
  Future<void> requestTab1FavGameList() async {
    AppLoading.show();
    for (int i = 0; i < tab1List.length; i++) {
      await requestMemberFavList2(tab1List[i], tab1TyName, gameType: gameTypeList[i]);
    }
    AppLoading.close();
  }

  /// tab 1 -hot
  Future<void> requestTab1HotGameList() async {
    AppLoading.show();
    for (int i = 0; i < tab1List.length; i++) {
      await requestHotGameList(tab1List[i], gameTypeList[i]);
    }
    AppLoading.close();
  }

  List<GameNavEntity> curTab2GameNavEntityList = [];

  /// tab 2
  Future<void> requestTab2GameList({func = 0}) async {
    AppLoading.show();
    var tempTab2List = RxList<AppRxList<GameEntity>>();
    curTab2GameNavEntityList = navItemList.where((element) => getCurGameType() == element.gameType).toList();
    for (var item in curTab2GameNavEntityList) {
      var tarList = AppRxList<GameEntity>();
      tarList.strExt = item.name;
      tempTab2List.add(tarList);
      if (func == 0) {
        await requestGameList(tarList, getCurGameType(), platformId: item.id);
      }else if (func == 1) {
        await requestHotGameList(tarList, int.tryParse(getCurGameType()) ?? 0, platformId: item.id, pageSize: 20);
      } else if (func == 2) {
        await requestMemberFavList2(tarList, '', gameType: int.tryParse(getCurGameType()) ?? 0, platformId: item.id);
      }
    }
    tab2List.clear();
    tab2List.addAll(tempTab2List);
    tab2List.refresh();
    AppLoading.close();
  }
}
