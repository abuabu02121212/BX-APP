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
  final list = MeberRecordData().obs;
  final flag = '271'.obs;
  int page = 1;
  int page_size = 10;

  setFlag(String value) {
    flag.value = value;
  }

  fetchData() async {
    try {
      AppLoading.show();
      final d = await apiRequest.requestMemberRecord(params: {
        "flag": flag.value,
        "page": page,
        "page_size": page_size,
      });
      list.value = MeberRecordData.fromJson(d);
    } catch (e) {
      print('member record error: $e');
    } finally {
      AppLoading.close();
    }
  }

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
    // fetchData();
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
