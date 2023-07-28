import 'package:flutter_comm/app/routes/app_pages.dart';
import 'package:flutter_comm/util/toast_util.dart';
import 'package:flutter_comm/widget/input_field.dart';
import 'package:get/get.dart';

import '../../../../globe_controller.dart';

class CenterPayPasswordController extends GetxController {

  EditNode psw1EditNode = EditNode();
  EditNode psw2EditNode = EditNode();
  EditNode psw3EditNode = EditNode();
  final globalController = Get.find<GlobeController>();

  bool getPayPasswordStatus() {
    return (globalController.userInfoEntity.value?.payPassword ?? "0") != "0";
  }

  /// 验证是不是六位数字
  bool isSixNumber(String str) {
    return RegExp(r'^\d{6}$').hasMatch(str);
  }

  void submit() {
    // 为false，只需要验证两次密码是否一致
    if (getPayPasswordStatus() == true) {
      if (psw1EditNode.text.isEmpty) {
        Toast.show('请输入原密码');
        return;
      } else if (isSixNumber(psw1EditNode.text.value) == false) {
        Toast.show('原密码格式不正确');
        return;
      };
    }

    if (psw2EditNode.text.isEmpty) {
      Toast.show('请输入新密码');
      return;
    } else if (isSixNumber(psw2EditNode.text.value) == false) {
      Toast.show('新密码格式不正确');
      return;
    };

    if (psw3EditNode.text.isEmpty) {
      Toast.show('请再次输入新密码');
      return;
    }

    if (psw2EditNode.text != psw3EditNode.text) {
      Toast.show('两次密码不一致');
      return;
    }
    
    Get.toNamed(Routes.CENTER_PAY_PASSWORD_SMS, arguments: {
      'password': psw2EditNode.text.value,
      'oldPassword': psw1EditNode.text.value.isEmpty ? null : psw1EditNode.text.value,
    })?.then((value) {
      if (value == true) {
        Get.back();
      }
    });
  }

  @override
  void onInit() {
    super.onInit();
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
