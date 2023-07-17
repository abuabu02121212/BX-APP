import 'package:get/get.dart';

class RecompensasController extends GetxController {

  final tyTabs = [
    {'label': 'Todos', 'value': ''},
    {'label': 'depositar', 'value': '6'},
    {'label': 'entrar', 'value': '305'},
    {'label': 'sokoban', 'value': '307'},
  ];

  final flagTabs = [
    {'label': 'Hoje', 'value': '1'},
    {'label': 'Últimos 7 dias', 'value': '7'},
    {'label': 'Últimos 60 dias', 'value': '60'}
  ];


  final ty = ''.obs; // 6存款优惠 305邀请奖励 307宝箱奖励
  final flag = '1'.obs; // 1 今天 7 七天 60 六十天

  setFlag(String v) {
    flag.value = v;
  }

  setTy(String v) {
    ty.value = v;
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
