import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  final withdrawSelectData = <Map<String, String>>[
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