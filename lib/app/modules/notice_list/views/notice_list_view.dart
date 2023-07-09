import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/notice_list_controller.dart';

class NoticeListView extends GetView<NoticeListController> {
  const NoticeListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NoticeListView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'NoticeListView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
