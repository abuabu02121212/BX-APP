import 'package:flutter_comm/widget/input_field.dart';
import 'package:get/get.dart';

class CenterBankListAddController extends GetxController {
  EditNode bankInputNode = EditNode();

  List<Map<String, String>> bankList = [
    {
      "label": '建设',
      "value": '1'
    },
    {
      "label": '工商',
      "value": '2'
    }
  ];
  final selectValue = '1';

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
