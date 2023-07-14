import 'package:flutter/material.dart';
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

  initChannelData() {
    pageData = WithdrawData.fromJson({
      "config": {
        "fid": "778889999",
        "name": "Withdraw",
        "fmax": "99999999.00",
        "fmin": "50.00",
        "amount_list": "50,80,100,200,300,500,800,1000,2000,3000,5000,8000,10000,20000,30000,50000,80000",
        "show_name": "Withdraw",
        "amount_array": null
      },
      "member_bank_list": [
        {
          "id": 34836175165270664,
          "uid": 14614382639834780,
          "username": "9966666666",
          "created_at": 1689223540,
          "state": 1,
          "pix_account": "213234432",
          "flag": 1,
          "real_name": "",
          "pix_id": 342523535
        }
      ],
      "member_bank_t": 1
    });
    setWithdrawSelectData();
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
    } else if (double.parse(minAmountNode.text.value) < double.parse(pageData.config?.fmin ?? '0')) {
      return '最小金额为${pageData.config?.fmin}';
    }
    return null;
  }

  // 验证用户名
  String? validateUsername() {
    if (usernameNode.text.value.isEmpty) {
      return '请输入用户名';
    }
    return null;
  }

  // 验证pix id
  String? validateId() {
    if (idNode.text.value.isEmpty) {
      return '请输入pix id';
    }
    return null;
  }

  // 验证pix account
  String? validateAccount() {
    if (accountNode.text.value.isEmpty) {
      return '请输入pix account';
    }
    return null;
  }

  // 提交函数
  void submit() {
    isClickSubmit.value = true;
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