import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../component/app_header.dart';
import '../../../component/app_list.dart';
import '../../../component/app_tab.dart';
import '../controllers/notice_list_controller.dart';

class NoticeListView extends GetView<NoticeListController> {
  const NoticeListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leadingWidth: 0,
        title: const AppHeader(title: "Centro de Notificação"),
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
                  'label': 'Nao Lido',
                  'value': '2'
                }
              ], height: 100.w),
            ),
            Flexible(child: Container(
              width: 710.w,
              margin: EdgeInsets.only(left: 20.w, right: 20.w,bottom: 30.w),
              // child: AppList(
              //     apiUrl: '',
              //     builder: (dynamic item) {
              //       return Container(
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
              //             padding: EdgeInsets.only(left: 25.w, right: 25.w,bottom: 22.w),
              //             child: Column(
              //               children: [
              //                 SizedBox(height: 20.w),
              //                 Row(
              //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                   children: [
              //                     Expanded(
              //                       child: Row(
              //                         children: [
              //                           Container(
              //                             width: 585.w,
              //                             child: Text('Pedido de recarga enviado Pedido de recarga...',
              //                                 style: TextStyle(color: Colors.white, fontSize: 28.w),maxLines: 1,overflow: TextOverflow.ellipsis),
              //                           ),
              //                           // 红色未读
              //                           Image(image: AssetImage('assets/images/i-red.webp'), width: 18.w)
              //                         ],
              //                       ),
              //                     ),
              //                     // 展开更多
              //                     Container(
              //                       margin: EdgeInsets.only(left: 23.w),
              //                       child: CupertinoButton(
              //                           padding: EdgeInsets.zero,
              //                           minSize: 0,
              //                           child: Image(image: AssetImage('assets/images/i-arrow-white-down.webp'), width: 26.w),
              //                           onPressed: (){
              //
              //                           }
              //                       ),
              //                     )
              //                   ],
              //                 ),
              //                 Container(
              //                   margin: EdgeInsets.only(top: 10.w),
              //                   alignment: Alignment.centerLeft,
              //                   child: Text('2023-06-26 01:03', style: TextStyle(color: Colors.white, fontSize: 24.w)),
              //                 ),
              //                 // 展开内容
              //                 Container(
              //                   margin: EdgeInsets.only(top: 17.w),
              //                   padding: EdgeInsets.only(top:13.w),
              //                   decoration: BoxDecoration(
              //                       border: Border(
              //                         top: BorderSide(
              //                             color: const Color.fromRGBO(255, 255, 255, 0.25),
              //                             width: 1.w
              //                         )
              //                     )
              //                   ),
              //                   child: Column(
              //                     mainAxisAlignment: MainAxisAlignment.start, // 主轴对齐方式调整
              //                     crossAxisAlignment: CrossAxisAlignment.start, // 交叉轴对齐方式调整
              //                     children: [
              //                       Container(
              //                         alignment: Alignment.centerLeft,
              //                         padding: const EdgeInsets.only(bottom: 0),
              //                         child: Text('Prezado cliente, Você adicionou com SUCESSO R\$.20.00 fichas.  Boa sorte e grandes vitórias! ID do jogo:171 ID do pedido:4DA652749FBC367E ', style: TextStyle(color: Colors.white, fontSize: 28.w,height: 1.3)),
              //                       ),
              //                       Container(
              //                         alignment: Alignment.centerLeft,
              //                         child: Text('Data:2023-06-25 16:36:41', style: TextStyle(color: Colors.white, fontSize: 28.w,height: 1.0)),
              //                       ),
              //                     ],
              //                   )
              //                 )
              //
              //               ],
              //             ),
              //           )
              //       );
              //     }
              // ),
            ))
          ],
        ),
      )
    );
  }
}
