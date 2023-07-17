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
                  AppSelect(
                    width: 336.w,
                    height: 60.w,
                    value: '1',
                    onChange: (v) {
                      Toast.show(v.toString());
                    },
                    selectDataList: const [
                      {
                        'label': 'Hoje',
                        'value': '1'
                      },
                      {
                        'label': 'Últimos 7 dias',
                        'value': '2'
                      },
                      {
                        'label': 'Últimos 60 dias',
                        'value': '3'
                      }
                    ],
                  ),
                  AppSelect(
                    width: 336.w,
                    height: 60.w,
                    onChange: (v) {
                      Toast.show(v.toString());
                    },
                    selectDataList: const [
                      {
                        'label': 'Todos',
                        'value': '1'
                      },
                      {
                        'label': 'Depositar',
                        'value': '2'
                      },
                      {
                        'label': 'Entrar',
                        'value': '3'
                      },
                      {
                        'label': 'Sokoban',
                        'value': '4'
                      }
                    ],
                  )
                ],
              ),
            ),
            Flexible(child: Container(
              width: 710.w,
              margin: EdgeInsets.only(left: 20.w, right: 20.w,bottom: 30.w),
              // child: AppList(
              //     apiUrl: '',
              //     builder: (dynamic item) {
              //       return Container(
              //           height: 208.w,
              //           margin: EdgeInsets.only(top: 30.w),
              //           decoration: BoxDecoration(
              //               gradient: const LinearGradient(
              //                   begin: Alignment.topCenter,
              //                   end: Alignment.bottomCenter,
              //                   colors: [
              //                     Color.fromRGBO(4, 75, 154, 0.7),
              //                     Color(0xFF011A51),
              //                   ]
              //               ),
              //               borderRadius: BorderRadius.circular(20.w),
              //               border: Border.all(
              //                   color: const Color.fromRGBO(14, 209, 244, 0.25),
              //                   width: 1.w
              //               )
              //           ),
              //           child: Container(
              //             padding: EdgeInsets.only(left: 22.w, right: 22.w),
              //             child: Column(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 SizedBox(height: 20.w),
              //                 Text('Check-In', style: TextStyle(
              //                     fontSize: 28.w,
              //                     color: Colors.white
              //                 )),
              //                 SizedBox(height: 32.w),
              //                 Text('Depósito Bônus 3%', style: TextStyle(
              //                     fontSize: 32.w,
              //                     color: Color(0xff0ED1F4),
              //                     fontWeight: FontWeight.bold
              //                 )),
              //                 SizedBox(height: 32.w),
              //                 Text('2023-06-26 01:03', style: TextStyle(
              //                     fontSize: 28.w,
              //                     color: Color.fromRGBO(255, 255, 255, 0.70),
              //                 )),
              //               ],
              //             ),
              //           )
              //       );
              //     }
              // ),
            ))
          ],
        ),
      ),
    );
  }
}
