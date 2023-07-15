import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../util/toast_util.dart';
import '../../../app_style.dart';
import '../../../component/app_button.dart';
import '../../../component/app_progress.dart';

class VipProgress2CardWidget extends StatelessWidget {
  const VipProgress2CardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 30.w),
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
                      // 投注总额
                      "Número total de apostas: ",
                      style: TextStyle(
                        fontSize: 28.w,
                        color:  Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "0 / 20",
                      style: TextStyle(
                        fontSize: 27.w,
                        color: const Color(0xff0ED1F4),
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 18.w),
                AppProgress(
                  width: 480.w,
                  height: 30.w,
                  radius: 15.w,
                  progress: 40,
                  colorList: AppProgress.colorList2,
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
