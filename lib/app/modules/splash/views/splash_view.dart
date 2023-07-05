import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

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
              "images/splash.webp",
              fit: BoxFit.cover,
              width: 1.sw,
              height: 1.sh,
            ),
          ],
        ),
      ),
    );
  }
}
