import 'package:get/get.dart';

import '../../../generated/l10n.dart';
import 'main_wallet_state.dart';

class Main_walletLogic extends GetxController {
  final Main_walletState state = Main_walletState();

  var indexs = 0.obs;

  final List<String> imgListY = [
    '4',
    '2',
    '1',
    '3',
    '5',
    '6',
  ];
  final List<String> nameList = [
    S.current.cards,
    S.current.finishing,
    S.current.slot,
    S.current.live,
    S.current.support,
    S.current.cockFighting,
  ];

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
