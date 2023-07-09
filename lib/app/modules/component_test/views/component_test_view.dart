import 'package:flutter/material.dart';
import 'package:flutter_comm/app/component/app_empty.dart';
import 'package:flutter_comm/app/component/app_header.dart';
import 'package:flutter_comm/app/component/app_list.dart';
import 'package:flutter_comm/app/component/app_radio.dart';
import 'package:flutter_comm/app/component/app_select.dart';
import 'package:flutter_comm/app/component/app_tab.dart';
import 'package:flutter_comm/app/component/app_vip_tab.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../../../util/toast_util.dart';
import '../../../component/app_button.dart';
import '../../../component/app_progress.dart';
import '../controllers/component_test_controller.dart';

class ComponentTestView extends GetView<ComponentTestController> {
  const ComponentTestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leadingWidth: 0,
        title: const AppHeader(title: "页面标题示例"),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.black,
          child: ListView(children: [
            Container(
              color: Colors.purple,
              padding: const EdgeInsets.all(5),
              child: AppButton(
                width: 240.w,
                height: 80.w,
                radius: 40.w,
                text: 'Button示例',
                onClick: () {
                  Toast.show("按钮被点击");
                },
              ),
            ),
            Container(
              color: Colors.blue,
              padding: const EdgeInsets.all(5),
              child: Center(
                child: AppProgress(
                  width: 348.w,
                  height: 30.w,
                  radius: 10.w,
                  progress: 50,
                ),
              ),
            ),
            Container(
              color: Colors.grey,
              padding: const EdgeInsets.all(5),
              child: Center(
                child: AppVipTab(
                  maxUnlockIndex: 2,
                  onItemClick: (int index) {
                    Toast.show("$index");
                  },
                ),
              ),
            ),
            Container(
              child: AppTab(
                onTap: (int index, String value) {
                  Toast.show("$index" + value);
                },
                tabs: [
                  {
                    'label': 'A',
                    'value': 'A'
                  }, {
                    'label': 'B',
                    'value': 'B'
                  }
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Obx(() => AppRadio(
                    isCheck: controller.check.value,
                    onClick: () {
                      Toast.show("点击了");
                      controller.check.value = !controller.check.value;
                    },
                  ))
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  AppSelect(
                    selectDataList: const [
                      {
                        'label': 'A1',
                        'value': 'A111111'
                      }, {
                        'label': 'B2',
                        'value': 'B222222'
                      }, {
                        'label': 'C3',
                        'value': 'C333333'
                      }, {
                        'label': 'D4',
                        'value': 'D444444'
                      }, {
                        'label': 'E5',
                        'value': 'E555555'
                      }
                    ],
                    value: 'B2',
                    onChange: (String value) {
                      Toast.show(value);
                    },
                  ),
                ],
              ),
            ),
            Column(
              children: [
                AppEmpty(),
                Container(
                  height: 500.w,
                  color: Colors.red,
                  child: AppList(
                    apiUrl: '',
                    builder: (dynamic item) {
                      return Container(
                        height: 130.w,
                        color: Colors.green,
                        child: Center(child: Text(item['name'])),
                      );
                    },
                  )
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
