import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_comm/app/app_style.dart';
import 'package:flutter_comm/util/toast_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class onlineDeposit extends StatelessWidget {
  var isSele = false;
  var name = '';
  var isHave = false;
  var nameRight = '';
  var img = '';

  onlineDeposit(
      {Key? key,
      this.isSele = false,
      this.name = 'false',
      this.isHave = false,
      this.nameRight = '',
      this.img = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CupertinoButton(
        padding: EdgeInsets.zero,
        minSize: 0,
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 10.w, right: 10.w),
              height: 103.h,
              margin: EdgeInsets.only(top: 13.h, right: 6.w),
              decoration: BoxDecoration(
                border: Border.all(
                    color: isSele
                        ? Color(0xFF3EA1F8)
                        : Color.fromRGBO(93, 101, 111, 0.40),
                    width: 1.w),
                borderRadius: BorderRadius.circular(16.r),
                color: Color(0xFF1A1C1F),
                // color: Colors.red
              ),
              // crossAxisAlignment: CrossAxisAlignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (img.isNotEmpty)
                    Image(
                      image: AssetImage(img),
                      width: 70.w,
                    ),
                  Expanded(
                    child: SizedBox(),
                    flex: 1,
                  ),
                  Center(
                    child: Text(
                      name,
                      style: pubTextStyle(
                          isSele ? Color(0xFF3EA1F8) : Color(0xFF8F9DAB),
                          24.sp,
                          isSele ? FontWeight.w700 : FontWeight.w400),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(),
                    flex: 1,
                  ),
                ],
              ),
            ),
            if (isSele)
              Positioned(
                top: 79.h,
                right: 6.w,
                child: Image(
                  image: AssetImage('assets/images/user/ic_check_mark.webp'),
                  width: 36.w,
                  height: 36.h,
                ),
              ),
            if (isHave)
              Positioned(
                right: 0.w,
                child: Container(
                  padding: EdgeInsets.fromLTRB(12.w, 3.h, 12.w, 12.h),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              'assets/images/user/ic_tip_bubble.webp'),
                          fit: BoxFit.fill)),
                  child: Text(
                    nameRight,
                    style:
                        pubTextStyle(Color(0xFFffffff), 22.sp, FontWeight.w400),
                  ),
                ),
              ),
          ],
        ),
        // ),
        onPressed: () => {
              Toast.show('msg'),
            });
  }
}
