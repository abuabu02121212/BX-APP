import 'package:flutter_comm/http/request.dart';
import 'package:get/get.dart';

import '../../../../util/Log.dart';

class VipController extends GetxController {
  //TODO: Implement VipController

  final count = 0.obs;
  @override
  void onInit() {
    Log.d("=======VipController=======onInit==============");
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    var requestVips = await apiRequest.requestVips();
    Log.d("vip requestVips:$requestVips");
  }

  @override
  void onClose() {
    super.onClose();
    Log.d("=======VipController=======onClose==============");
  }

  void increment() => count.value++;
}
