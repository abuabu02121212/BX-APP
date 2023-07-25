import 'package:flutter/material.dart';
import 'package:flutter_comm/widget/input_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

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
        title: const AppHeader(
          title: "Número da conta bancária",
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 94.w,
            padding: EdgeInsets.symmetric(horizontal: 35.w),
            alignment: Alignment.centerLeft,
            child: Text(
              'Nome completo: 0***** ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28.w,
              ),
            ),
          ),
          Container(
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
            // child: MyInputFiled(
            //   hintText: 'Nome completo',
            //   hintStyle: TextStyle(
            //     color: Colors.white,
            //     fontSize: 28.w,
            //   ),
            //   contentPadding: EdgeInsets.symmetric(horizontal: 35.w),
            //   border: InputBorder.none,
            // ),
          ),
        ],
      ),
    );
  }
}
