import 'package:flutter/material.dart';
import 'package:flutter_comm/app/component/app_select.dart';
import 'package:flutter_comm/app/entity/game_record_data.dart';
import 'package:flutter_comm/http/request.dart';
import 'package:flutter_comm/util/toast_util.dart';
import 'package:flutter_comm/util/app_util.dart';
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
              child: AppTab(
                tabs: controller.gtTabs,
                controller: controller.tabController,
                height: 100.w,
                indicatorWidth: 88.w,
                onTap: (index, value) {
                  controller.setGt(value);
                },
              ),
            ),
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
                    child: Text('Pesquisar',
                        style: TextStyle(
                          color: const Color.fromRGBO(255, 255, 255, 0.70),
                          fontSize: 24.w,
                        )),
                  ),
                  AppSelect(
                    width: 282.w,
                    height: 60.w,
                    value: '1',
                    onChange: (v) {
                      controller.setFlag(v);
                    },
                    selectDataList: controller.flagTabs,
                  ),
                  AppSelect(
                    width: 282.w,
                    height: 60.w,
                    onChange: (v) {
                      controller.setTy(v);
                    },
                    selectDataList: controller.tyTabs,
                  )
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.w),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(color: const Color.fromRGBO(14, 209, 244, 0.25), width: 1.0),
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromRGBO(4, 75, 154, 0.70),
                        Color.fromRGBO(1, 26, 81, 0.70),
                      ],
                    ),
                  ),
                  child: Column(
                    children: [
                      _buildItem(dataItem: ['Name\ndo jogo', 'Tempo', 'Valor\nda aposta', 'Lucro']),
                      Flexible(
                        child: Obx(() {
                          return AppList(
                            getList: apiRequest.requestGameRecord,
                            params: {
                              'gt': controller.gt.value,
                              'flag': controller.flag.value,
                              'ty': controller.ty.value,
                            },
                            builder: (dynamic el, int index) {
                              final item = GameRecordD.fromJson(el);
                              return _buildItem(
                                isOdd: !index.isOdd,
                                dataItem: [
                                  item.gameName ?? '-',
                                  AppUtil.timestamp2Date('${item.betTime ?? '0'}'),
                                  '${item.betAmount ?? '0'}',
                                  '${item.netAmount ?? '0'}',
                                ],
                              );
                            },
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox _buildItem({isOdd = false, genLen = 4, List<String>? dataItem}) {
    List<String> data = dataItem ?? List.generate(genLen, (index) => 'Title');
    return SizedBox(
      height: 94.w,
      child: Row(
        children: List.generate(
          data.length,
          (index) => Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: isOdd ? const Color.fromRGBO(217, 217, 217, 0.10) : Colors.transparent,
                border: Border(
                  left: BorderSide(
                    color: const Color.fromRGBO(255, 255, 255, 0.25),
                    width: index == 0 ? 0 : 1.w,
                  ),
                ),
              ),
              child: Center(
                child: Text(
                  data[index],
                  style: TextStyle(
                    color: const Color.fromRGBO(255, 255, 255, 0.70),
                    fontSize: 24.w,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
