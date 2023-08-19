import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../http/api.dart';
import '../../../../util/Log.dart';
import '../../../../util/entity/entites.dart';
import '../../../../util/extensions.dart';
import '../../../component/app_empty.dart';
import '../../../entity/game_item.dart';
import '../controllers/game_list_requests.dart';
import '../controllers/home_controller.dart';

class Tab01HorizontalGameItemListWidget extends StatelessWidget {
  Tab01HorizontalGameItemListWidget({
    super.key,
    required this.list,
    required this.listItemIndex,
  }) {
    // scrollController.addListener(_scrollListener);
  }

  final HomeController controller = Get.put(HomeController());
  final int listItemIndex;
  final AppRxList<GameEntity> list;
  final List<String> titles = ["QUENTE", "DENTRO DE CASA", "SLOT", "PESCA", "PÔQUER", "ESPORTE", "AO VIVO"];
  final List<String> titles2 = ["SLOT", "PESCA", "PÔQUER", "ESPORTE", "AO VIVO"];
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      RequestResultEntity? requestResultEntity = list.other;
      bool isLastPage = requestResultEntity?.isLastPage ?? false;
      var itemCount = isLastPage ? list.length : list.length + 1;
      var tabIndex = controller.selectedGameTypeIndex.value;
      if (tabIndex == 0) {
        if (listItemIndex == 0) {
          itemCount = list.length; // 第一行不显示加载更多
        } else {
          itemCount = list.length + 1; // 其他行必须显示做跳转用
        }
      }
      if (list.isEmpty) {
        itemCount = 0;
      }
      List<String> lever2Titles = tabIndex == 0 ? titles : titles2;
      return list.isEmpty
          ? const SizedBox()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //  if (listItemIndex == 0) SizedBox(height: 20.w),
                Container(
                  width: 1.sw,
                  padding: EdgeInsets.only(left: 18.w, right: 18.w, top: 32.w, bottom: 24.w),
                  child: Row(
                    children: [
                      SizedBox(width: 2.w),
                      Text(
                        listItemIndex == -1 ? "Minha Coleção" : "",
                        style: TextStyle(fontSize: 33.w, color: Colors.white, fontWeight: FontWeight.w700, fontStyle: FontStyle.normal),
                      ),
                      SizedBox(width: 15.w),
                      Text(
                        listItemIndex >= 0 ? lever2Titles[listItemIndex].capitalizeFirstLetterOfEachWord() : "",
                        style: TextStyle(fontSize: 33.w, color: Colors.white, fontWeight: FontWeight.w700, fontStyle: FontStyle.normal),
                      ),
                      tabIndex == 0 && listItemIndex == 0
                          ? const SizedBox()
                          : Expanded(
                              child: Container(
                                width: double.infinity,
                                alignment: Alignment.centerRight,
                                child: CupertinoButton(
                                  onPressed: () {
                                    onClickMore(listItemIndex, controller);
                                  },
                                  minSize: 0,
                                  padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.w, bottom: 10.w),
                                  child: Text(
                                    "More",
                                    style: TextStyle(fontSize: 24.w, color: const Color.fromRGBO(255, 255, 255, 0.6)),
                                  ),
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.w, right: 10.w),
                  child: itemCount != 0
                      ? Container(
                          width: double.infinity,
                          height: list.length > 1 ? 572.w : 286.w,
                          child: GridView.builder(
                            itemCount: itemCount,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            controller: scrollController,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: list.length > 1 ? 2 : 1,
                              childAspectRatio: 1.39,
                              crossAxisSpacing: 12.w,
                              mainAxisSpacing: 12.w
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              bool isLoadMoreItem = list.length == index;
                              return isLoadMoreItem
                                  ? ItemMoreWidget(controller: controller, listItemIndex: listItemIndex)
                                  : GameItemWidget(
                                      isVerticalItem: false,
                                      gameEntity: list[index],
                                      controller: controller,
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
              ],
            );
    });
  }
}

void onClickMore(int listItemIndex, HomeController controller) {
  var tabIndex = controller.selectedGameTypeIndex.value;
  if (tabIndex == 0 || tabIndex == 1) {
    int tarTabIndex = tabIndex == 0 ? listItemIndex : listItemIndex + 2;
    controller.switchTabWithAddPressedRecord(tarTabIndex);
    controller.scrollController.jumpTo(0);
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
        onClickMore(listItemIndex, controller);
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
    required this.listItemIndex,
  });

  final HomeController controller;
  final bool isVerticalItem;
  final GameEntity gameEntity;
  final int listItemIndex;

  @override
  Widget build(BuildContext context) {
    String imgUrl = getRealImageUrl(gameEntity);
    if (gameEntity.brAlias.isEmpty) {
      gameEntity.brAlias = gameEntity.getPlatformName(controller.navItemList).replaceAll("Esporte ", "");
    }
    return CupertinoButton(
      onPressed: () {
        Log.d("gameEntity:${gameEntity.toJson()}");
        gameEntity.listItemIndex = listItemIndex;
        onGameItemClick(gameEntity);
      },
      minSize: 0,
      padding: EdgeInsets.zero,
      child: Container(
        decoration: BoxDecoration(color: const Color(0x800E3075), borderRadius: BorderRadius.circular(16.w)),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.w),
                  child: CachedNetworkImage(
                    width: double.infinity,
                    height: 210.w,
                    fit: BoxFit.cover,
                    imageUrl: imgUrl,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                height: double.infinity,
                width: double.infinity,
                padding: EdgeInsets.only(left: 10.w, right: 10.w),
                child: Text(
                  gameEntity.brAlias,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 24.w,
                    color: const Color.fromRGBO(255, 255, 255, 0.60),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
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
