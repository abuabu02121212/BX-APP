import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 110.w,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff044B9A), Color(0xff011A51)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 20.w,
            child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.arrow_back_ios)),
          ),
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 36.w,
            ),
          )
        ],
      ),
    );
  }
}
