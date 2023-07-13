import 'package:get/get.dart';

class HomeController extends GetxController {
  List<String> gameTypes = ["Quente", "Dentro \nDe Casa", "Slot", "Pesca", "Pôquer", "Esporte", "Ao Vivo", "Esports"];

  final selectedGameTypeIndex = (-1).obs;

  final count = 0.obs;

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
