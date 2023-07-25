import 'package:flutter/material.dart';
import 'package:flutter_comm/app/component/app_button.dart';
import 'package:flutter_comm/app/routes/app_pages.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../component/app_header.dart';
import '../controllers/center_bank_list_controller.dart';

class CenterBankListView extends GetView<CenterBankListController> {
  const CenterBankListView({Key? key}) : super(key: key);

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
              'Carteira digital(0/5)',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28.w,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.w),
              child: ListView(
                children: [
                  _buildNoData(),
                  _buildBankItem('564* **** **** *888', true),
                  _buildBankItem('564* **** **** *888', true),
                  _buildBankItem('564* **** **** *888', false),
                  SizedBox(height: 60.w),
                  AppButton(
                    width: 580.w,
                    height: 90.w,
                    text: '+ Número da conta bancária',
                    onClick: () {
                      Get.toNamed(Routes.CENTER_BANK_LIST_ADD);
                    },
                    radius: 100.w,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20.w),
                    alignment: Alignment.center,
                    child: Text(
                      'Máximo 5 permitido',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 26.w,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildBankItem(String text, bool isLast) {
    return Container(
      height: 300.w,
      margin: EdgeInsets.only(bottom: isLast ? 30.w : 0),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bank_bg.webp'),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 120.w, left: 170.w),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 52.w,
          ),
        ),
      ),
    );
  }

  _buildNoData() {
    return Container(
      child: Column(
        children: [
          Image.asset(
            'assets/images/no_bank.webp',
            width: 521.w,
          ),
          Text(
            'Conta vazia',
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 26.w,
            ),
          )
        ],
      ),
    );
  }
}
