import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../component/app_select.dart';
import '../controllers/recompensas_controller.dart';

import 'package:flutter_comm/util/toast_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../component/app_header.dart';
import '../../../component/app_list.dart';
import '../../../component/app_tab.dart';

class RecompensasView extends GetView<RecompensasController> {
  const RecompensasView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leadingWidth: 0,
        title: const AppHeader(title: "Histórico de recompensas"),
      ),
      backgroundColor: const Color.fromRGBO(0, 10, 29, 1),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 8.w),
              decoration: const BoxDecoration(
                color: Color.fromRGBO(1, 26, 81, 0.30),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    child: Text('Pesquisar', style: TextStyle(
                      color: const Color.fromRGBO(255, 255, 255, 0.70),
                      fontSize: 24.w,
                    )),
                  ),
                  AppSelect(
                    width: 282.w,
                    value: '2',
                    onChange: (v) {
                      Toast.show(v.toString());
                    },
                    selectDataList: const [
                      {
                        'label': 'Todas',
                        'value': '1'
                      },
                      {
                        'label': 'ganho',
                        'value': '2'
                      }
                    ],
                  ),
                  AppSelect(
                    width: 282.w,
                    onChange: (v) {
                      Toast.show(v.toString());
                    },
                    selectDataList: const [
                      {
                        'label': 'AA',
                        'value': '1'
                      },
                      {
                        'label': 'BB',
                        'value': '2'
                      }
                    ],
                  )
                ],
              ),
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
      ),
    );
  }
}
