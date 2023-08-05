import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'game_search_dialog.dart';

class GameTypeTitleBar extends StatelessWidget {
  GameTypeTitleBar({super.key, this.listItemIndex = 0, required this.typeName}) {
    controller.level2TabSelectedIndexMap.resetByPos(listItemIndex);
  }

  final int listItemIndex;
  final String typeName;

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      //  color: Colors.blue,
      margin: EdgeInsets.only(left: 20.w, right: 20.w, bottom: listItemIndex > 0 ? 20.w : 10.w, top: 10.w),
      child: Obx(() {
        int selectedIndex = controller.selectedGameTypeIndex.value;
        if (selectedIndex == 1) {
          controller.level2TabSelectedIndexMap.getIndexRxByPos(listItemIndex).value = 2;
        } else if (selectedIndex > 1) {
          controller.level2TabSelectedIndexMap.getIndexRxByPos(listItemIndex).value = 0;
        }
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
                  Level2TypeTabs(
                    listItemIndex: listItemIndex,
                    controller: controller,
                  )
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
  });

  final int listItemIndex;
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: listItemIndex == 0
          ? Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CupertinoButton(
                  onPressed: () {
                    controller.onLevel2ListItemTabSwitch(0, listItemIndex: listItemIndex);
                  },
                  minSize: 0,
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Obx(() {
                    var childTabSelectIndexRx = controller.level2TabSelectedIndexMap.getIndexRxByPos(listItemIndex);
                    String icon = childTabSelectIndexRx.value == 0 ? "game_type_hot_ok" : "game_type_hot_no";
                    return Container(alignment: Alignment.center, child: Image.asset("assets/images/$icon.webp", width: 60.w));
                  }),
                ),
                CupertinoButton(
                  onPressed: () {
                    controller.onLevel2ListItemTabSwitch(1, listItemIndex: listItemIndex);
                  },
                  minSize: 0,
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Obx(() {
                    var childTabSelectIndexRx = controller.level2TabSelectedIndexMap.getIndexRxByPos(listItemIndex);
                    String icon = childTabSelectIndexRx.value == 1 ? "game_type_fav_ok" : "game_type_fav_no";
                    return Container(alignment: Alignment.center, child: Image.asset("assets/images/$icon.webp", width: 60.w));
                  }),
                ),
                CupertinoButton(
                  onPressed: () {
                    showSearchDialog(null, listItemIndex: listItemIndex);
                  },
                  minSize: 0,
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Image.asset("assets/images/game_type_search.webp", width: 60.w),
                ),
              ],
            )
          : const SizedBox(),
    );
  }
}
