import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:measure_size/measure_size.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../../util/Log.dart';
import '../controllers/home_controller.dart';
import 'game_type_tab_component.dart';

class GameListItemWidget extends StatelessWidget {
  GameListItemWidget({super.key, required this.title, required this.index});

  final String title;
  final int index;
  final HomeController controller = Get.put(HomeController());

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
                    padding: EdgeInsets.only(left: 0.w, right: 0.w, top: 38.w, bottom: 38.w),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 30.w,
                        color: const Color(0xffcccccc),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                SliverGrid.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 12.w,
                      childAspectRatio: 0.703,
                    ),
                    itemCount: 11,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 214.w,
                            padding: EdgeInsets.only(left: 0.w, right: 0.w, top: 0.w, bottom: 0.w),
                            decoration: BoxDecoration(
                              color: const Color(0xffcccccc),
                              borderRadius: BorderRadius.circular(12.w),
                              border: Border.all(color: const Color(0xff000000), width: 1.w),
                            ),
                            child: const SizedBox(),
                          ),
                          Padding(
                            padding: EdgeInsets.all(16.w),
                            child: Text(
                              "Game Name",
                              style: TextStyle(
                                fontSize: 24.w,
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          )
                        ],
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
