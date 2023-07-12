import 'package:flutter/material.dart';
import 'package:flutter_comm/app/modules/vip/views/progress_card_1_widget.dart';
import 'package:flutter_comm/app/modules/vip/views/progress_card_2_widget.dart';
import 'package:flutter_comm/app/modules/vip/views/vip_level_card_widget.dart';
import 'package:flutter_comm/app/modules/vip/views/vip_withdraw_card_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import '../../../component/app_header.dart';
import '../controllers/vip_controller.dart';
import 'level_list_view_widget.dart';

class VipView extends GetView<VipController> {
  const VipView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leadingWidth: 0,
        toolbarHeight: 110.w,
        title: const AppHeader(
          title: "VIP",
          isNeedLeftBackArrow: false,
        ),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: const Color(0xff020a1d),
          ),
          Image.asset(
            "assets/images/vip-bg.webp",
            width: double.infinity,
          ),
          ListView(
            children: [
              const VipLevelCard(),
              const VipWithdrawCardWidget(),
              Padding(
                padding: EdgeInsets.only(top: 30.w, left: 20.w),
                child: Text(
                  "Distância próximo nível:",
                  style: TextStyle(
                    fontSize: 28.w,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const VipProgress1CardWidget(),
              const VipProgress2CardWidget(),
              const LevelListViewWidget(),
              SizedBox(height: 125.w),
            ],
          ),
        ],
      ),
    );
  }
}
