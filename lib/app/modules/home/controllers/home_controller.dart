import 'package:get/get.dart';

import '../../../../util/Log.dart';

class HomeController extends GetxController {
  List<String> gameTypes = ["Quente", "Dentro \nDe Casa", "Slot", "Pesca", "Pôquer", "Esporte", "Ao Vivo", "Esports"];

  final selectedGameTypeIndex = (-1).obs;
  List<int> gameTypePressedRecordList = [-1];

  void addPressedRecord(int index) {
    gameTypePressedRecordList.add(index);
    Log.d("========addPressedRecord：$gameTypePressedRecordList");
  }

  bool consumePressedRecord() {
    Log.d("========consumePressedRecord：$gameTypePressedRecordList");
    if (gameTypePressedRecordList.isNotEmpty) {
      var removeLast = gameTypePressedRecordList.removeLast();
      if (removeLast == selectedGameTypeIndex.value) {
        removeLast = gameTypePressedRecordList.removeLast();
      }
      selectedGameTypeIndex.value = removeLast;
      return true;
    }
    return false;
  }

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
