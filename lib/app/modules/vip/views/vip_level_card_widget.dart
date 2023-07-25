import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../globe_controller.dart';
import '../../../../util/app_util.dart';
import '../../../component/app_progress.dart';
import '../../../entity/user_info.dart';
import '../../../entity/vip_level_info.dart';
import '../controllers/vip_controller.dart';

class VipLevelCard extends StatelessWidget {
  VipLevelCard({super.key});

  final VipController controller = Get.put(VipController());
  final GlobeController globeController = Get.find<GlobeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 330.w,
      margin: EdgeInsets.only(top: 30.w),
      child: Obx(() {
        var list = controller.dataList;
        UserInfoEntity? entity = globeController.userInfoEntity.value;
        return PageView.builder(
          itemCount: list.length,
          controller: PageController(initialPage: 0, viewportFraction: 0.93),
          scrollDirection: Axis.horizontal,
          onPageChanged: (pageIndex) {
            controller.onLevelCardSelectChanged(pageIndex);
          },
          itemBuilder: (BuildContext context, int index) {
            VipInfoEntity item = list[index];
            bool isLast = index == list.length - 1;
            return SizedBox(
              height: 120.w,
              //  width: double.infinity,
              child: Stack(
                children: [
                  Image.asset("assets/images/vip/card.webp", width: double.infinity),
                  Padding(
                    padding: EdgeInsets.only(left: 40.w, right: 30.w, top: 34.w),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/vip/medal-$index.webp", width: 142.w),
                            isLast
                                ? const SizedBox()
                                : Obx(() {
                                    return AppProgress(
                                      width: 348.w,
                                      height: 30.w,
                                      radius: 10.w,
                                      progress: controller.curCardLevelProgress.value,
                                    );
                                  }),
                            isLast
                                ? const SizedBox()
                                : Obx(() {
                                    return Text(
                                        "${controller.curCardLevelProgress.value} / 100",
                                        style: TextStyle(
                                          fontSize: 26.w,
                                          color: const Color(0xffffffff),
                                          fontWeight: FontWeight.w400,
                                        ),
                                      );
                                  }
                                ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 12.w, left: 20.w, right: 20.w),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: List.generate(3, (pos) {
                              String amount = '0';
                              switch (pos) {
                                case 0:
                                  amount = AppUtil.getIntegerPart(item.depositAmount ?? '0');
                                  break;
                                case 1:
                                  amount = AppUtil.getIntegerPart(item.flow ?? '0');
                                  break;
                                case 2:
                                  amount = AppUtil.getIntegerPart(entity?.nowValidAmount ?? '0');
                                  break;
                              }
                              return ItemWidget(index: pos, text: amount);
                            }),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}

class ItemWidget extends StatelessWidget {
  ItemWidget({
    super.key,
    required this.index,
    required this.text,
  });

  final int index;
  final String text;

  /// 累计存款 流量要求 经验值
  final List<String> names = ["Depósito \ncumulativo", "Requisitos \nde fluxo", "Valor da \nexperiência"];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 32.w,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          names[index],
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24.w,
            color: const Color.fromRGBO(255, 255, 255, 0.70),
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
