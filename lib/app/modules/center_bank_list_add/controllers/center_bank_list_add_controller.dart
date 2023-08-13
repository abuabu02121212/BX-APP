import 'package:flutter_comm/app/entity/bank_type_list.dart';
import 'package:flutter_comm/app/routes/app_pages.dart';
import 'package:flutter_comm/http/request.dart';
import 'package:flutter_comm/util/loading_util.dart';
import 'package:flutter_comm/util/toast_util.dart';
import 'package:flutter_comm/widget/input_field.dart';
import 'package:get/get.dart';

import '../../../../globe_controller.dart';
import '../../../../util/dialog.dart';

class CenterBankListAddController extends GetxController {
  EditNode pixIdNode = EditNode();
  EditNode payPasswordInputNode = EditNode();
  // 用户名
  EditNode usernameNode = EditNode();
  // pid account
  EditNode pixAccountNode = EditNode();


  List<Map<String, String>> bankTypeList = [];
  final bankTypeValue = ''.obs;
  final bankTypeLabel = ''.obs;

  // final withdrawSelectData = [
  //   {'label': 'A', 'value': '1'},
  //   {'label': 'B', 'value': '2'}
  // ].obs;

  final ways = [
    {'label': 'CPF', 'value': '1'},
    {'label': 'E-mail', 'value': '2'},
    {'label': 'Telefone(+55)', 'value': '3'},
  ];
  final waysSelectLabel = 'CPF'.obs;
  final waysSelectValue = '1'.obs;


  setWaysData(String label, String value) {
    waysSelectLabel.value = label;
    waysSelectValue.value = value;
  }

  void setBankTypeList() async {
    print('执行了');
    try {
      final data = await apiRequest.requestBankTypeList();
      final d = data['d'];
      if (d != null) {
        for (var i = 0; i < d.length; i++) {
          bankTypeList.add({
            "label": d[i]['bankname'].toString(),
            "value": d[i]['bankcode'].toString(),
          });
        }
        print('bankTypeList[1] ${bankTypeList[1]['value']! == 'BCEF'}');
        setBankTypeValue('', bankTypeList[1]['value']!);
      }
    } catch (e) {
      print(e);
    }
  }

  setBankTypeValue(String label, String value) {
    bankTypeLabel.value = label;
    bankTypeValue.value = value;
  }

  void submit() async {
    if (pixIdNode.text.trim().isEmpty) {
      Toast.show('Por favor, preencha o número da conta bancária');
      return;
    }

    if (usernameNode.text.trim().isEmpty) {
      Toast.show('Insira o nome do titular do cartão');
      return;
    }

    if (pixAccountNode.text.trim().isEmpty) {
      Toast.show('Digite o método de contato');
      return;
    }

    if (payPasswordInputNode.text.trim().isEmpty) {
      Toast.show('Senha (6 letras e números)');
      return;
    }

    AppLoading.show();
    try {
      final data = await apiRequest.requestBankCardInsert(params: {
        'pix_id': pixIdNode.text.value,
        'pay_password': payPasswordInputNode.text.value,
        'flag': waysSelectValue.value,
        'pix_account': pixAccountNode.text.value,
        'realname': usernameNode.text.value,
      });
      Toast.show('sucesso');
      Get.back();
    } catch (e) {
      if (e is Exception) {
        String eS = e.toString();
        if (eS.contains('1249')) {
          // 两秒后跳转设置支付密码页面
          Future.delayed(const Duration(seconds: 2), () {
            Get.toNamed(Routes.CENTER_PAY_PASSWORD);
          });
        }
      }
    } finally {
      AppLoading.close();
    }
  }

  final globalController = Get.find<GlobeController>();


  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    globalController.switchPayPasswordStatus();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
