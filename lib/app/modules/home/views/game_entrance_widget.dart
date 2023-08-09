import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_comm/app/component/app_button.dart';
import 'package:flutter_comm/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../../../../globe_controller.dart';
import '../../../entity/game_item.dart';
import '../../login_register/views/login_regiseter_widget.dart';
import '../controllers/game_list_requests.dart';
import 'game_type_list.dart';

class GameEntranceWidget extends StatelessWidget {
   GameEntranceWidget({
    super.key,
    required this.gameEntity,
  });

  final GameEntity gameEntity;
  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: SafeArea(
        child: Container(
          width: double.infinity,
          height: 440.w,
          padding: EdgeInsets.only(top: 32.w),
          decoration: BoxDecoration(
            color: const Color(0xff011A51),
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.w)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16.w),
                    child: CachedNetworkImage(
                      width: 270.w,
                      height: 270.w,
                      fit: BoxFit.cover,
                      imageUrl: getRealImageUrl(gameEntity),
                    ),
                  ),
                  SizedBox(
                    width: 32.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 400.w,
                        alignment: Alignment.topRight,
                        child: CupertinoButton(
                          onPressed: () {
                            Get.back();
                          },
                          minSize: 0,
                          padding: EdgeInsets.only(left: 10.w, right: 10.w),
                          child: Image.asset("assets/images/close2.webp", width: 34.w),
                        ),
                      ),
                      SizedBox(
                        width: 400.w,
                        child: Text(
                          gameEntity.brAlias,
                          maxLines: 2,
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            fontSize: 32.w,
                            color: const Color(0xffffffff),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.w, bottom: 10.w),
                        child: Text(
                          gameEntity.getPlatformName(controller.navItemList),
                          style: TextStyle(
                            fontSize: 32.w,
                            color: const Color.fromRGBO(255, 255, 255, 0.6),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      CupertinoButton(
                        onPressed: () async {
                          bool isFav = gameEntity.isRxFav.value;
                          HomeController homeController =  Get.find<HomeController>();
                          if (isFav) {
                            await requestDelFav(gameEntity);
                            if(homeController.selectedGameTypeIndex.value == 1){
                              homeController. requestTabPageData(homeController.selectedGameTypeIndex.value);
                            }
                          } else {
                            await requestAddFav(gameEntity, ty: homeController.getInsertFavTy(gameEntity.listItemIndex));
                          }

                        },
                        minSize: 0,
                        padding: EdgeInsets.only(right: 10.w, top: 10.w, bottom: 10.w),
                        child: Obx(() {
                          bool isFav = gameEntity.isRxFav.value;
                          String name = isFav ? "game_item_fav_ok" : "game_item_fav_no";
                          return Image.asset(
                            "assets/images/$name.webp",
                            width: 35.w,
                          );
                        }),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 22.w,
              ),
              AppButton(
                width: 721.w,
                height: 90.w,
                text: 'Modo real',
                onClick: () {
                  startGame(platformId: gameEntity.platformId, gameId: gameEntity.gameId, brAlias: gameEntity.brAlias, isFromDialog: true);
                },
                radius: 100.w,
              ),
            ],
          ),
        ),
      ),
    );
  }


}

void showGameEntranceDialog(GameEntity gameEntity) {
  Get.dialog(
      GameEntranceWidget(
        gameEntity: gameEntity,
      ),
      barrierDismissible: true
    //  barrierColor: const Color.fromRGBO(0, 0, 0, 0.7),
  );

}

Future<void> startGame({required platformId, required gameId,required brAlias, bool isFromDialog=false}) async {
  GlobeController globeController = Get.find<GlobeController>();
  if (globeController.isLogin()) {
    await requestEnterGame(platformId: platformId, gameId: gameId, brAlias: brAlias, isFromDialog: isFromDialog);
  } else {
    showLoginRegisterDialog();
  }
}
