import 'package:flutter/material.dart';
import 'package:flutter_comm/app/component/app_header.dart';
import 'package:flutter_comm/app/component/app_list.dart';
import 'package:flutter_comm/app/component/app_tab.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/transaction_controller.dart';

class TransactionView extends GetView<TransactionController> {
  const TransactionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leadingWidth: 0,
        title: const AppHeader(title: "Transação"),
      ),
      backgroundColor: const Color.fromRGBO(0, 10, 29, 1),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(1, 26, 81, 0.0),
                    Color(0xFF011A51),
                  ],
                  stops: [0.3594, 1.0],
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, -1),
                    blurRadius: 0,
                    spreadRadius: 0,
                    color: Color.fromRGBO(255, 255, 255, 0.10),
                  ),
                  BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 5,
                    spreadRadius: 0,
                    color: Color.fromRGBO(0, 0, 0, 0.30),
                  ),
                ],
              ),
              child: AppTab(tabs: const [
                {
                  'label': 'Depósito',
                  'value': '1'
                },
                {
                  'label': 'Retirar',
                  'value': '2'
                }
              ], height: 100.w),
            ),
            Flexible(child: Container(
              child: AppList(
                apiUrl: '',
                builder: (dynamic item) {
                  return Container(
                    height: 250.w,
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      border: Border(
                        bottom: BorderSide(
                          color: Color.fromRGBO(0, 0, 0, 0.10),
                          width: 1,
                        ),
                      ),
                    ),
                    child: Center(
                      child: Text(item['name']),
                    )
                  );
                }
              ),
            ))
          ],
        ),
      )
    );
  }
}
