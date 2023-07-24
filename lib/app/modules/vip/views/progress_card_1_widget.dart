import 'package:flutter/material.dart';
import 'package:flutter_comm/app/modules/vip/controllers/vip_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../globe_controller.dart';
import '../../../../util/math_util.dart';
import '../../../../util/toast_util.dart';
import '../../../app_style.dart';
import '../../../component/app_button.dart';
import '../../../component/app_progress.dart';
import '../../../entity/user_info.dart';

class VipProgress1CardWidget extends StatelessWidget {
  VipProgress1CardWidget({
    super.key,
  });

  final GlobeController globeController = Get.find<GlobeController>();
  final VipController vipController = Get.put(VipController());

  @override
  Widget build(BuildContext context) {
    UserInfoEntity? entity = globeController.userInfoEntity.value;
    var nowDeposit = entity?.nowDeposit;
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 24.w),
        padding: EdgeInsets.only(left: 20.w, right: 20.w),
        width: 710.w,
        height: 152.w,
        decoration: BoxDecoration(
          gradient: headerLinearGradient,
          borderRadius: BorderRadius.circular(20.w),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      // 充值总额
                      "Quantidade total de recarga: ",
                      style: TextStyle(
                        fontSize: 28.w,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Obx(() {
                        return Text(
                          "$nowDeposit / ${vipController.nextLevelDeposit.value}",
                          style: TextStyle(
                            fontSize: 27.w,
                            color: const Color(0xff0ED1F4),
                            fontWeight: FontWeight.w700,
                          ),
                        );
                      }
                    )
                  ],
                ),
                SizedBox(height: 18.w),
                Obx(() {
                    return AppProgress(
                      width: 480.w,
                      height: 30.w,
                      radius: 15.w,
                      progress: MathU.computePercent(nowDeposit, vipController.nextLevelDeposit.value),
                      colorList: AppProgress.colorList2,
                    );
                  }
                ),
              ],
            ),
            AppButton(
              width: 140.w,
              height: 56.w,
              radius: 16.w,
              colorList: AppButton.colorList2,
              textColor: const Color(0xff000000),
              text: 'IR',
              onClick: () {
                Toast.show("按钮被点击");
              },
            ),
          ],
        ),
      ),
    );
  }
}
