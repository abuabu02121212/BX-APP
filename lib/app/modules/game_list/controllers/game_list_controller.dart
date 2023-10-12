import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../util/Log.dart';
import '../../../../widget/horizontal_indicator_tab.dart';
import '../../../../widget/input_field.dart';
import '../../../../widget/vetival_tab_group.dart';

class GameListController extends GetxController {
  final EditNode editNode = EditNode();
  IndicatorTabController horizontalTabController = IndicatorTabController();
  VerticalTabController verticalTabController = VerticalTabController();
  int gameTypeSize = 13;
  final pageSize = 10.obs;
  final curSelectPageIndex = 6.obs; // 从1开始
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

  void jumPrePage() {
    curSelectPageIndex.value = curSelectPageIndex.value - 1;
  }

  void jumNextPage() {
    curSelectPageIndex.value = curSelectPageIndex.value + 1;
    Log.d("curSelectPageIndex:${curSelectPageIndex.value}");
  }

  /// 页码从1开始
  List<int> getShowPageNumList(int curPageIndex, int maxPageIndex) {
    if (maxPageIndex == 1) {
      return [1];
    }
    List<int> arr = [
      curPageIndex - 2,
      curPageIndex - 1,
      curPageIndex,
      curPageIndex + 1,
      curPageIndex + 2,
    ];
    arr.removeWhere((el) => el < 1 || el > maxPageIndex);

    if (arr[0] > 1) {
      arr[0] = 1;
    }
    if (arr[1] - arr.first > 1) {
      arr.insert(1, -9);
    }
    if (arr.last < maxPageIndex) {
      arr[arr.length - 1] = maxPageIndex;
    }
    if (arr.last - arr[arr.length - 2] > 1) {
      arr.insert(arr.length - 1, -9);
    }
    return arr;
  }
}
