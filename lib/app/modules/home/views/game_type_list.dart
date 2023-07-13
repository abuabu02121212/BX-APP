import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../app_style.dart';
import '../controllers/home_controller.dart';

class HorizontalGameListWidget extends StatelessWidget {
  HorizontalGameListWidget({
    super.key,
    required this.titleImgPath,
  });

  final HomeController controller = Get.put(HomeController());
  final String titleImgPath;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 40.w),
        Image.asset(titleImgPath, height: 83.w),
        Container(
          margin: EdgeInsets.only(top: 0.w, left: 20.w, right: 20.w),
          width: double.infinity,
          height: 520.w,
          decoration: BoxDecoration(
              gradient: headerLinearGradient,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30.w),
                topRight: Radius.circular(30.w),
                bottomRight: Radius.circular(30.w),
              )),
          child: GridView.builder(
            itemCount: 20,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1.2),
            itemBuilder: (BuildContext context, int index) {
              return const GameItemWidget();
            },
          ),
        ),
      ],
    );
  }
}

class VerticalGameTypeList extends StatelessWidget {
  const VerticalGameTypeList({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 30,
      shrinkWrap: true,
      padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 20.w),
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 1.1),
      itemBuilder: (BuildContext context, int index) {
        return const GameItemWidget(
          isVerticalItem: true,
        );
      },
    );
  }
}

class GameItemWidget extends StatelessWidget {
  const GameItemWidget({
    super.key,
    this.isVerticalItem = false,
  });

  final bool isVerticalItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.w),
              child: Image.asset(
                "assets/images/dialog-close.webp",
                width: isVerticalItem ? 225.w : 180.w,
                height: 180.w,
                color: Colors.grey,
                fit: BoxFit.fill,
                colorBlendMode: BlendMode.src,
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Image.asset(
                "assets/images/game_heart.webp",
                width: 35.w,
              ),
            ),
          ],
        ),
        SizedBox(height: 6.w),
        Text(
          "text",
          style: TextStyle(
            fontSize: 24.w,
            color: const Color(0xffcccccc),
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
