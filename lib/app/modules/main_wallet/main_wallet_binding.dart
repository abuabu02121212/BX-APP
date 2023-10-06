import 'package:get/get.dart';

import 'main_wallet_logic.dart';

class Main_walletBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Main_walletLogic());
  }
}
