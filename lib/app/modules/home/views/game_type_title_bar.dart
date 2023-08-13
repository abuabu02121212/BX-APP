import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_comm/app/modules/login_register/views/login_regiseter_widget.dart';
import 'package:flutter_comm/globe_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'game_search_dialog.dart';

class GameTypeTitleBar extends StatelessWidget {
  GameTypeTitleBar({super.key, this.listItemIndex = 0, required this.typeName});

  final int listItemIndex;
  final String typeName;

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      //  color: Colors.blue,
      margin: EdgeInsets.only(left: 20.w, right: 20.w, bottom: listItemIndex > 0 ? 10.w : 0.w, top: 0.w),
      child: Obx(() {
        int selectedIndex = controller.selectedGameTypeIndex.value;
        return selectedIndex != 0
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    typeName,
                    style: TextStyle(
                      fontSize: 32.w,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(right: 8.w),
                      alignment: Alignment.centerRight,
                      child: Text(
                        "More",
                        style: TextStyle(fontSize: 24.w, color: const Color.fromRGBO(255, 255, 255, 0.6)),
                      ),
                    ),
                  ),
                  // Level2TypeTabs(
                  //   listItemIndex: listItemIndex,
                  //   controller: controller,
                  // )
                ],
              )
            : const SizedBox();
      }),
    );
  }
}

class Level2TypeTabs extends StatelessWidget {
  const Level2TypeTabs({
    super.key,
    required this.listItemIndex,
    required this.controller,
    this.isDisplay = false,
  });

  final int listItemIndex;
  final HomeController controller;
  final bool isDisplay;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: listItemIndex == 0 && isDisplay
          ? Obx(() {
              var typeTabIndex = controller.selectedGameTypeIndex.value;
              return Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (typeTabIndex != 0)
                    CupertinoButton(
                      onPressed: onHotClick,
                      minSize: 0,
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Obx(() {
                        String icon = controller.hotIsSelected.value ? "game_type_hot_ok" : "game_type_hot_no";
                        return Container(alignment: Alignment.center, child: Image.asset("assets/images/$icon.webp", width: 60.w));
                      }),
                    ),
                  CupertinoButton(
                    onPressed: onFavClick,
                    minSize: 0,
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Obx(() {
                      String icon = controller.favIsSelected.value ? "game_type_fav_ok" : "game_type_fav_no";
                      return Container(alignment: Alignment.center, child: Image.asset("assets/images/$icon.webp", width: 60.w));
                    }),
                  ),
                  CupertinoButton(
                    onPressed: () {
                      showSearchDialog(null);
                    },
                    minSize: 0,
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Image.asset("assets/images/game_type_search.webp", width: 60.w),
                  ),
                ],
              );
            })
          : const SizedBox(),
    );
  }

  void onHotClick() {
    controller.hotIsSelected.value = !controller.hotIsSelected.value;
    if (controller.hotIsSelected.value) {
      controller.favIsSelected.value = false;
    }
    var selectedGameTypeIndex = controller.selectedGameTypeIndex.value;
    if (selectedGameTypeIndex == 1) {
      if (controller.hotIsSelected.value) {
        controller.requestTab1HotGameList();
      } else {
        controller.requestTab1GameList();
      }
    } else {
      controller.requestTab2GameList(func: controller.hotIsSelected.value ? 1 : 0);
    }
  }

  void onFavClick() async {
    GlobeController globeController = Get.find<GlobeController>();
    if (!globeController.isLogin()) {
      showLoginRegisterDialog();
      return;
    }
    controller.favIsSelected.value = !controller.favIsSelected.value;
    if (controller.favIsSelected.value) {
      controller.hotIsSelected.value = false;
    }
    var selectedGameTypeIndex = controller.selectedGameTypeIndex.value;
    if (selectedGameTypeIndex == 0) {
      if (controller.favIsSelected.value) {
        await controller.requestTab0FavGameList();
      } else {
        await controller.requestTab0GameList();
      }
    } else if (selectedGameTypeIndex == 1) {
      if (controller.favIsSelected.value) {
        controller.requestTab1FavGameList();
      } else {
        controller.requestTab1GameList();
      }
    } else {
      controller.requestTab2GameList(func: controller.favIsSelected.value ? 2 : 0);
    }
  }
}
