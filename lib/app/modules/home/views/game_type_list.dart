
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_comm/app/component/app_empty.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../http/api.dart';
import '../../../../util/Log.dart';
import '../../../app_style.dart';
import '../../../entity/game_item.dart';
import '../controllers/home_controller.dart';

class HorizontalGameListWidget extends StatelessWidget {
  HorizontalGameListWidget({
    super.key,
    required this.titleImgPath,
    required this.list,
    required this.tabIndex,
  });

  final HomeController controller = Get.put(HomeController());
  final int tabIndex;
  final String titleImgPath;
  final List<GameEntity> list;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return list.isNotEmpty
          ? Column(
              children: [
                SizedBox(height: 40.w),
                Image.asset(titleImgPath, height: 83.w),
                Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30.w),
                      topRight: Radius.circular(30.w),
                      bottomRight: Radius.circular(30.w),
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 540.w,
                      decoration: BoxDecoration(gradient: headerLinearGradient),
                      child: GridView.builder(
                        padding: EdgeInsets.only(top: 20.w),
                        itemCount: list.length + 1,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1.2),
                        itemBuilder: (BuildContext context, int index) {
                          bool isLast = list.length == index;
                          return isLast
                              ? CupertinoButton(
                                  onPressed: () {
                                    controller.selectedGameTypeIndex.value = tabIndex;
                                    controller.addPressedRecord(tabIndex);
                                    // controller.scrollController.jumpTo(390.w);
                                    controller.scrollController.jumpTo(0);
                                  },
                                  minSize: 0,
                                  padding: EdgeInsets.zero,
                                  child: Container(
                                    alignment: Alignment.topLeft,
                                    padding: EdgeInsets.only(left: 20.w),
                                    child: Image.asset(
                                      "assets/images/game_item_more.webp",
                                      width: 180.w,
                                    ),
                                  ),
                                )
                              : GameItemWidget(
                                  isVerticalItem: false,
                                  gameEntity: list[index],
                                  index: index,
                                  controller: controller,
                                );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            )
          : const SizedBox();
    });
  }
}

class VerticalGameTypeList extends StatelessWidget {
  VerticalGameTypeList({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isNotEmpty = controller.subTypeGameList.isNotEmpty;
      return isNotEmpty
          ? GridView.builder(
              itemCount: controller.subTypeGameList.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 20.w),
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 0.92),
              itemBuilder: (BuildContext context, int index) {
                GameEntity hotGameEntity = controller.subTypeGameList[index];
                return GameItemWidget(
                  isVerticalItem: true,
                  gameEntity: hotGameEntity,
                  index: index,
                  controller: controller,
                );
              },
            )
          : AppEmpty(
              width: double.infinity,
              height: 500.w,
              alignment: Alignment.center,
            );
    });
  }
}

class GameItemWidget extends StatelessWidget {
  const GameItemWidget({
    super.key,
    this.isVerticalItem = false,
    required this.gameEntity,
    this.index,
    required this.controller,
  });

  final HomeController controller;
  final bool isVerticalItem;
  final GameEntity gameEntity;
  final int? index;

  @override
  Widget build(BuildContext context) {
    var imgUrl = "$baseImgUrl${gameEntity.img}";
    if (index != null && index! < 10) {}
    //  Log.d("=====index:$index=========imgUrl:$imgUrl");
    return CupertinoButton(
      onPressed: () {
        Log.d("gameEntity:${gameEntity.toJson()}");
        controller.requestGameLaunch(gameEntity);
      },
      minSize: 0,
      padding: EdgeInsets.zero,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.w),
                child: CachedNetworkImage(
                  width: isVerticalItem ? 225.w : 180.w,
                  height: 180.w,
                  fit: BoxFit.cover,
                  imageUrl: imgUrl,
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: CupertinoButton(
                  onPressed: () {
                    bool isFav = gameEntity.isRxFav.value;
                    if (isFav) {
                      controller.requestDelFav(gameEntity);
                    } else {
                      controller.requestAddFav(gameEntity);
                    }
                  },
                  minSize: 0,
                  padding: EdgeInsets.zero,
                  child: Container(
                    padding: EdgeInsets.only(left: 10.w, bottom: 10.w),
                    //  alignment: Alignment,
                    child: Obx(() {
                      bool isFav = gameEntity.isRxFav.value;
                      String name = isFav ? "game_item_fav" : "game_item_fav_not";
                      return Image.asset(
                        "assets/images/$name.webp",
                        width: 35.w,
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.w),
          Container(
            padding: EdgeInsets.only(left: 20.w, right: 5.w),
            alignment: Alignment.topLeft,
            child: Text(
              gameEntity.brAlias,
              textAlign: TextAlign.start,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 24.w,
                color: const Color(0xffcccccc),
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
