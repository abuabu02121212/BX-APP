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
import '../../../component/app_empty.dart';
import '../../../entity/game_item.dart';
import '../controllers/game_list_requests.dart';
import '../controllers/home_controller.dart';
import 'game_type_title_bar.dart';

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
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      RequestResultEntity? requestResultEntity = list.other;
      bool isLastPage = requestResultEntity?.isLastPage ?? false;
      var itemCount = isLastPage ? list.length : list.length + 1;
      if (controller.selectedGameTypeIndex.value == 0) {
        if (listItemIndex == 0) {
          itemCount = list.length; // 第一行不显示加载更多
        }else{
          itemCount = list.length + 1; // 其他行必须显示做跳转用
        }
      }
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30.w),
          Container(
            width: 1.sw,
            padding: EdgeInsets.only(right: 18.w),
            child: Stack(
              children: [
                //  Image.asset("assets/images/index-title-home.webp", height: 83.w),
                Padding(
                  padding: EdgeInsets.only(left: 20.w, top: 10.w),
                  child: Text(
                    "RECOMENDAÇÕES".capitalizeFirstLetterOfEachWord(),
                    style: TextStyle(fontSize: 26.w, color: Colors.white, fontWeight: FontWeight.w700, fontStyle: FontStyle.normal),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w, top: 38.w, bottom: 10.w),
                  child: Text(
                    titles[listItemIndex].capitalizeFirstLetterOfEachWord(),
                    style: TextStyle(fontSize: 26.w, color: Colors.white, fontWeight: FontWeight.w700, fontStyle: FontStyle.normal),
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Level2TypeTabs(
                    listItemIndex: listItemIndex,
                    controller: controller,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30.w),
                topRight: Radius.circular(30.w),
                bottomRight: Radius.circular(30.w),
              ),
              child: itemCount != 0
                  ? Container(
                      width: double.infinity,
                      height: 540.w,
                      decoration: BoxDecoration(gradient: headerLinearGradient),
                      child: GridView.builder(
                        padding: EdgeInsets.only(top: 20.w),
                        itemCount: itemCount,
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
                                  controller: controller,
                                  typeName: list.strExt,
                                  listItemIndex: listItemIndex,
                                );
                        },
                      ),
                    )
                  : AppEmpty(
                      width: double.infinity,
                      height: 400.w,
                      alignment: Alignment.center,
                    ),
            ),
          ),
        ],
      );
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
        if (controller.selectedGameTypeIndex.value == 0) {
          controller.switchTabWithAddPressedRecord(listItemIndex);
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
    required this.controller,
    required this.typeName,
    required this.listItemIndex,
  });

  final HomeController controller;
  final bool isVerticalItem;
  final GameEntity gameEntity;
  final String? typeName;
  final int listItemIndex;

  @override
  Widget build(BuildContext context) {
    String imgUrl = getRealImageUrl(gameEntity);
    return CupertinoButton(
      onPressed: () {
        Log.d("gameEntity:${gameEntity.toJson()}");
        gameEntity.listItemIndex = listItemIndex;
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
                  width: isVerticalItem ? 220.w : 180.w,
                  height: 180.w,
                  fit: BoxFit.cover,
                  imageUrl: imgUrl,
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

String getRealImageUrl(GameEntity gameEntity) {
  var imgUrl = "$baseImgUrl${gameEntity.img}";
  if (gameEntity.img.contains("https://")) {
    imgUrl = gameEntity.img;
  }
  return imgUrl;
}
