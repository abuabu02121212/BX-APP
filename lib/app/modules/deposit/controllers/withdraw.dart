import 'package:flutter_comm/http/request.dart';
import 'package:flutter_comm/util/loading_util.dart';
import 'package:flutter_comm/util/toast_util.dart';
import 'package:get/get.dart';
import '../../../../globe_controller.dart';
import '../../../../widget/input_field.dart';
import '../../../entity/bank_list_data.dart';
import '../views/withdraw_data.dart';

class WithdrawControllerPage extends GetxController {
  final globalController = Get.find<GlobeController>();

  WithdrawData pageData = WithdrawData();

  // 最小金额
  EditNode minAmountNode = EditNode();

  // pay password
  EditNode payPasswordNode = EditNode();

  final isFetching = true.obs;

  final ways = [
    {'label': 'CPF', 'value': '1'},
    {'label': 'E-mail', 'value': '2'},
    {'label': 'Telefone(+55)', 'value': '3'},
  ];
  final waysSelectLabel = 'CPF'.obs;
  final waysSelectValue = '1'.obs;

  final payPasswordObscureText = true.obs;

  final withdrawSelectData = [
    {'label': 'A', 'value': '1'},
    {'label': 'B', 'value': '2'}
  ].obs;


  initChannelData() async {
    final d = await apiRequest.requestWithdrawConfig();
    if (d != null) {
      pageData = WithdrawData.fromJson(d);
      setWithdrawSelectData();
    }
    isFetching.value = false;
  }

  setWithdrawSelectData() {
    final d = (pageData.memberBankList ?? []).map((e) {
      return {'label': e.pixId.toString() ?? '', 'value': e.pixId.toString() ?? ''};
    }).toList();
    withdrawSelectData.value = d;
  }

  setWaysData(String label, String value) {
    waysSelectLabel.value = label;
    waysSelectValue.value = value;
  }

  final isClickSubmit = false.obs;

  // 验证最小金额
  String? validateMinAmount() {
    if (minAmountNode.text.value.isEmpty) {
      return 'Por favor, insira';
    } else if (double.parse(minAmountNode.text.value) <
            double.parse(pageData.config?.fmin ?? '0') ||
        double.parse(minAmountNode.text.value) > double.parse(pageData.config?.fmax ?? '0')) {
      return 'Valor da retirada (${pageData.config?.fmin ?? '0'} - ${pageData.config?.fmax ?? '0'})';
    }
    return null;
  }

  // 验证pay password
  String? validatePayPassword() {
    if (payPasswordNode.text.value.isEmpty) {
      return 'Digite a senha do fundo';
    }
    return null;
  }

  reset() {
    minAmountNode.text.value = '';
    payPasswordNode.text.value = '';
    minAmountNode.editController.clear();
    payPasswordNode.editController.clear();
    isClickSubmit.value = false;
  }

  final bankList = <BankListDataD>[].obs;
  final selectBankId = ''.obs;
  void getBankList() async {
    try {
      AppLoading.show();
      final data = await apiRequest.requestBankCardList();
      BankListData bankListData = BankListData.fromJson(data);
      if (bankListData.d != null) {
        bankList.value = bankListData.d!;
        setBankId(bankListData.d!.first.id.toString());
      }
    } catch (e) {
      print(e);
    } finally {
      AppLoading.close();
    }
  }

  setBankId(String id) {
    selectBankId.value = id;
  }

  // 提交函数
  void submit() async {
    isClickSubmit.value = true;

    if (validateMinAmount() != null ||
        validatePayPassword() != null) {
      return;
    }

    if (double.parse(globalController.balance.value?.brl_amount ?? '0') <
        double.parse(minAmountNode.text.value)) {
      Toast.show('O valor da retirada não pode ser maior que o valor da retirada da conta');
      return;
    }

    AppLoading.show();
    try {
      final s = await apiRequest.requestPayWithdraw({
        'amount': minAmountNode.text.value,
        'pay_password': payPasswordNode.text.value,
        'bank_id': selectBankId.value,
      });
      Toast.show('Retirada bem-sucedida');
      reset();
    } catch (e) {
      print('错了 ¥$e');
    } finally {
      print("结束");
      AppLoading.close();
    }
  }

  @override
  void onInit() {
    initChannelData();
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
