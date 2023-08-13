import 'package:flutter/material.dart';
import 'package:flutter_comm/app/entity/deposit_config_data.dart';
import 'package:flutter_comm/app/entity/pay_deposit_data.dart';
import 'package:flutter_comm/app/routes/app_pages.dart';
import 'package:flutter_comm/util/Log.dart';
import 'package:flutter_comm/util/loading_util.dart';
import 'package:flutter_comm/util/toast_util.dart';
import 'package:get/get.dart';

import '../../../../http/request.dart';
import '../../../../widget/input_field.dart';
import '../views/deposit_data.dart';

class DepositControllerPage extends GetxController {
  //TODO: Implement DepositController
  EditNode amountNode = EditNode();
  final amountIndex = 0.obs;
  late DepositData pageData = DepositData();
  final payRate = 0.0.obs;

  final depositData = <Map<String, String>>[
    {'amount': '50', 'discount': '1'},
    {'amount': '80', 'discount': '2'},
    {'amount': '100', 'discount': '3'}
  ].obs;
  final depositSelectData = <Map<String, String>>[
    {'label': 'A', 'value': '1'},
    {'label': 'B', 'value': '2'}
  ].obs;


  final depositSelectValue = '1'.obs;
  final depositSelectLabel = 'A'.obs;
  final depositDiscount = '0'.obs;
  final isFetching = true.obs;
  final fmin = '0'.obs;
  final fmax = '0'.obs;
  final isClickSubmit = false.obs;

  final configList = <DepositConfigData>[].obs;

  final depositAtividadeValue = '1'.obs;
  setAtividadeValue(String value) {
    depositAtividadeValue.value = value;
  }

  setDepositSelectLabelValue(String value, String label) {
    // 从 pageData.d，找出 fid == value的数据，获取对象的pay_rate值
    final ra = pageData.d?.firstWhere((element) => element.fid == value);
    if (ra?.ty == 2) {
      payRate.value = ra?.payRate ?? 0.0;
    } else {
      payRate.value = 0.0;
    }
    depositSelectValue.value = value;
    depositSelectLabel.value = label;
    setDepositData();
    // 改变数据
    // initChannelData();
  }

  bool isAmountInDepositData() {
    return depositData
        .any((element) => element['amount'] == amountNode.text.value);
  }

  setInputValue(String value, String discount) {
    amountNode.editController.text = value;
    amountNode.editController.selection =
        TextSelection.fromPosition(TextPosition(offset: value.length));
    getDepositDiscountValue();
  }

  getDepositDiscountValue() {
    final currentInputValue = amountNode.text.value;
    double a = 0.00;
    if (currentInputValue.isEmpty) {
      return a;
    }
    for (var i = 0; i < configList.length; i++) {
      final item = configList[i];
      if (double.parse(currentInputValue) >= item.minAmount! &&
          double.parse(currentInputValue) <= item.maxAmount!) {
        a = (double.parse(currentInputValue) * item.bonus! / 100);
      }
    }
    return a;
  }

  bool isSelectAmount(String amount) {
    return amount == amountNode.text.value;
  }

  initChannelData() async {
    final d = await apiRequest.requestPayChannel();
    if (d != null) {
      final data = DepositData.fromJson(d);
      pageData = data;
      // 设置下拉选项
      depositSelectData.value = pageData.d!
          .map((e) => {'label': e.showName ?? '', 'value': e.fid ?? ''})
          .toList();
      setDepositSelectLabelValue(
          depositSelectData[0]['value']!, depositSelectData[0]['label']!);
    }
    isFetching.value = false;
  }

  setDepositData() {
    // 设置快捷金额列表，从d中查找fid==当前选中的fid，如果找到了，就设置amount_array给depositData
    final currentData =
        pageData.d!.firstWhere((e) => e.fid == depositSelectValue.value);
    final kList = currentData.amountArray ?? [];
    fmin.value = (currentData.fmin ?? '0').toString();
    fmax.value = (currentData.fmax ?? '0').toString();
    depositData.value = kList
        .map((e) => {'amount': e.amount ?? '', 'discount': e.discount ?? ''})
        .toList();
  }

  String getDepositInputPlaceholder() {
    return '(${fmin.value}-${fmax.value})';
  }

  String? validateAmount() {
    if (amountNode.text.value.isEmpty) {
      return 'Por favor, insira o valor';
    }
    if (double.parse(amountNode.text.value) < double.parse(fmin.value) ||
        double.parse(amountNode.text.value) > double.parse(fmax.value)) {
      return 'Insira um valor que atenda ao intervalo';
    }
    return null;
  }

  getDepositConfig() async {
    try {
      final d = await apiRequest.requestPromoDepositConfig();
      if (d != null && d is List) {
        for (int i = 0; i < d.length; i++) {
          DepositConfigData data = DepositConfigData.fromJson(d[i]);
          configList.add(data);
        }
      }
    } catch (e) {
      print('eeeeee $e');
    }
  }

  /// 是否是首存
  bool isFristDeposit() {
    return configList[0].ty == 1;
  }

  /// 获取渲染的优惠列表
  List getDepositAtividade() {
    String bonus = (configList[0].bonus ?? '0').toString();
    if (isFristDeposit()) {
      return [
        {'label': '$bonus% primeiro depósito', 'value': '1'},
        {'label': 'não participe de atividades', 'value': '2'},
      ];
    } else {
      // 保存第一项和最后一项
      return [
        {'label': '$bonus% de novo depósito', 'value': '1'},
        {'label': 'não participe de atividades', 'value': '2'},
      ];
    }
  }

  void submit() async {
    isClickSubmit.value = true;
    if (validateAmount() == null) {
      AppLoading.show();
      // 验证成功
      final d = await apiRequest.requestPayDeposit({
        'fid': depositSelectValue.value,
        'amount': amountNode.text.value,
        'flag': depositAtividadeValue.value,
      });
      final result = PayDepositData.fromJson(d);
      AppLoading.close();
      Get.offNamed(Routes.WEBVIEW, arguments: {
        'url': result.addr,
        'title': 'recarrega',
      });
      amountNode.editController.text = '';
    }
  }

  @override
  void onInit() {
    super.onInit();
    initChannelData();
    getDepositConfig();
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
