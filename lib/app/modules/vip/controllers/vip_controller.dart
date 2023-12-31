import 'package:flutter/cupertino.dart';
import 'package:flutter_comm/http/request.dart';
import 'package:get/get.dart';

import '../../../../globe_controller.dart';
import '../../../../util/Log.dart';
import '../../../../util/math_util.dart';
import '../../../entity/user_info.dart';
import '../../../entity/vip_level_info.dart';

class VipController extends GetxController {
  final nextLevelDeposit = "?".obs;

  final nextLevelFlow = "?".obs;
  final curCardLevelProgress = 0.obs;
  final PageController pageController = PageController(initialPage: 0, viewportFraction: 0.93);

  @override
  void onInit() {
    Log.d("=======VipController=======onInit==============");
    super.onInit();
  }

  final dataList = RxList<VipInfoEntity>();
  final selectedCardIndex = 0.obs;

  void onLevelCardSelectChanged(int selectedIndex) {
    selectedCardIndex.value = selectedIndex;
    if (selectedIndex < dataList.length - 1) {
      int nextLevelIndex = selectedIndex + 1;
      var nextLevelEntity = dataList[nextLevelIndex];
      nextLevelDeposit.value = "${nextLevelEntity.depositAmount}";
      nextLevelFlow.value = "${nextLevelEntity.flow}";

      final GlobeController globeController = Get.find<GlobeController>();
      UserInfoEntity? entity = globeController.userInfoEntity.value;
      var nowDeposit = entity?.nowDeposit;
      var nowValidAmount = entity?.nowValidAmount;
      int depositProgress = MathU.computePercent(nowDeposit, nextLevelDeposit.value);
      int flowProgress = MathU.computePercent(nowValidAmount, nextLevelFlow.value);
      curCardLevelProgress.value = (depositProgress + flowProgress) ~/ 2;
    } else if (selectedIndex == dataList.length - 1) {
      nextLevelDeposit.value = "-1";
      nextLevelFlow.value = "-1";
    }
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    await requestVip();
  }

  Future<void> requestVip() async {
    try {
      dynamic requestVips = await apiRequest.requestVips();
      List<VipInfoEntity> list = [];
      for (var element in requestVips) {
        var item = VipInfoEntity.fromJson(element);
        list.add(item);
      }
      dataList.value = list;
      final GlobeController globeController = Get.find<GlobeController>();
      UserInfoEntity? entity = globeController.userInfoEntity.value;
      int curLevel = int.tryParse("${entity?.vip}") ?? 0;
      if (dataList.isNotEmpty) {
        var startIndex = int.tryParse("${dataList[0].vip}") ?? 0;
        int curLevelIndex = curLevel - startIndex;
        pageController.jumpToPage(curLevelIndex);
        onLevelCardSelectChanged(curLevelIndex);
      }
    } catch (e) {
      Log.e(e);
    }
    Log.d("vip requestVips size:${dataList.length}");
  }

  @override
  void onClose() {
    super.onClose();
    Log.d("=======VipController=======onClose==============");
  }
}
