import 'package:get/get_rx/src/rx_types/rx_types.dart';
import '../../../../http/request.dart';
import '../../../../util/Log.dart';
import '../../../entity/banner.dart';
import '../../../entity/cs.dart';
import '../../../entity/game_nav.dart';
import '../../../entity/game_type.dart';
import '../../../entity/last_win.dart';
import '../../../entity/notice.dart';


Future<void> requestBannerData(RxList<BannerEntity> bannerList) async {
  /// 请求banner列表
  try {
    var bannerJson = await apiRequest.requestBanner();
    bannerList.value = BannerEntity.getList(bannerJson);
    Log.d("bannerArr 的长度：${bannerList.length}");
  }  catch (e) {
    Log.e("$e");
  }
}

Future<void> requestMemberNav(List<GameNavEntity> navItemList, RxList<GameTypeEntity> gameTypes) async {
  try {
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
  } catch (e) {
    Log.e("$e");
  }
}

Future<void> requestCsData(Rx<CsEntity?> csEntity) async {
  var dictRet = {};
  try {
    dictRet = await apiRequest.requestMemberCsList(params: {"fields": 'telegram,facebook,onlinecs'});
    csEntity.value = CsEntity.fromJson(dictRet);
  } catch (e) {
    Log.e("$dictRet  $e");
  }
}

Future<void> requestLastWin(RxList<LastWinEntity> lastWinListRx) async {
  try {
    var ret = await apiRequest.requestLastWin();
    var listJson = ret['d'];
    var list = LastWinEntity.getList(listJson);
    lastWinListRx.value = list;
    Log.d("请求最近获奖结果size：${list.length}");
  } catch (e) {
    Log.e("$e");
  }
}

Future<void> requestNotice(RxList<NoticeEntity> noticeListRx, RxString showingMarqueeText) async {
  try {
    var json = await apiRequest.requestNotice();
    var noticeList = NoticeEntity.getList(json);
    noticeListRx.value = noticeList;
    if (noticeList.isNotEmpty) {
        String temp = '';
        for (var item in noticeList) {
          temp += '${item.content}   ';
        }
        showingMarqueeText.value = temp.trim();
        Log.d("=======通知返回 size：${noticeList.length} ");
      }
  } catch (e) {
    Log.e("$e");
  }
}
