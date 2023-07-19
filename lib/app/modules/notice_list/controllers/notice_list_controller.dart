import 'package:flutter/material.dart';
import 'package:flutter_comm/http/request.dart';
import 'package:get/get.dart';

import '../../../entity/message_list_data.dart';

class NoticeListController extends GetxController with SingleGetTickerProviderMixin {
  TabController? tabController;

  final is_read = 0.obs;

  void setIsRead(int value) {
    is_read.value = value;
  }

  /// 读取站内信
  void readNotice(String id) async {
    try {
      await apiRequest.requestMessageRead({
        'id': id
      });
    } catch (e) {
      print(e);
    }
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
  }
}
