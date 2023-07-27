import 'package:flutter_comm/http/request.dart';
import 'package:flutter_comm/util/loading_util.dart';
import 'package:get/get.dart';

import '../../../entity/bank_list_data.dart';

class CenterBankListController extends GetxController {
  final bankList = <BankListDataD>[].obs;

  void getBankList() async {
    try {
      AppLoading.show();
      final data = await apiRequest.requestBankCardList();
      BankListData bankListData = BankListData.fromJson(data);
      if (bankListData.d != null) {
        bankList.value = bankListData.d!;
      }
    } catch (e) {
      print(e);
    } finally {
      AppLoading.close();
    }
  }

  @override
  void onInit() {
    getBankList();
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
