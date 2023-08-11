import 'package:flutter_comm/app/routes/app_pages.dart';
import 'package:flutter_comm/http/comm_request.dart';
import 'package:flutter_comm/util/dialog.dart';
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
        Toast.show('Por favor, digite a senha original');
        return;
      } else if (isSixNumber(psw1EditNode.text.value) == false) {
        Toast.show('formato incorreto');
        return;
      };
    }

    if (psw2EditNode.text.isEmpty) {
      Toast.show('Insira uma nova senha');
      return;
    } else if (isSixNumber(psw2EditNode.text.value) == false) {
      Toast.show('formato incorreto');
      return;
    };

    if (psw3EditNode.text.isEmpty) {
      Toast.show('Digite a nova senha novamente');
      return;
    }

    if (psw2EditNode.text != psw3EditNode.text) {
      Toast.show('As duas senhas não combinam');
      return;
    }
    
    Get.toNamed(Routes.CENTER_PAY_PASSWORD_SMS, arguments: {
      'password': psw2EditNode.text.value,
      'oldPassword': psw1EditNode.text.value.isEmpty ? null : psw1EditNode.text.value,
    })?.then((value) async {
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
