import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../util/Log.dart';
import '../../../app_style.dart';
import '../../../entity/hot_game.dart';
import '../controllers/home_controller.dart';

class HorizontalGameListWidget extends StatelessWidget {
  const HorizontalGameListWidget({
    super.key,
    required this.titleImgPath,
    required this.list,
  });

  final String titleImgPath;
  final List<HotGameEntity> list;

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
          child: Obx(() {
            return GridView.builder(
              itemCount: list.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1.2),
              itemBuilder: (BuildContext context, int index) {
                HotGameEntity hotGameEntity = list[index];
                return GameItemWidget(
                  isVerticalItem: false,
                  hotGameEntity: hotGameEntity,
                  index: index,
                );
              },
            );
          }),
        ),
      ],
    );
  }
}

class VerticalGameTypeList extends StatelessWidget {
  VerticalGameTypeList({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GridView.builder(
        itemCount: controller.hotGameList.length,
        shrinkWrap: true,
        padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 20.w),
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 0.92),
        itemBuilder: (BuildContext context, int index) {
          HotGameEntity hotGameEntity = controller.hotGameList[index];
          return GameItemWidget(
            isVerticalItem: true,
            hotGameEntity: hotGameEntity,
            index: index,
          );
        },
      );
    });
  }
}

class GameItemWidget extends StatelessWidget {
  const GameItemWidget({
    super.key,
    this.isVerticalItem = false,
    required this.hotGameEntity,
    this.index,
  });

  final bool isVerticalItem;
  final HotGameEntity hotGameEntity;
  final int? index;

  @override
  Widget build(BuildContext context) {
    var imgUrl = "https://brazil-banner-test.s3.ap-east-1.amazonaws.com${hotGameEntity.img}";
    if (index != null && index! < 10) {}
    Log.d("=====index:$index=========imgUrl:$imgUrl");
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.w),
              child: CachedNetworkImage(
                width: isVerticalItem ? 225.w : 180.w,
                height: 180.w,
                fit: BoxFit.fill,
                imageUrl: imgUrl,
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
        SizedBox(height: 10.w),
        Text(
          hotGameEntity.brAlias,
          textAlign: TextAlign.start,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
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
