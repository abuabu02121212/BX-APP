import 'package:flutter/material.dart';
import 'package:flutter_comm/app/component/app_update.dart';
import 'package:flutter_comm/app/entity/app_upgrade.dart';
import 'package:get/get.dart';

import '../app/component/app_pay_password.dart';

class AppDialog {
  /// 打开更新app弹框
  static void showUpdateAppDialog(AppUpgradeData appUpgradeData) {
    bool isForce = appUpgradeData.isForce == 1;
    Get.dialog(
      WillPopScope(
        child: AppUpdate(appUpgradeData: appUpgradeData),
        onWillPop: () async => !isForce,
      ),
      barrierDismissible: !isForce,
    );
  }

  /// 打开去设置支付密码弹框
  static void showSetPayPwdDialog() {
    Get.dialog(
      AppPayPassword(),
    );
  }
}
