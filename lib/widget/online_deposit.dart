import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_comm/app/app_style.dart';
import 'package:flutter_comm/util/toast_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///deposit 通用选项组件
class onlineDeposit extends StatelessWidget {
  var isSele = false;
  var name = '';
  var isHave = false;
  var nameRight = '';
  var img = '';
  Function? click;

  onlineDeposit(
      {Key? key,
      this.isSele = false,
      this.name = 'false',
      this.isHave = false,
      this.nameRight = '',
      this.click,
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
              height: 75.h,
              margin: EdgeInsets.only(top: 13.h, right: 6.w),
              decoration: BoxDecoration(
                border: Border.all(
                    color: isSele
                        ? const Color(0xFF3EA1F8)
                        : const Color.fromRGBO(93, 101, 111, 0.40),
                    width: 1.w),
                borderRadius: BorderRadius.circular(16.r),
                color: const Color(0xFF1A1C1F),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (img.isNotEmpty)
                    Image(
                      image: AssetImage(img),
                      width: 70.w,
                    ),
                  const Expanded(
                    flex: 1,
                    child: SizedBox(),
                  ),
                  Center(
                    child: Text(
                      name,
                      textAlign: TextAlign.center,
                      style: pubTextStyle(
                          isSele
                              ? const Color(0xFF3EA1F8)
                              : const Color(0xFF8F9DAB),
                          24.sp,
                          isSele ? FontWeight.w700 : FontWeight.w400),
                    ),
                  ),
                  const Expanded(
                    flex: 1,
                    child: SizedBox(),
                  ),
                ],
              ),
            ),
            if (isSele)
              Positioned(
                // top: 60.h,
                right: 6.w,
                bottom: -3.h,
                child: Image(
                  image:
                      const AssetImage('assets/images/user/ic_check_mark.webp'),
                  width: 36.w,
                  height: 36.h,
                ),
              ),
            if (isHave)
              Positioned(
                right: 0.w,
                child: Container(
                  padding: EdgeInsets.fromLTRB(12.w, 3.h, 12.w, 12.h),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              'assets/images/user/ic_tip_bubble.webp'),
                          fit: BoxFit.fill)),
                  child: Text(
                    nameRight,
                    style:
                        pubTextStyle(const Color(0xFFffffff), 22.sp, FontWeight.w400),
                  ),
                ),
              ),
          ],
        ),
        // ),
        onPressed: () => {
              Toast.show('msg'),
              click!(name),
            });
  }
}
