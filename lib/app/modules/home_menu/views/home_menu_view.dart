import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_comm/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_comm/app/modules/login_register/views/login_regiseter_widget.dart';
import 'package:flutter_comm/util/toast_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import 'package:get/get.dart';
import '../../../../generated/l10n.dart';
import '../../../../globe_controller.dart';
import '../../../app_style.dart';
import '../../home/views/game_type_tab_component.dart';
import '../controllers/home_menu_controller.dart';

class HomeMenuView extends GetView<HomeMenuController> {
  HomeMenuView({Key? key}) : super(key: key);

  final GlobeController globeController = Get.find<GlobeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leadingWidth: 0,
        toolbarHeight: 110.w,
        title: Stack(
          children: const [],
        ),
      ),
      body: FutureBuilder(
          future: Future.delayed(const Duration(milliseconds: 250)),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return const HomeDrawerWidget();
          }),
    );
  }
}

class HomeDrawerWidget extends StatelessWidget {
  const HomeDrawerWidget({
    super.key,
  });

  final bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: 420.w,
          height: double.infinity,
          decoration: const BoxDecoration(color: headerBgColor),
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(bottom: 120.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: CupertinoButton(
                      minSize: 0,
                      padding: EdgeInsets.all(30.w),
                      onPressed: () {
                        closeHomeDrawer();
                      },
                      child: Image.asset(
                        "assets/images/i-popup-btn.webp",
                        width: 40.w,
                      ),
                    ),
                  ),

                  //const ActivityWidget(),
                  GameTabListWidget(),
                  Container(
                    margin: EdgeInsets.only(left: 32.w, right: 32.w, top: 20.w, bottom: 20.w),
                    height: 1.w,
                    decoration: const BoxDecoration(color: Color.fromRGBO(255, 255, 255, 0.1)),
                  ),
                  OtherTabListWidget(),
                  GridView.builder(
                    itemCount: 7,
                    padding: EdgeInsets.only(left: 35.w, right: 35.w, top: 25.w),
                    physics: const NeverScrollableScrollPhysics(),
                    controller: ScrollController(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1.58, mainAxisSpacing: 18.w, crossAxisSpacing: 18.w),
                    itemBuilder: (BuildContext context, int index) {
                      return CupertinoButton(
                        minSize: 0,
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          Toast.show("$index");
                        },
                        child: Image.asset(
                          'assets/images/home_menu_icon_$index.webp',
                          width: double.infinity,
                        ),
                      );
                    },
                  ),
                  ListView.builder(
                      itemCount: 5,
                      physics: const BouncingScrollPhysics(),
                      controller: ScrollController(),
                      padding: EdgeInsets.only(left: 40.w, right: 32.w, top: 25.w),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          width: double.infinity,
                          height: 80.w,
                          child: Stack(alignment: Alignment.centerLeft,children: [
                            Image.asset("assets/images/home_menu_bot_icon_$index.webp", width: 35.w),
                            Positioned(
                                right: 0.w,
                                left: 50.w,
                                child: Text(
                                    "Service",
                                    style: TextStyle(
                                      fontSize: 26.w,
                                      color: const Color(0xff8F9DAB),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                              )
                            ],),
                        );
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class OtherTabListWidget extends StatelessWidget {
  OtherTabListWidget({super.key});

  final HomeController homeController = Get.find<HomeController>();
  final List<String> names = [
    S.current.BetRecords,
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 1,
        padding: EdgeInsets.only(left: 32.w, right: 32.w),
        physics: const NeverScrollableScrollPhysics(),
        controller: ScrollController(),
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return CupertinoButton(
            onPressed: () {
              switch (index) {
                case 0:
                  // TODO
                  closeHomeDrawer();
                  break;
              }
            },
            minSize: 0,
            padding: EdgeInsets.zero,
            child: Container(
              width: double.infinity,
              height: 82.w,
              padding: EdgeInsets.only(left: 12.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/images/home_menu_bet_record.webp", width: 26.w),
                  SizedBox(width: 38.w),
                  Text(
                    names[index],
                    style: TextStyle(
                      fontSize: 26.w,
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}

class GameTabListWidget extends StatelessWidget {
  GameTabListWidget({
    super.key,
  });

  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: gameTabNameList.length,
        physics: const NeverScrollableScrollPhysics(),
        controller: ScrollController(),
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          // GameTypeEntity entity = homeController.gameTypes[index];
          return CupertinoButton(
            onPressed: () {
              // homeController.selectedGameTypeIndex.value = index;
              homeController.switchTabWithAddPressedRecord(index);
              closeHomeDrawer();
            },
            minSize: 0,
            padding: EdgeInsets.zero,
            child: Obx(() {
              var selectedIndex = homeController.selectedGameTypeIndex.value;
              bool isSelected = selectedIndex == index;
              String imgPath = "game-tab$index";
              imgPath = "assets/images/$imgPath.webp";
              return Container(
                width: double.infinity,
                height: 84.w,
                decoration: BoxDecoration(
                  color: isSelected ? const Color(0xff3EA1F8) : Colors.transparent,
                  // borderRadius: BorderRadius.circular(12.w),
                ),
                padding: EdgeInsets.only(left: 28.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(imgPath, width: 49.w),
                    SizedBox(
                      width: 30.w,
                    ),
                    Obx(() {
                      var selectedIndex = homeController.selectedGameTypeIndex.value;
                      bool isSelected = selectedIndex == index;
                      return Text(
                        gameTabNameList[index],
                        style: TextStyle(
                          fontSize: 26.w,
                          color: const Color.fromRGBO(255, 255, 255, 1),
                          fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
                        ),
                      );
                    })
                  ],
                ),
              );
            }),
          );
        });
  }
}

// class ActivityWidget extends StatelessWidget {
//   const ActivityWidget({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.only(top: 30.w),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           CupertinoButton(
//             minSize: 0,
//             padding: EdgeInsets.zero,
//             onPressed: () {
//               Get.toNamed(Routes.WEBVIEW, arguments: WebURLUtil.ACTIVITY_DETAIL_INVITE);
//               closeHomeDrawer();
//             },
//             child: SizedBox(
//               width: 229.w,
//               height: 107.w,
//               child: Image.asset("assets/images/menu_aty_1.webp", height: double.infinity),
//             ),
//           ),
//           SizedBox(
//             width: 14.w,
//           ),
//           CupertinoButton(
//             minSize: 0,
//             padding: EdgeInsets.zero,
//             onPressed: () {
//               Get.toNamed(Routes.WEBVIEW, arguments: WebURLUtil.ACTIVITY_DETAIL_REWARD_BOX);
//               closeHomeDrawer();
//             },
//             child: SizedBox(
//               width: 229.w,
//               height: 107.w,
//               child: Image.asset("assets/images/menu_aty_2.webp", height: double.infinity),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class HeaderWidget extends StatelessWidget {
//   HeaderWidget({
//     super.key,
//   });
//
//   final GlobeController globeController = Get.find<GlobeController>();
//   final isEnd = true.obs;
//   final angel = 0.0.obs;
//
//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//       var login = globeController.userInfoEntity.value != null;
//       return login
//           ? Row(
//               mainAxisSize: MainAxisSize.max,
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   padding: EdgeInsets.only(left: 29.w, right: 22.w),
//                   margin: EdgeInsets.only(left: 32.w),
//                   width: 476.w,
//                   height: 95.w,
//                   decoration: BoxDecoration(
//                     color: const Color(0xff002F97),
//                     borderRadius: BorderRadius.circular(10.w),
//                   ),
//                   clipBehavior: Clip.none,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     mainAxisSize: MainAxisSize.min,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Transform.translate(
//                         offset: Offset(0, -10.w),
//                         child: CupertinoButton(
//                           onPressed: () async {
//                             requestUserInfo();
//                             var appInfo = await EnvironmentConfig.getAppInfo();
//                             Log.d(appInfo);
//                           },
//                           minSize: 0,
//                           padding: EdgeInsets.zero,
//                           child: Obx(() {
//                             var avatar = globeController.userInfoEntity.value?.avatar ?? "0";
//                             return Container(
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(45.w),
//                                   border: Border.all(
//                                     color: const Color(0xff47C8EF),
//                                     width: 4.w,
//                                   )),
//                               child: Image.asset(
//                                 "assets/images/avatar/avatar$avatar.webp",
//                                 width: 90.w,
//                               ),
//                             );
//                           }),
//                         ),
//                       ),
//                       SizedBox(
//                         width: 250.w,
//                         child: Align(
//                           alignment: Alignment.centerLeft,
//                           child: Container(
//                             height: 46.w,
//                             padding: EdgeInsets.only(right: 4.w),
//                             decoration: BoxDecoration(
//                               gradient: btnLinearBg,
//                               borderRadius: BorderRadius.circular(30.w),
//                               border: Border.all(color: const Color(0x66335a94), width: 1.w),
//                             ),
//                             child: Row(
//                               mainAxisSize: MainAxisSize.min,
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 CupertinoButton(
//                                   onPressed: () {
//                                     if (isEnd.value) {
//                                       isEnd.value = false;
//                                       angel.value += 1;
//                                       requestCommBalance();
//                                     }
//                                   },
//                                   minSize: 0,
//                                   padding: EdgeInsets.zero,
//                                   child: Padding(
//                                     padding: EdgeInsets.only(left: 12.w, top: 6.w, bottom: 6.w, right: 7.w),
//                                     child: Obx(() {
//                                       return AnimatedRotation(
//                                         turns: angel.value,
//                                         duration: const Duration(milliseconds: 600),
//                                         onEnd: () {
//                                           isEnd.value = true;
//                                         },
//                                         child: Image.asset("assets/images/refresher_balance.webp", height: double.infinity),
//                                       );
//                                     }),
//                                   ),
//                                 ),
//                                 Container(
//                                   constraints: BoxConstraints(maxWidth: 180.w),
//                                   child: Text(
//                                     AppUtil.amountFormat(globeController.balance.value?.brl ?? '0'),
//                                     maxLines: 1,
//                                     style: TextStyle(fontSize: 26.w, color: Colors.white, fontWeight: FontWeight.w400),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   width: 12.w,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                       Obx(() {
//                         return Image.asset(
//                           "assets/images/vip/medal-${globeController.userInfoEntity.value?.vip}.webp",
//                           width: 64.w,
//                         );
//                       }),
//                     ],
//                   ),
//                 )
//               ],
//             )
//           : const LoginRegisterBtnWidget();
//     });
//   }
// }

class LoginRegisterBtnWidget extends StatelessWidget {
  const LoginRegisterBtnWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CupertinoButton(
          onPressed: () {
            closeHomeDrawer();
            showLoginRegisterDialog();
          },
          minSize: 0,
          padding: EdgeInsets.zero,
          child: Container(
            height: 60.w,
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xffF09B1B),
              borderRadius: BorderRadius.circular(48.w),
            ),
            child: Text(
              S.current.login,
              style: TextStyle(
                fontSize: 26.w,
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 14.w,
        ),
        CupertinoButton(
          onPressed: () {
            closeHomeDrawer();
            showLoginRegisterDialog();
          },
          minSize: 0,
          padding: EdgeInsets.zero,
          child: Container(
            height: 60.w,
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xff3EA1F8),
              borderRadius: BorderRadius.circular(48.w),
            ),
            child: Text(
              S.current.register,
              style: TextStyle(
                fontSize: 26.w,
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

String tagHomeDrawer = "tagHomeDrawer";
bool isHomeDrawerShowing = false;
bool isHasLoaded = false;
void showHomeDrawer() {
  SmartDialog.show(
    tag: tagHomeDrawer,
    keepSingle: true,
    alignment: Alignment.centerLeft,
    animationTime: const Duration(milliseconds: 250),
    builder: (BuildContext context) {
      return const SafeArea(
          child: HomeDrawerWidget());
    },
  );
  isHomeDrawerShowing = true;
}

void closeHomeDrawer() {
  SmartDialog.dismiss(tag: tagHomeDrawer);
  isHomeDrawerShowing = false;
}
