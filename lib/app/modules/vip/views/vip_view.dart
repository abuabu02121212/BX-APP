import 'package:flutter/material.dart';
import 'package:flutter_comm/app/modules/vip/views/progress_card_1_widget.dart';
import 'package:flutter_comm/app/modules/vip/views/progress_card_2_widget.dart';
import 'package:flutter_comm/app/modules/vip/views/vip_level_card_widget.dart';
import 'package:flutter_comm/app/modules/vip/views/vip_withdraw_card_widget.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import '../../../../util/Log.dart';
import '../../../app_style.dart';
import '../../../component/app_header.dart';
import '../controllers/vip_controller.dart';
import 'level_list_view_widget.dart';

class VipView extends GetView<VipController> {
  VipView({Key? key}) : super(key: key);

  @override
  final VipController controller = Get.put(VipController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: headerBgColor,
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
          //  NestedScrollView(headerSliverBuilder: headerSliverBuilder, body: body)
          EasyRefresh(
            header: ClassicalHeader(textColor: Colors.white),
            onRefresh: () async{
              controller.requestVip();
              Log.d("=== onRefresh ===");
            },
            child: ListView(
              children: [
                VipLevelCard(),
                VipWithdrawCardWidget(),
                Obx(() {
                  bool isHidden = controller.nextLevelDeposit.value == '-1';
                    return isHidden ? const SizedBox() : Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                        VipProgress1CardWidget(),
                        VipProgress2CardWidget(),
                      ],
                    );
                  }
                ),

                LevelListViewWidget(),
                SizedBox(height: 125.w),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
