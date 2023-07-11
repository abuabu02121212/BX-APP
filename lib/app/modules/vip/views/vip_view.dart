import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../component/app_header.dart';
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
          children: [
            Center(
              child: Container(
                width: double.infinity,
                height: 330.w,
                margin: EdgeInsets.only(top: 30.w),
                child: PageView.builder(
                  itemCount: 5,
                  controller: PageController(initialPage: 0, viewportFraction: 0.93),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 120.w,
                      child: Stack(
                        children: [
                          Image.asset("assets/images/vip/card.webp", width: 1.sw),
                        ],
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
