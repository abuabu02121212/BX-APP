import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:measure_size/measure_size.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../../generated/l10n.dart';
import '../../../../util/Log.dart';
import '../../../entity/game_item.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';
import 'game_item_widget.dart';
import 'game_type_tab_component.dart';

class GameListItemWidget extends StatelessWidget {
  GameListItemWidget({super.key, required this.title, required this.index});

  final String title;
  final int index;
  final HomeController controller = Get.put(HomeController());
  final isShowLoadMore = true.obs;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: VisibilityDetector(
        key: ValueKey(index),
        onVisibilityChanged: (VisibilityInfo info) {
          if (!controller.isAutoScrolling) {
            var visiblePer = info.visibleFraction * 100;
            var size = info.size;
            var visibleBounds = info.visibleBounds;
            if (visiblePer > 60 || (index == gameTabNameList.length - 1 && visibleBounds.bottom >= size.height * 0.9)) {
              controller.gameTypeIndicatorTabController.onItemSelectChanged(index);
              controller.selectedGameTypeIndex.value = index;
            }
          }
        },
        child: MeasureSize(
          onChange: (Size size) {
            controller.gameItemHeightList[index] = size.height;
            Log.d("===MeasureSize===index:$index  size:$size");
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: CustomScrollView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Container(
                    padding: EdgeInsets.only(left: 0.w, right: 0.w, top: 28.w, bottom: 28.w),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 30.w,
                            color: const Color(0xffcccccc),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        CupertinoButton(
                          onPressed: () {
                            Get.toNamed(Routes.GAME_LIST);
                          },
                          minSize: 0,
                          padding: EdgeInsets.only(left: 10.w, top: 10.w, bottom: 10.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                S.current.All,
                                style: TextStyle(
                                  fontSize: 30.w,
                                  color: const Color(0xff3EA1F8),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(width: 16.w),
                              Image.asset(
                                "assets/images/arrow_white.webp",
                                width: 16.w,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SliverGrid.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 24.w,
                      mainAxisSpacing: 22.w,
                      childAspectRatio: 214 / 270,
                    ),
                    itemCount: 11,
                    itemBuilder: (BuildContext context, int index) {
                      return GameItemWidget(imgHeight:  214.w,gameEntity: GameEntity.fromJson({}));
                    }),
                SliverToBoxAdapter(
                  child: Obx(() {
                      return Visibility(
                        visible: isShowLoadMore.value,
                        child: CupertinoButton(
                          onPressed: () {},
                          minSize: 0,
                          padding: EdgeInsets.zero,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                S.current.DisplayingGameHint(6, 9),
                                style: TextStyle(
                                  fontSize: 22.w,
                                  color: const Color(0xff5D656F),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(height: 5.w),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    S.current.LoadMore,
                                    style: TextStyle(
                                      fontSize: 22.w,
                                      color: const Color(0xffffffff),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(width: 12.w),
                                  Image.asset("assets/images/load_more_down_arrow.png", width: 20.w),
                                ],
                              ),
                              SizedBox(height: 20.w,)
                            ],
                          ),
                        ),
                      );
                    }
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
