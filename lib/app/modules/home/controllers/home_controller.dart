import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  final List<String> tabNames = ["推荐", "乱伦强奸", "国产精选", "原创传媒", "网黄模特", "异国骚情", "福利姬", "制服诱惑", "H次元"];

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

  void increment() => count.value++;
}
