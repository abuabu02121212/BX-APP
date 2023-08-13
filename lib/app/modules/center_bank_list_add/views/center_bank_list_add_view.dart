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
                      editNode: controller.pixIdNode,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 34.w),
            Container(
              width: double.infinity,
              height: 72.w,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 24.w, right: 20.w),
              decoration: BoxDecoration(
                border: Border.all(
                    color: const Color.fromRGBO(255, 255, 255, 0.1),
                    width: 1.w),
                image: const DecorationImage(
                  image: AssetImage("assets/images/btn-bg-gray.webp"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(8.w),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Nome do usuário:",
                      style: TextStyle(color: Colors.white, fontSize: 28.w)),
                  Expanded(
                    child: Stack(
                      children: [
                        Obx(() {
                          return Visibility(
                            visible: controller.usernameNode.text.isEmpty,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "Insira o nome do titular do cartão",
                                style: TextStyle(
                                  color:
                                      const Color.fromRGBO(255, 255, 255, 0.4),
                                  fontSize: 28.w,
                                ),
                              ),
                            ),
                          );
                        }),
                        MyInputFiled(
                          bgColor: Colors.transparent,
                          width: double.infinity,
                          textDirection: TextDirection.rtl,
                          height: 72.w,
                          hint: '',
                          editNode: controller.usernameNode,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Container(
            //   width: double.infinity,
            //   height: 72.w,
            //   alignment: Alignment.centerLeft,
            //   padding: EdgeInsets.only(left: 24.w),
            //   decoration: BoxDecoration(
            //     border: Border.all(
            //         color: const Color.fromRGBO(255, 255, 255, 0.1),
            //         width: 1.w),
            //     image: const DecorationImage(
            //       image: AssetImage("assets/images/btn-bg-gray.webp"),
            //       fit: BoxFit.cover,
            //     ),
            //     borderRadius: BorderRadius.circular(8.w),
            //   ),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Text(
            //         "Código CPF:",
            //         style: TextStyle(color: Colors.white, fontSize: 28.w),
            //       ),
            //       Expanded(
            //         child: Stack(
            //           children: [
            //             Obx(() {
            //               return Visibility(
            //                 visible: controller.idNode.text.isEmpty,
            //                 child: Align(
            //                   alignment: Alignment.centerRight,
            //                   child: Text(
            //                     "Insira o seu código CPF",
            //                     style: TextStyle(
            //                       color:
            //                           const Color.fromRGBO(255, 255, 255, 0.4),
            //                       fontSize: 28.w,
            //                     ),
            //                   ),
            //                 ),
            //               );
            //             }),
            //             MyInputFiled(
            //               bgColor: Colors.transparent,
            //               width: double.infinity,
            //               keyboardType: TextInputType.number,
            //               textDirection: TextDirection.rtl,
            //               height: 72.w,
            //               hint: '',
            //               editNode: controller.idNode,
            //             ),
            //           ],
            //         ),
            //       ),
            //       SizedBox(width: 20.w,)
            //       // AppCupertinoButton(
            //       //   child: Padding(
            //       //     padding: EdgeInsets.all(20.w),
            //       //     child: Image.asset(
            //       //         "assets/images/i-arrow-white-down.webp",
            //       //         width: 16.w),
            //       //   ),
            //       //   onPressed: () {
            //       //     BottomSheetUtil.showBottomSheet(
            //       //       context,
            //       //       data: controller.withdrawSelectData,
            //       //       ok: (String value, String label) {
            //       //         controller.idNode.editController.text = value;
            //       //         controller.idNode.editController.selection =
            //       //             TextSelection.fromPosition(
            //       //           TextPosition(
            //       //               offset: controller
            //       //                   .idNode.editController.text.length),
            //       //         );
            //       //       },
            //       //     );
            //       //   },
            //       // )
            //     ],
            //   ),
            // ),
            Container(
              width: double.infinity,
              height: 72.w,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 24.w, right: 20.w),
              decoration: BoxDecoration(
                border: Border.all(
                    color: const Color.fromRGBO(255, 255, 255, 0.1),
                    width: 1.w),
                image: const DecorationImage(
                  image: AssetImage("assets/images/btn-bg-gray.webp"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(8.w),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Tipo Pix:",
                      style: TextStyle(color: Colors.white, fontSize: 28.w)),
                  Expanded(
                    child: AppCupertinoButton(
                      onPressed: () {
                        BottomSheetUtil.showBottomSheet(
                          context,
                          selectData: controller.waysSelectLabel.value,
                          data: controller.ways,
                          ok: (String value, String label) {
                            controller.setWaysData(label, value);
                          },
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Obx(() {
                            return Text(
                              controller.waysSelectLabel.value,
                              style: TextStyle(
                                  color: const Color.fromRGBO(255, 255, 255, 1),
                                  fontSize: 28.w),
                            );
                          }),
                          SizedBox(width: 19.w),
                          Image.asset("assets/images/i-arrow-white-down.webp",
                              width: 16.w)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 72.w,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 24.w, right: 20.w),
              decoration: BoxDecoration(
                border: Border.all(
                    color: const Color.fromRGBO(255, 255, 255, 0.1),
                    width: 1.w),
                image: const DecorationImage(
                  image: AssetImage("assets/images/btn-bg-gray.webp"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(8.w),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(() {
                    return Text(
                      controller.waysSelectLabel.value,
                      style: TextStyle(color: Colors.white, fontSize: 28.w),
                    );
                  }),
                  SizedBox(width: 10.w),
                  Expanded(
                      child: Stack(
                    children: [
                      Obx(() {
                        return Visibility(
                          visible: controller.pixAccountNode.text.isEmpty,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Obx(
                              () {
                                return Text(
                                  controller.waysSelectLabel.value,
                                  style: TextStyle(
                                      color: const Color.fromRGBO(
                                          255, 255, 255, 0.4),
                                      fontSize: 28.w),
                                );
                              },
                            ),
                          ),
                        );
                      }),
                      Obx(() {
                        return MyInputFiled(
                          bgColor: Colors.transparent,
                          width: double.infinity,
                          keyboardType: controller.waysSelectValue.value == '2'
                              ? TextInputType.text
                              : TextInputType.number,
                          textDirection: TextDirection.rtl,
                          height: 72.w,
                          hint: '',
                          editNode: controller.pixAccountNode,
                        );
                      }),
                    ],
                  )),
                ],
              ),
            ),
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
