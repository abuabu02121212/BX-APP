import 'package:get/get.dart';

import '../../../../http/request.dart';
import '../../../../util/Log.dart';
import '../../../../util/double_click_exit_app.dart';
import '../../../entity/banner.dart';
import '../../../entity/hot_game.dart';

class HomeController extends GetxController {
  List<String> gameTypes = ["Quente", "Dentro \nDe Casa", "Slot", "Pesca", "Pôquer", "Esporte", "Ao Vivo", "Esports"];

  final selectedGameTypeIndex = (-1).obs;
  List<int> gameTypePressedRecordList = [-1];

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
  final hotGameList = RxList<HotGameEntity>();
  final recommend0GameList = RxList<HotGameEntity>();
  final recommend1GameList = RxList<HotGameEntity>();
  final recommend2GameList = RxList<HotGameEntity>();
  final recommend3GameList = RxList<HotGameEntity>();
  final recommend4GameList = RxList<HotGameEntity>();
  final recommend5GameList = RxList<HotGameEntity>();

  late final recList = <RxList<HotGameEntity>>[
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

    for(int i = 0; i < recList.length; i ++){
      RxList<HotGameEntity> item = recList[i];
      requestRecGameList(i, item);
    }
  }

  Future<void> requestHotGameList() async {
    var retArr1 = await apiRequest.requestHotGameList({
      'ty': 0,
      'l': 9999,
      'platform_id': 0,
    });
    hotGameList.value = HotGameEntity.getList(retArr1);
    Log.d("热门游戏数目：${hotGameList.length}");
  }

  Future<void> requestRecGameList(int ty, RxList<HotGameEntity> rx) async {
    //  ?ty=3&l=18&platform_id=0
    var retArr1 = await apiRequest.requestGameRecList(params: {
      'ty': ty,
      'l': 18,
      'platform_id': 0,
    });
    rx.value = HotGameEntity.getList(retArr1);
    Log.d("=======ty:$ty 推荐游戏数目：${rx.length}");
  }
}
