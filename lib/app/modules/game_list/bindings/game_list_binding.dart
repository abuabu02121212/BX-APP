import 'package:get/get.dart';

import '../controllers/game_list_controller.dart';

class GameListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GameListController>(
      () => GameListController(),
    );
  }
}
