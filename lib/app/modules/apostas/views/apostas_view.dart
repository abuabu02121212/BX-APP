import 'package:flutter/material.dart';
import 'package:flutter_comm/app/component/app_select.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../component/app_header.dart';
import '../../../component/app_list.dart';
import '../../../component/app_tab.dart';
import '../controllers/apostas_controller.dart';

class ApostasView extends GetView<ApostasController> {
  const ApostasView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leadingWidth: 0,
        title: const AppHeader(title: "Histórico de Apostas"),
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
                  'label': 'Todas',
                  'value': '1'
                },
                {
                  'label': 'ganho',
                  'value': '2'
                }
              ], height: 100.w),
            ),
            Row(
              children: [
                SizedBox(
                  width: 148.w,
                  child: Center(
                    child: Text('Pesquisar', style: TextStyle(
                      color: const Color.fromRGBO(255, 255, 255, 0.70),
                      fontSize: 24.w,
                    )),
                  ),
                ),
                const Flexible(
                  flex: 1,
                  child: AppSelect(
                    selectDataList: [
                      {
                        'label': 'Todas',
                        'value': '1'
                      },
                      {
                        'label': 'ganho',
                        'value': '2'
                      }
                    ],
                  )
                ),
                const Flexible(
                    flex: 1,
                    child: AppSelect(
                      selectDataList: [
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
                )
              ],
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
