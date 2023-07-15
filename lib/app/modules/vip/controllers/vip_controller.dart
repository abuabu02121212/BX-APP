import 'package:flutter_comm/http/request.dart';
import 'package:get/get.dart';

import '../../../../util/Log.dart';
import '../../../entity/vip_level_info.dart';

class VipController extends GetxController {
  //TODO: Implement VipController

  final count = 0.obs;
  @override
  void onInit() {
    Log.d("=======VipController=======onInit==============");
    super.onInit();
  }
 final dataList = RxList<VipInfoEntity>();

  @override
  Future<void> onReady() async {
    super.onReady();
    dynamic requestVips = await apiRequest.requestVips();
    List<VipInfoEntity> list = [];
    for (var element in requestVips) {
      var item = VipInfoEntity.fromJson(element);
      list.add(item);
    }
    dataList.value = list;
    Log.d("vip requestVips:$requestVips size:${dataList.length}");
  }

  @override
  void onClose() {
    super.onClose();
    Log.d("=======VipController=======onClose==============");
  }

  void increment() => count.value++;
}
