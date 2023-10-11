import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../http/api.dart';
import '../../../../util/Log.dart';
import '../../../entity/game_item.dart';
import '../controllers/game_list_requests.dart';
import '../controllers/home_controller.dart';

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
    required this.gameEntity,
    this.imgHeight,
  });

//  final HomeController controller;

  final GameEntity gameEntity;
  final double? imgHeight;

  // final int listItemIndex;

  @override
  Widget build(BuildContext context) {
    String imgUrl = getRealImageUrl(gameEntity);
    // if (gameEntity.brAlias.isEmpty) {
    //   gameEntity.brAlias = gameEntity.getPlatformName(controller.navItemList).replaceAll("Esporte ", "");
    // }
    return CupertinoButton(
      onPressed: () {
        Log.d("gameEntity:${gameEntity.toJson()}");
        // gameEntity.listItemIndex = listItemIndex;
        onGameItemClick(gameEntity);
      },
      minSize: 0,
      padding: EdgeInsets.zero,
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.w),
              child: CachedNetworkImage(
                width: double.infinity,
                height: imgHeight ?? 182.w,
                fit: BoxFit.cover,
                imageUrl: imgUrl,
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(left: 10.w, right: 10.w),
                child: Text(
                  gameEntity.brAlias,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 22.w,
                    color: const Color.fromRGBO(255, 255, 255, 1),
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
