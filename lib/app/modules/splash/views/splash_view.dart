import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../../widget/count_down.dart';
import '../../../routes/app_pages.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.blue,
        child: Stack(
          children: [
            Image.asset(
              "assets/images/splash.png",
              fit: BoxFit.cover,
              width: 1.sw,
              height: 1.sh,
            ),
            Positioned(
                right: 30.w,
                top: 60.w,
                child: CountdownWidget(
                  seconds: 4,
                  finish: () {
                    Get.offNamed(Routes.HOME);
                  },
                  childBuild: (String text, String text2) {
                    return ClipOval(
                      child: Container(
                        width: 45.w,
                        height: 45.w,
                        color: const Color(0xff3f3f3f),
                        alignment: Alignment.center,
                        child: Text(
                          text,
                          style: TextStyle(color: Colors.white, fontSize: 15.w),
                        ),
                      ),
                    );
                  },
                )),
          ],
        ),
      ),
    );
  }
}
