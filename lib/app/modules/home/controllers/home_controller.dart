import 'package:get/get.dart';

import '../../../../http/request.dart';
import '../../../../util/Log.dart';
import '../../../entity/banner.dart';
import '../../../entity/game_type_nav.dart';
import '../../../entity/hot_game.dart';

class HomeController extends GetxController {
  List<String> gameTypes = ["Quente", "Dentro \nDe Casa", "Slot", "Pesca", "Pôquer", "Esporte", "Ao Vivo", "Esports"];

  final selectedGameTypeIndex = (-1).obs;
  List<int> gameTypePressedRecordList = [-1];

  void addPressedRecord(int index) {
    gameTypePressedRecordList.add(index);
    Log.d("========addPressedRecord：$gameTypePressedRecordList");
  }

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
    return false;
  }

  final count = 0.obs;
  final hotGameList = RxList<HotGameEntity>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    await requestHotGameList();

    var navJson = await apiRequest.requestMemberNav();
   // var navArr = GameTypeNav.getList(navJson);
    Log.d("navArr 1的的数据：${navJson['1']}");

    var bannerJson = await apiRequest.requestBanner();
    var bannerArr = BannerEntity.getList(bannerJson);
    Log.d("bannerArr 的长度：${bannerArr.length}");
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

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
