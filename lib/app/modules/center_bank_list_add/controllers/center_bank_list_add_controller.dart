import 'package:flutter_comm/app/entity/bank_type_list.dart';
import 'package:flutter_comm/app/routes/app_pages.dart';
import 'package:flutter_comm/http/request.dart';
import 'package:flutter_comm/util/loading_util.dart';
import 'package:flutter_comm/util/toast_util.dart';
import 'package:flutter_comm/widget/input_field.dart';
import 'package:get/get.dart';

class CenterBankListAddController extends GetxController {
  EditNode bankInputNode = EditNode();
  EditNode payPasswordInputNode = EditNode();

  List<Map<String, String>> bankTypeList = [];
  final bankTypeValue = ''.obs;
  final bankTypeLabel = ''.obs;

  void setBankTypeList() async {
    print('执行了');
    try {
      final data = await apiRequest.requestBankTypeList();
      final d = data['d'];
      if (d != null) {
        for (var i = 0; i < d.length; i++) {
          bankTypeList.add({
            "label": d[i]['bankname'].toString(),
            "value": d[i]['bankcode'].toString(),
          });
        }
        print('bankTypeList[1] ${bankTypeList[1]['value']! == 'BCEF'}');
        setBankTypeValue('', bankTypeList[1]['value']!);
      }
    } catch (e) {
      print(e);
    }
  }

  setBankTypeValue(String label, String value) {
    bankTypeLabel.value = label;
    bankTypeValue.value = value;
  }

  void submit() async {
    if (bankTypeLabel.value.isEmpty) {
      Toast.show('请选择银行类型');
      return;
    }

    if (bankInputNode.text.isEmpty) {
      Toast.show('请输入银行卡号');
      return;
    }

    if (payPasswordInputNode.text.isEmpty) {
      Toast.show('请输入支付密码');
      return;
    }

    AppLoading.show();
    try {
      final data = await apiRequest.requestBankCardInsert(params: {
        'pix_id': bankInputNode.text.value,
        'bankcode': bankTypeValue.value,
        'pay_password': payPasswordInputNode.text.value,
      });
      Toast.show('设置成功');
      Get.back();
    } catch (e) {
      if (e is Exception) {
        String eS = e.toString();
        if (eS.contains('1249')) {
          // 两秒后跳转设置支付密码页面
          Future.delayed(const Duration(seconds: 2), () {
            Get.toNamed(Routes.CENTER_PAY_PASSWORD);
          });
        }
      }
    } finally {
      AppLoading.close();
    }
  }

  @override
  void onInit() {
    setBankTypeList();
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
