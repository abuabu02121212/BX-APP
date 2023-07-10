import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../modules/mine/controllers/mine_controller.dart';
import 'app_button.dart';

class AppAvatar extends StatefulWidget {
  const AppAvatar({Key? key}) : super(key: key);

  @override
  State<AppAvatar> createState() => _AppAvatarState();
}

class _AppAvatarState extends State<AppAvatar> {
  // final controller = Get.find<MineController>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 634.w,
        height: 713.w,
        decoration: BoxDecoration(
          color: Color(0xFF011A51),
          borderRadius: BorderRadius.circular(20.w),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 48.w,
            ),
            Text(
              'Modificar Avatar',
              style: TextStyle(
                fontSize: 26.w,
                color: Colors.white,
                fontWeight: FontWeight.w400,
                decoration: TextDecoration.none,
              ),
            ),
            SizedBox(
              height: 47.w,
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 27.w),
                child: Wrap(
                  alignment: WrapAlignment.start,
                  spacing: 28.w,
                  runSpacing: 28.w,
                  children: [
                    for(var i = 0; i < 12; i++)
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xFF0ED1F4),
                              width: i == 0 ? 5.w : 0.w,
                            ),
                            borderRadius: BorderRadius.circular(120.w),
                          ),
                          child: Image.asset(
                            'assets/images/avatar/avatar${i}.webp',
                            width: 120.w,
                            height: 120.w,
                          ),
                        ),
                        onPressed: () {
                          // controller.avatarIndex.value = i;
                        },
                      )
                  ],
                )
            ),
            Container(
              margin: EdgeInsets.only(top: 40.w, left: 27.w),
              child: Row(
                children: [
                  AppButton(
                    width: 280.w,
                    height: 90.w,
                    radius: 100.w,
                    text: 'Cancelar',
                    colorList: const [Color(0xff044B9A), Color(0xff044B9A)],
                    onClick: () {
                      Get.back();
                    },
                  ),
                  SizedBox(width: 19.w),
                  AppButton(
                    width: 280.w,
                    height: 90.w,
                    radius: 100.w,
                    text: 'Confirme',
                    onClick: () {

                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
