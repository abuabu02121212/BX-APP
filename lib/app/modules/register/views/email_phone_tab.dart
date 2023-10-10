
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../widget/horizontal_indicator_tab.dart';

class EmailAndPhoneTab extends StatelessWidget {
  EmailAndPhoneTab({
    super.key,
    required this.onTabSelectChanged,
  });

  final selectedTabIndex = 0.obs;
  final Callback<int, bool> onTabSelectChanged;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      var selectedIndex = selectedTabIndex.value;
      String img1 = selectedIndex == 0 ? "assets/images/reg_email_1.webp" : "assets/images/reg_email_2.webp";
      String img2 = selectedIndex == 1 ? "assets/images/reg_phone_1.webp" : "assets/images/reg_phone_2.webp";
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CupertinoButton(
            onPressed: () {
              if (selectedTabIndex.value != 0) {
                onTabSelectChanged(0, false);
              }
              selectedTabIndex.value = 0;
            },
            minSize: 0,
            padding: EdgeInsets.zero,
            child: Image.asset(
              img1,
              width: 72.w,
              gaplessPlayback: true,
            ),
          ),
          SizedBox(width: 36.w),
          Container(
            width: 1.w,
            height: 72.w,
            color: const Color.fromRGBO(255, 255, 255, 0.25),
          ),
          SizedBox(width: 36.w),
          CupertinoButton(
            onPressed: () {
              if (selectedTabIndex.value != 1) {
                onTabSelectChanged(1, false);
              }
              selectedTabIndex.value = 1;
            },
            minSize: 0,
            padding: EdgeInsets.zero,
            child: Image.asset(img2, width: 72.w),
          ),
        ],
      );
    });
  }
}