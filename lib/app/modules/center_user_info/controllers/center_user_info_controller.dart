import 'package:flutter_comm/globe_controller.dart';
import 'package:flutter_comm/http/request.dart';
import 'package:flutter_comm/util/loading_util.dart';
import 'package:flutter_comm/widget/input_field.dart';
import 'package:get/get.dart';

import '../../../../http/ret_code.dart';
import '../../../../util/Log.dart';
import '../../../entity/user_info.dart';

class CenterUserInfoController extends GetxController {
  EditNode emailEditNode = EditNode(regExp: emailExp);
  EditNode phoneEditNode = EditNode(regExp: phoneNumExp);
  EditNode telegramEditNode = EditNode(regExp: telegramUsernameRegExp);
  GlobeController globeController = Get.find<GlobeController>();
  late UserInfoEntity userInfoEntity = globeController.userInfoEntity.value!;

  @override
  void onInit() {
    super.onInit();
    emailEditNode.text.value = userInfoEntity.email ?? "";
    phoneEditNode.text.value = userInfoEntity.phone ?? "";
    telegramEditNode.text.value = userInfoEntity.telegram ?? "";
  }

  bool check() {
    return emailEditNode.checkInput() && phoneEditNode.checkInput() && telegramEditNode.checkInput();
  }

  Future<void> requestMemberUpdateInfo() async {
    if (!check()) return;
    var param = <String, Object>{};
    if (userInfoEntity.phone!.isEmpty) {
      param['phone'] = phoneEditNode.text.value;
    }
    if (userInfoEntity.email!.isEmpty) {
      param['email'] = emailEditNode.text.value;
    }
    if (userInfoEntity.telegram!.isEmpty) {
      param['telegram'] = telegramEditNode.text.value;
    }
    try {
      AppLoading.show();
      var ret = await apiRequest.requestMemberUpdateInfo(params: param);
      if (ret == retCodeSuccess) {
        Get.back();
      }
    } catch (e) {
      Log.e(e);
    }
    AppLoading.close();
  }
}
