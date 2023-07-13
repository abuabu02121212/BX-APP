import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../widget/input_field.dart';
import '../views/deposit_data.dart';

class DepositControllerPage extends GetxController {
  //TODO: Implement DepositController
  EditNode amountNode = EditNode();
  final amountIndex = 0.obs;
  late DepositData pageData = DepositData();

  final depositData = <Map<String, String>>[
    {
      'amount': '50',
      'discount': '1'
    }, {
      'amount': '80',
      'discount': '2'
    }, {
      'amount': '100',
      'discount': '3'
    }
  ].obs;
  final depositSelectData = <Map<String, String>>[
    {
      'label': 'A',
      'value': '1'
    },{
      'label': 'B',
      'value': '2'
    }
  ].obs;
  final depositSelectValue = '1'.obs;
  final depositSelectLabel = 'A'.obs;
  final depositDiscount = '0'.obs;

  setDepositSelectLabelValue(String value, String label) {
    depositSelectValue.value = value;
    depositSelectLabel.value = label;
    setDepositData();
    // 改变数据
    // initChannelData();
  }

  // 当前输入的amount金额是否在depositData中
  bool isAmountInDepositData() {
    return depositData.any((element) => element['amount'] == amountNode.text.value);
  }

  // value，输入框的值，discount，折扣
  setInputValue(String value, String discount) {
    amountNode.editController.text = value;
    amountNode.editController.selection = TextSelection.fromPosition(TextPosition(offset: value.length));
    depositDiscount.value = discount;
  }

  // 当前是否有选中的充值金额
  bool isSelectAmount(String amount) {
    return amount == amountNode.text.value;
  }

  initChannelData() {
    final data = DepositData.fromJson({
      "t": 2,
      "d": [
        {
          "fid": "666777888",
          "name": "EPAY",
          "fmax": "99999999.00",
          "fmin": "50.00",
          "amount_list": "50,80,100,200,300,500,800,1000,2000,3000,5000,8000,10000,20000,30000,50000,80000",
          "show_name": "EPAY1",
          "amount_array": [
            {
              "amount": "300",
              "discount": "60.00"
            },
            {
              "amount": "500",
              "discount": "100.00"
            },
            {
              "amount": "800",
              "discount": "160.00"
            },
            {
              "amount": "1000",
              "discount": "200.00"
            },
            {
              "amount": "2000",
              "discount": "400.00"
            },
            {
              "amount": "3000",
              "discount": "600.00"
            },
            {
              "amount": "5000",
              "discount": "1000.00"
            },
            {
              "amount": "8000",
              "discount": "1600.00"
            },
            {
              "amount": "10000",
              "discount": "2000.00"
            },
            {
              "amount": "20000",
              "discount": "4000.00"
            },
            {
              "amount": "30000",
              "discount": "6000.00"
            },
            {
              "amount": "50000",
              "discount": "10000.00"
            },
            {
              "amount": "80000",
              "discount": "16000.00"
            }
          ]
        },
        {
          "fid": "666777999",
          "name": "EPAYU",
          "fmax": "99999999.00",
          "fmin": "50.00",
          "amount_list": "50,80,100,200,300,500,800,1000,2000,3000,5000,8000,10000,20000,30000,50000,80000",
          "show_name": "EPAY-USDT",
          "amount_array": [
            {
              "amount": "50",
              "discount": "10.00"
            },
            {
              "amount": "80",
              "discount": "16.00"
            },
            {
              "amount": "100",
              "discount": "20.00"
            },
            {
              "amount": "200",
              "discount": "40.00"
            },
            {
              "amount": "300",
              "discount": "60.00"
            },
            {
              "amount": "500",
              "discount": "100.00"
            },
            {
              "amount": "800",
              "discount": "160.00"
            },
            {
              "amount": "1000",
              "discount": "200.00"
            },
            {
              "amount": "2000",
              "discount": "400.00"
            },
            {
              "amount": "3000",
              "discount": "600.00"
            },
            {
              "amount": "5000",
              "discount": "1000.00"
            },
            {
              "amount": "8000",
              "discount": "1600.00"
            },
            {
              "amount": "10000",
              "discount": "2000.00"
            },
            {
              "amount": "20000",
              "discount": "4000.00"
            },
            {
              "amount": "30000",
              "discount": "6000.00"
            },
            {
              "amount": "50000",
              "discount": "10000.00"
            },
            {
              "amount": "80000",
              "discount": "16000.00"
            }
          ]
        }
      ],
      "r": 0.2,
      "c": "Prezado usuário, quando o valor da primeira recarga for maior que 50 reais, você receberá no máximo 20% de recompensa de recarga, e quando o valor da recarga for maior que 50 reais, você receberá no máximo 10% de recompensa de recarga! 6 vezes ao dia, quanto maior o valor da recarga, maior a proporção de presentes!"
    });
    pageData = data;
    // 设置下拉选项
    depositSelectData.value = pageData.d!.map((e) => {'label': e.showName ?? '', 'value': e.fid ?? ''}).toList();
    setDepositSelectLabelValue(depositSelectData[0]['value']!, depositSelectData[0]['label']!);
  }

  // 设置 depositData
  setDepositData() {
    // 设置快捷金额列表，从d中查找fid==当前选中的fid，如果找到了，就设置amount_array给depositData
    final kList = pageData.d!.firstWhere((e) => e.fid == depositSelectValue.value).amountArray ?? [];
    depositData.value = kList.map((e) => {'amount': e.amount ?? '', 'discount': e.discount ?? ''}).toList();
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
    amountNode.dispose();
  }
}