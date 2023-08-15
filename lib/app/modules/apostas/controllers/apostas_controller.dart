import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApostasController extends GetxController  with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  final gtTabs = [
    {'label': 'Todas', 'value': '0'},
    {'label': 'ganho', 'value': '1'}
  ];

  final tyTabs = [
    {'label': 'Todos', 'value': ''},
    {'label': 'Quente', 'value': '1'},
    {'label': 'Dentro De Casa', 'value': '2'},
    {'label': 'Slot', 'value': '3'},
    {'label': 'Pesca', 'value': '4'},
    {'label': 'Pôquer', 'value': '5'},
    {'label': 'Esporte', 'value': '6'},
  ];

  final flagTabs = [
    {'label': 'Hoje', 'value': '1'},
    {'label': 'Últimos 7 dias', 'value': '7'},
    {'label': 'Últimos 60 dias', 'value': '60'}
  ];


  final ty = ''.obs; //1 真人 2 捕鱼 3 电子 4 体育 5 棋牌 6 电竞
  final flag = '1'.obs; // 1 今天 7 七天 60 六十天
  final gt = '0'.obs; // 0 全部 1 赢

  final isShowHeader = true.obs;

  setShowHeader(bool v) {
    isShowHeader.value = v;
  }

  setGt(String v) {
    gt.value = v;
  }

  setFlag(String v) {
    flag.value = v;
  }

  setTy(String v) {
    ty.value = v;
  }

  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);
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
