import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../app_style.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({
    super.key,
    this.title,
    this.isNeedLeftBackArrow = true,
    this.titleWidget,
  });

  final String? title;
  final Widget? titleWidget;
  final bool isNeedLeftBackArrow;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 110.w,
      decoration: const BoxDecoration(color: headerBgColor),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 10.w,
            child: isNeedLeftBackArrow
                ? IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.arrow_back_ios, size: 35.w))
                : const SizedBox(),
          ),
          if (title != null)
            Text(
              title!,
              style: TextStyle(
                color: Colors.white,
                fontSize: 36.w,
              ),
            ),
          if (titleWidget != null) titleWidget!,
        ],
      ),
    );
  }
}
