import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppEmptyPromotion extends StatelessWidget {
  const AppEmptyPromotion({
    super.key,
    this.width,
    this.height,
    this.alignment,
    this.name,
  });

  final double? height;
  final double? width;
  final AlignmentGeometry? alignment;
  final String? name;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      width: width,
      height: height,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 30.h,
          ),
          Image.asset('assets/images/promotion/ic_no_records.webp',
              width: (width! / 1).w),
          SizedBox(
            height: 30.h,
          ),
          Center(
            child: Text(name!,
                style: TextStyle(
                    color: const Color(0xff5D656F),
                    fontSize: 24.w,
                    fontWeight: FontWeight.w400)),
          )
        ],
      ),
    );
  }
}
