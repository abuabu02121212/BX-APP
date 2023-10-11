import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../widget/horizontal_indicator_tab.dart';
import '../../../../widget/input_field.dart';
import '../../../../widget/vetival_tab_group.dart';

class GameListController extends GetxController {

  final EditNode editNode = EditNode();
  IndicatorTabController horizontalTabController = IndicatorTabController();
  VerticalTabController verticalTabController = VerticalTabController();
  int gameTypeSize = 13;
  final pageSize = 10.obs;
  int curSelectPageIndex = 0; // 从0开始
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    /// 第一帧绘制完成后的回调
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(milliseconds: 100), () {
        verticalTabController.onItemSelectChanged(10);
      });
    });

  }

  @override
  void onClose() {
    super.onClose();
  }


}
