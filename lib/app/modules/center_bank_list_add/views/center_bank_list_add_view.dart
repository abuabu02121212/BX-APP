import 'package:flutter/material.dart';
import 'package:flutter_comm/app/component/app_button.dart';
import 'package:flutter_comm/app/component/app_cupertino_button.dart';
import 'package:flutter_comm/widget/input_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../../util/bottom_sheet_util.dart';
import '../../../app_style.dart';
import '../../../component/app_header.dart';
import '../../../component/app_select.dart';
import '../controllers/center_bank_list_add_controller.dart';

class CenterBankListAddView extends GetView<CenterBankListAddController> {
  const CenterBankListAddView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 10, 29, 1),
      appBar: AppBar(
        titleSpacing: 0,
        leadingWidth: 0,
        elevation: 1.0,
        backgroundColor: headerBgColor,
        title: const AppHeader(
          title: "Número da conta bancária",
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            Container(
              height: 94.w,
              alignment: Alignment.centerLeft,
              child: Text(
                'Nome completo: 0*****1 ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28.w,
                ),
              ),
            ),
            Obx(() {
              return AppCupertinoButton(
                child: Container(
                  height: 72.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.w),
                    border: Border.all(
                      color: const Color.fromRGBO(255, 255, 255, 0.10),
                      width: 1.w,
                    ),
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromRGBO(1, 26, 81, 1),
                        Color.fromRGBO(1, 26, 81, 1),
                      ],
                    ),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        controller.bankTypeLabel.value.isEmpty
                            ? '＊ Escolha um banco'
                            : controller.bankTypeLabel.value,
                        style: TextStyle(
                          color: Colors.white
                              .withOpacity(controller.bankTypeLabel.value.isEmpty ? 0.4 : 1),
                          fontSize: 28.w,
                        ),
                      ),
                      Image.asset(
                        'assets/images/input-down.webp',
                        width: 24.w,
                        height: 24.w,
                      ),
                    ],
                  ),
                ),
                onPressed: () {
                  print(
                      'selectValue.value ${controller.bankTypeList} ${controller.bankTypeValue.value}');
                  BottomSheetUtil.showBottomSheet(
                    context,
                    data: controller.bankTypeList,
                    selectData: controller.bankTypeLabel.value,
                    ok: (String value, String label) {
                      controller.setBankTypeValue(label, value);
                    },
                  );
                },
              );
            }),
            SizedBox(height: 34.w),
            Container(
              height: 72.w,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.w),
                border: Border.all(
                  color: const Color.fromRGBO(255, 255, 255, 0.10),
                  width: 1.w,
                ),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(1, 26, 81, 1),
                    Color.fromRGBO(1, 26, 81, 1),
                  ],
                ),
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/i-add-bank.webp',
                    width: 38.w,
                    height: 38.w,
                  ),
                  Expanded(
                    child: MyInputFiled(
                      bgColor: Colors.transparent,
                      width: double.infinity,
                      height: 72.w,
                      hint: 'Por favor, preencha o número da conta bancária',
                      editNode: controller.bankInputNode,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 34.w),
            Container(
              height: 72.w,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.w),
                border: Border.all(
                  color: const Color.fromRGBO(255, 255, 255, 0.10),
                  width: 1.w,
                ),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(1, 26, 81, 1),
                    Color.fromRGBO(1, 26, 81, 1),
                  ],
                ),
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/i-add-password.webp',
                    width: 38.w,
                    height: 38.w,
                  ),
                  Expanded(
                    child: MyInputFiled(
                      bgColor: Colors.transparent,
                      width: double.infinity,
                      height: 72.w,
                      hint: 'Escolha um banco',
                      editNode: controller.payPasswordInputNode,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 34.w),
            AppButton(
              width: 580.w,
              height: 90.w,
              text: 'Enviar',
              onClick: () {
                controller.submit();
              },
              radius: 100.w,
            )
          ],
        ),
      ),
    );
  }
}
