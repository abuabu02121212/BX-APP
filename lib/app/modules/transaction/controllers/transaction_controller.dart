import 'package:flutter/material.dart';
import 'package:flutter_comm/app/entity/member_record_data.dart';
import 'package:flutter_comm/http/request.dart';
import 'package:flutter_comm/util/loading_util.dart';
import 'package:get/get.dart';

class TransactionController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  List<Map<String, dynamic>> tabs = [
    {'label': 'Depósito', 'value': '271'},
    {'label': 'Retirar', 'value': '272'}
  ];
  final flag = '271'.obs;

  setFlag(String value) {
    flag.value = value;
  }

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    tabController.dispose();
  }
}
