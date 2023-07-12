import 'package:flutter/material.dart';
import 'package:flutter_comm/app/modules/vip/views/vip_card_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../component/app_header.dart';
import '../../../component/app_progress.dart';
import '../controllers/vip_controller.dart';

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
      body: Container(
        color: const Color(0xff020a1d),
        child: ListView(
          children: const [VipCard()],
        ),
      ),
    );
  }
}