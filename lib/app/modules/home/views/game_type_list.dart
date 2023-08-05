import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../http/api.dart';
import '../../../../util/Log.dart';
import '../../../../util/entity/entites.dart';
import '../../../../util/extensions.dart';
import '../../../app_style.dart';
import '../../../entity/game_item.dart';
import '../controllers/game_list_requests.dart';
import '../controllers/home_controller.dart';

class Tab01HorizontalGameItemListWidget extends StatelessWidget {
  Tab01HorizontalGameItemListWidget({
    super.key,
    required this.list,
    required this.listItemIndex,
  }) {
    scrollController.addListener(_scrollListener);
  }

  final HomeController controller = Get.put(HomeController());
  final int listItemIndex;
  final AppRxList<GameEntity> list;
  final List<String> titles = ["QUENTE", "DENTRO DE CASA", "SLOT", "PESCA", "PÔQUER", "ESPORTE", "AO VIVO"];
  final ScrollController scrollController = ScrollController();

  //  滚动监听回调
  Future<void> _scrollListener() async {
    if (scrollController.offset >= scrollController.position.maxScrollExtent && !scrollController.position.outOfRange) {
      if (controller.selectedGameTypeIndex.value == 1) {
        await requestFavGameList(controller.tab1List[listItemIndex], ty: controller.tab1gameTypeList[listItemIndex].toString(), pageIndex: -3);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      RequestResultEntity? requestResultEntity = list.other;
      bool isLastPage = requestResultEntity?.isLastPage ?? false;
      return list.isNotEmpty
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30.w),
                Stack(
                  children: [
                  //  Image.asset("assets/images/index-title-home.webp", height: 83.w),
                    Padding(
                      padding: EdgeInsets.only(left: 20.w, top: 10.w),
                      child: Text(
                        "RECOMENDAÇÕES",
                        style: TextStyle(fontSize: 26.w, color: Colors.white, fontWeight: FontWeight.w700, fontStyle: FontStyle.normal),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.w, top: 38.w, bottom: 10.w),
                      child: Text(
                        titles[listItemIndex],
                        style: TextStyle(fontSize: 26.w, color: Colors.white, fontWeight: FontWeight.w700, fontStyle: FontStyle.normal),
                      ),
                    ),
                  ],
                ),
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
                        itemCount: isLastPage ? list.length : list.length + 1,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        controller: scrollController,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1.2),
                        itemBuilder: (BuildContext context, int index) {
                          bool isLoadMoreItem = list.length == index;
                          return isLoadMoreItem
                              ? ItemMoreWidget(controller: controller, listItemIndex: listItemIndex)
                              : GameItemWidget(
                                  isVerticalItem: false,
                                  gameEntity: list[index],
                                  index: index,
                                  controller: controller,
                                  typeName: list.strExt,
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

class ItemMoreWidget extends StatelessWidget {
  const ItemMoreWidget({
    super.key,
    required this.controller,
    required this.listItemIndex,
  });

  final HomeController controller;
  final int listItemIndex;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        if (controller.selectedGameTypeIndex.value == 0 && listItemIndex != 0) {
          controller.switchTabWithAddPressedRecord(listItemIndex);
          // controller.scrollController.jumpTo(390.w);
          controller.scrollController.jumpTo(0);
        }
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
    );
  }
}

class GameItemWidget extends StatelessWidget {
  const GameItemWidget({
    super.key,
    this.isVerticalItem = false,
    required this.gameEntity,
    this.index,
    required this.controller,
    required this.typeName,
  });

  final HomeController controller;
  final bool isVerticalItem;
  final GameEntity gameEntity;
  final int? index;
  final String? typeName;

  @override
  Widget build(BuildContext context) {
    String imgUrl = getRealImageUrl(gameEntity);
    return CupertinoButton(
      onPressed: () {
        Log.d("gameEntity:${gameEntity.toJson()}");
        onGameItemClick(gameEntity, typeName ?? "");
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
              // Positioned(
              //   top: 0,
              //   right: 0,
              //   child: CupertinoButton(
              //     onPressed: () {
              //       bool isFav = gameEntity.isRxFav.value;
              //       if (isFav) {
              //         requestDelFav(gameEntity);
              //       } else {
              //         requestAddFav(gameEntity);
              //       }
              //     },
              //     minSize: 0,
              //     padding: EdgeInsets.zero,
              //     child: Container(
              //       padding: EdgeInsets.only(left: 10.w, bottom: 10.w),
              //       //  alignment: Alignment,
              //       child: Obx(() {
              //         bool isFav = gameEntity.isRxFav.value;
              //         String name = isFav ? "game_item_fav" : "game_item_fav_not";
              //         return Image.asset(
              //           "assets/images/$name.webp",
              //           width: 35.w,
              //         );
              //       }),
              //     ),
              //   ),
              // ),
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

String getRealImageUrl(GameEntity gameEntity) {
  var imgUrl = "$baseImgUrl${gameEntity.img}";
  if (gameEntity.img.contains("https://")) {
    imgUrl = gameEntity.img;
  }
  return imgUrl;
}
