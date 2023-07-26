import 'package:flutter_comm/globe_controller.dart';
import 'package:flutter_comm/widget/input_field.dart';
import 'package:get/get.dart';

import '../../../entity/user_info.dart';

class CenterUserInfoController extends GetxController {

  EditNode emailEditNode = EditNode();
  EditNode usernameEditNode = EditNode();
  EditNode telegramEditNode = EditNode();

  @override
  void onInit() {
    super.onInit();
    GlobeController globeController = Get.find<GlobeController>();
    UserInfoEntity? userInfoEntity = globeController.userInfoEntity.value;
    if(userInfoEntity != null){
      emailEditNode.text.value = userInfoEntity.email ?? "";
      usernameEditNode.text.value = userInfoEntity.username ?? "";
      //telegramEditNode.text.value = userInfoEntity.username ?? "";

    }

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
