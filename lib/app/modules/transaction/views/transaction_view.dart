import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_comm/app/component/app_header.dart';
import 'package:flutter_comm/app/component/app_list.dart';
import 'package:flutter_comm/app/component/app_tab.dart';
import 'package:flutter_comm/http/request.dart';
import 'package:flutter_comm/util/app_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../../util/toast_util.dart';
import '../../../entity/member_record_data.dart';
import '../controllers/transaction_controller.dart';

class TransactionView extends GetView<TransactionController> {
  const TransactionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leadingWidth: 0,
        backgroundColor: const Color.fromRGBO(3, 90, 202, 1),
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
              child: AppTab(
                controller: controller.tabController,
                tabs: controller.tabs,
                height: 100.w,
                indicatorWidth: 88.w,
                onTap: (int index, String value) {
                  controller.setFlag(value);
                },
              ),
            ),
            Flexible(
              child: Container(
                width: 710.w,
                margin: EdgeInsets.only(
                  left: 20.w,
                  right: 20.w,
                  bottom: 30.w,
                ),
                child: Obx(() {
                  return AppList(
                    params: {'flag': int.parse(controller.flag.value)},
                    getList: apiRequest.requestMemberRecord,
                    builder: (el, int index) {
                      final item = MemberRecordD.fromJson(el);
                      return buildItem(item);
                    },
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }

  Column buildItem(MemberRecordD item) {
    return Column(
      children: [
        Container(
          height: 350.w,
          margin: EdgeInsets.only(
            top: 30.w,
          ),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(4, 75, 154, 0.7),
                Color(0xFF011A51),
              ],
            ),
            borderRadius: BorderRadius.circular(
              20.w,
            ),
            border: Border.all(
              color: const Color.fromRGBO(14, 209, 244, 0.25),
              width: 1.w,
            ),
          ),
          child: Container(
            padding: EdgeInsets.only(
              left: 25.w,
              right: 25.w,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 80.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'ID da ordem: ${item.billNo}',
                        style: TextStyle(
                          color: const Color(0xff0ED1F4),
                          fontSize: 32.w,
                        ),
                      ),
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        minSize: 0,
                        child: Image(
                          image: AssetImage('assets/images/i-transaction-copy.webp'),
                          width: 36.w,
                        ),
                        onPressed: () {
                          AppUtil.copy(item.billNo ?? '');
                        },
                      )
                    ],
                  ),
                ),
                Divider(
                  color: const Color.fromRGBO(255, 255, 255, 0.25),
                  height: 1.w,
                ),
                SizedBox(
                  height: 64.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Valor',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28.w,
                        ),
                      ),
                      Text(
                        AppUtil.amountFormat(item.amount ?? ''),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28.w,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 64.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'valor do bônus:',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28.w,
                        ),
                      ),
                      Text(
                        AppUtil.amountFormat(item.discount ?? ''),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28.w,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 64.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Modelo',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28.w,
                        ),
                      ),
                      Text(
                        (item.fname ?? '').isEmpty ? '-' : item.fname!,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28.w,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 64.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppUtil.timestamp2Date(item.createdAt ?? ''),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28.w,
                        ),
                      ),
                      // F89F03 黄色字体 Esperando
                      Text(
                        _transferState(item.state ?? 3),
                        style: TextStyle(
                          color: _buildStateColor(item.state ?? 3),
                          fontSize: 28.w,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Color _buildStateColor(int state) {
    if (state == 1) {
      return const Color(0xff5DDB1C);
    } else if (state == 2) {
      return const Color.fromRGBO(248, 159, 3, 1);
    } else {
      return const Color.fromRGBO(231, 11, 11, 1);
    }
  }

  String _transferState(int state) {
    if (state == 1) {
      return 'Sucesso';
    } else if (state == 2) {
      return 'Esperando';
    } else {
      return 'falhar';
    }
  }
}
