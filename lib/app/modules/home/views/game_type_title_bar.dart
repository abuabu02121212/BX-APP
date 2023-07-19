import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import '../../../app_style.dart';
import '../controllers/home_controller.dart';
import 'game_search_dialog.dart';

class GameTypeTitleBar extends StatelessWidget {
  GameTypeTitleBar({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 28.w),
      child: Obx(() {
        int selectedIndex = controller.selectedGameTypeIndex.value;
        return selectedIndex != 0
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(() {
                    int selectedIndex = controller.selectedGameTypeIndex.value;
                    return Text(
                      selectedIndex > -1 ? controller.gameTypes[selectedIndex].name.replaceAll(RegExp(r'\n+'), '') : "",
                      style: TextStyle(
                        fontSize: 32.w,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    );
                  }),
                  SizedBox(
                    width: 280.w,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: selectedIndex == 1 ? MainAxisAlignment.end : MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(() {
                          bool isShow = controller.selectedGameTypeIndex.value > 1;
                          return isShow
                              ? CupertinoButton(
                                  onPressed: () {
                                    onSelected(0);
                                  },
                                  minSize: 0,
                                  padding: EdgeInsets.zero,
                                  child: Container(
                                      width: 60.w,
                                      height: 60.w,
                                      decoration: BoxDecoration(
                                        gradient: controller.selectedChildTabIndex.value == 0 ? activeBtnLinearGradient : headerLinearGradient,
                                        borderRadius: BorderRadius.circular(16.w),
                                      ),
                                      alignment: Alignment.center,
                                      child: Image.asset("assets/images/i-filter1.webp", width: 32.w)),
                                )
                              : const SizedBox();
                        }),
                        Obx(() {
                          bool isShow = controller.selectedGameTypeIndex.value > 1;
                          return isShow
                              ? CupertinoButton(
                                  onPressed: () {
                                    onSelected(1);
                                  },
                                  minSize: 0,
                                  padding: EdgeInsets.zero,
                                  child: Container(
                                      width: 60.w,
                                      height: 60.w,
                                      decoration: BoxDecoration(
                                        gradient: controller.selectedChildTabIndex.value == 1 ? activeBtnLinearGradient : headerLinearGradient,
                                        borderRadius: BorderRadius.circular(16.w),
                                      ),
                                      alignment: Alignment.center,
                                      child: Image.asset("assets/images/i-filter2.webp", width: 32.w)),
                                )
                              : const SizedBox();
                        }),
                        CupertinoButton(
                          onPressed: () {
                            onSelected(2);
                          },
                          minSize: 0,
                          padding: EdgeInsets.zero,
                          child: Container(
                              width: 60.w,
                              height: 60.w,
                              decoration: BoxDecoration(
                                gradient: controller.selectedChildTabIndex.value == 2 ? activeBtnLinearGradient : headerLinearGradient,
                                borderRadius: BorderRadius.circular(16.w),
                              ),
                              alignment: Alignment.center,
                              child: Image.asset("assets/images/i-filter3.webp", width: 32.w)),
                        ),
                        Obx(() {
                          bool isShow = controller.selectedGameTypeIndex.value > 1;
                          return isShow
                              ? CupertinoButton(
                                  onPressed: () {
                                    onSelected(3);
                                  },
                                  minSize: 0,
                                  padding: EdgeInsets.zero,
                                  child: Container(
                                      width: 60.w,
                                      height: 60.w,
                                      decoration: BoxDecoration(
                                        gradient: controller.selectedChildTabIndex.value == 3 ? activeBtnLinearGradient : headerLinearGradient,
                                        borderRadius: BorderRadius.circular(16.w),
                                      ),
                                      alignment: Alignment.center,
                                      child: Image.asset("assets/images/i-filter4.webp", width: 32.w)),
                                )
                              : const SizedBox();
                        }),
                      ],
                    ),
                  )
                ],
              )
            : const SizedBox();
      }),
    );
  }

  void onSelected(int index) {
    controller.selectedTagIndex.value = 0;
    controller.selectedChildTabIndex.value = index;
    if (index == 0) {
      controller.requestGameList();
    } else if (index == 1) {
      controller.requestHotGameList(ty: controller.getCurGameType());
    } else if (index == 2) {
      controller.requestFavGameList(ty: controller.getCurGameType());
    } else if (index == 3) {
      showSearchDialog();
      //   controller.requestGameList();
    }
  }

}
