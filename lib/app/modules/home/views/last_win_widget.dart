import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import '../../../../util/Log.dart';
import '../../../../widget/auto_scroll.dart';
import '../../../app_style.dart';
import '../../../entity/last_win.dart';
import '../controllers/home_controller.dart';
import 'game_entrance_widget.dart';

class WinListWidget extends StatelessWidget {
  WinListWidget({super.key});

  final HomeController controller = Get.put(HomeController());
  final AutoScrollUtil autoScrollUtil = AutoScrollUtil(scrollSpeed: 40);
  final isPressed = false.obs;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 890.w,
      margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 80),
      padding: EdgeInsets.only(bottom: 20.w, left: 20.w, right: 20.w),
      decoration: BoxDecoration(gradient: headerLinearGradient, borderRadius: BorderRadius.circular(30.w)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Transform.translate(offset: Offset(0, -40.w), child: Image.asset("assets/images/win.webp", width: 234.w)),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("LATEST", style: TextStyle(fontSize: 64.w, color: const Color(0xffA926FF), fontWeight: FontWeight.w400)),
                  Transform.translate(
                      offset: Offset(0, -15.w),
                      child: Text("WINNER", style: TextStyle(fontSize: 64.w, color: Colors.white, fontWeight: FontWeight.w400))),
                ],
              )
            ],
          ),
          Expanded(
            child: Obx(() {
              var length = controller.lastWinListRx.length;
                return Listener(
                  onPointerDown: (e){
                    isPressed.value = true;
                  },
                  onPointerUp: (e) async {
                    await Future.delayed(const Duration(microseconds: 250));
                    isPressed.value = false;
                  },
                  child: Obx(() {
                    var scrollController = isPressed.value ? ScrollController(initialScrollOffset: autoScrollUtil.sc.offset) : autoScrollUtil.sc;
                      return ListView.builder(
                        itemCount:  length * 3,
                        controller: scrollController,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          final itemIndex = index % length;
                          LastWinEntity item = controller.lastWinListRx[itemIndex];
                          return CupertinoButton(
                            onPressed: () {
                              Log.d2("LastWinEntity: ${item.toJson()}");
                              startGame(platformId: item.platform_id, gameId: item.game_id, brAlias: item.game_name);
                            },
                            minSize: 0,
                            padding: EdgeInsets.zero,
                            child: Container(
                              width: double.infinity,
                              height: 110.w,
                              padding: EdgeInsets.only(left: 25.w),
                              margin: EdgeInsets.only(bottom: 16.w),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.w), color: const Color.fromRGBO(0, 10, 29, 0.25)),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/images/i-win.webp",
                                    width: 55.w,
                                  ),
                                  SizedBox(width: 12.w),
                                  SizedBox(
                                    width: 195.w,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 195.w,
                                          child: Text(
                                            item.uid,
                                            maxLines: 1,
                                            style: TextStyle(fontSize: 24.w, color: Colors.white, fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                        Text(
                                          item.game_name,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontSize: 26.w, color: const Color(0xffFDD82A), fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.bottomCenter,
                                    padding: EdgeInsets.only(bottom: 16.w),
                                    margin: EdgeInsets.only(left: 10.w),
                                    child: Image.asset(
                                      "assets/images/i-win-play.webp",
                                      width: 44.w,
                                    ),
                                  ),
                                  Container(
                                    width: 270.w,
                                    height: 48.w,
                                    margin: EdgeInsets.only(left: 27.w),
                                    padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 4.w),
                                    decoration: BoxDecoration(
                                      color: const Color(0xff17181B),
                                      borderRadius: BorderRadius.circular(24.w),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          "assets/images/i-win-m.webp",
                                          width: 36.w,
                                        ),
                                        Text(
                                          "R\$${item.amount}",
                                          style: TextStyle(fontSize: 24.w, color: Colors.white, fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                  ),
                );
              }
            ),
          )
          // Text(""),
        ],
      ),
      // child: ,
    );
  }
}