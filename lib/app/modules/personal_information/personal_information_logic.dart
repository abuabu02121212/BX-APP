import 'package:get/get.dart';

import 'personal_information_state.dart';

class Personal_informationLogic extends GetxController {
  final Personal_informationState state = Personal_informationState();

  final List<String> imgList = [
    'assets/images/user/ic_personal.webp',
    'assets/images/user/ic_personal_information.webp',
    'assets/images/promotion/ic_whats_app.webp',
    'assets/images/user/ic_fcbook.webp',
    'assets/images/promotion/ic_telegram.webp',
    'assets/images/user/ic_personal_information.webp',
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
