import 'package:flutter/material.dart';
import 'package:flutter_comm/http/request.dart';
import 'package:flutter_comm/util/loading_util.dart';
import 'package:get/get.dart';

import '../../../../util/toast_util.dart';
import '../../../../widget/input_field.dart';
import '../views/withdraw_data.dart';

class WithdrawControllerPage extends GetxController {

  WithdrawData pageData = WithdrawData();
  // 最小金额
  EditNode minAmountNode = EditNode();
  // 用户名
  EditNode usernameNode = EditNode();
  // pix id
  EditNode idNode = EditNode();
  // pid account
  EditNode accountNode = EditNode();

  final isFetching = true.obs;

  final ways = [
    { 'label': 'CPF', 'value': '1' },
    { 'label': 'E-mail', 'value': '2' },
    { 'label': 'Telefone(+55)', 'value': '3' },
  ];
  final waysSelectLabel = 'CPF'.obs;
  final waysSelectValue = '1'.obs;

  final withdrawSelectData =[
    {
      'label': 'A',
      'value': '1'
    }, {
      'label': 'B',
      'value': '2'
    }
  ].obs;

  initChannelData() async {
    final d = await apiRequest.requestWithdrawConfig();
    if (d != null) {
      pageData = WithdrawData.fromJson(d);
      setWithdrawSelectData();
    }
    isFetching.value = false;
  }

  setWithdrawSelectData() {
    final d = (pageData.memberBankList ?? []).map((e) {
      return {
        'label': e.pixId.toString() ?? '',
        'value': e.pixId.toString() ?? ''
      };
    }).toList();
    withdrawSelectData.value = d;
  }

  setWaysData(String label, String value) {
    waysSelectLabel.value = label;
    waysSelectValue.value = value;
  }

  final isClickSubmit = false.obs;
  // 验证最小金额
  String? validateMinAmount() {
    if (minAmountNode.text.value.isEmpty) {
      return '请输入最小金额';
    } else if (double.parse(minAmountNode.text.value) < double.parse(pageData.config?.fmin ?? '0') || double.parse(minAmountNode.text.value) > double.parse(pageData.config?.fmax ?? '0')) {
      return 'Valor da retirada (${pageData.config?.fmin ?? '0'} - ${pageData.config?.fmax ?? '0'})';
    }
    return null;
  }

  // 验证用户名
  String? validateUsername() {
    if (usernameNode.text.value.isEmpty) {
      return 'Insira o nome do titular do cartão';
    }
    return null;
  }

  // 验证pix id
  String? validateId() {
    if (idNode.text.value.isEmpty) {
      return 'Informe o CPF no formato correto';
    }
    return null;
  }

  // 验证pix account
  String? validateAccount() {
    if (accountNode.text.value.isEmpty) {
      return 'Informe o CPF no formato correto';
    }
    return null;
  }

  // 提交函数
  void submit() {
    isClickSubmit.value = true;

    if (validateMinAmount() != null || validateUsername() != null || validateId() != null || validateAccount() != null) {
      return;
    }

    AppLoading.show();
    apiRequest.requestPayWithdraw({
      'amount': minAmountNode.text.value,
      'real_name': usernameNode.text.value,
      'pix_id': idNode.text.value,
      'pix_account': accountNode.text.value,
      'flag': waysSelectValue.value,
    }).then((d) {

    }).catchError((e) {
    }).whenComplete(() {
      AppLoading.close();
    });
  }

  @override
  void onInit() {
    super.onInit();
    initChannelData();
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