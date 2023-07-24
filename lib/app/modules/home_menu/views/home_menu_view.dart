import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_comm/app/component/app_button.dart';
import 'package:flutter_comm/app/modules/main/controllers/main_controller.dart';
import 'package:flutter_comm/app/routes/app_pages.dart';
import 'package:flutter_comm/http/comm_request.dart';
import 'package:flutter_comm/util/weburl_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import 'package:get/get.dart';
import '../../../../env.dart';
import '../../../../globe_controller.dart';
import '../../../../util/Log.dart';
import '../../../../util/text_util.dart';
import '../../../app_style.dart';
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
          children: [
            Image.asset("assets/images/i-popup-btn.webp", width: 40.w),
          ],
        ),
      ),
      body: const HomeDrawerWidget(),
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
          width: 600.w,
          height: double.infinity,
          decoration: const BoxDecoration(color: Color(0xff011A51)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HeaderWidget(isLogin: isLogin),
              SizedBox(
                height: 12.w,
              ),
              ...List.generate(4, (index) => ItemType1Widget(index: index)),
              SizedBox(
                height: 26.w,
              ),
              ...List.generate(4, (index) => ItemType2Widget(index: index)),
              Padding(
                padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 30.w),
                child: Text(
                  "Copie o link e cole-o no navegador do seu computador para abri-lo em seu computador",
                  style: TextStyle(
                    fontSize: 24.w,
                    color: const Color(0xffFFD500),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: 14.w),
              const BottomCopyWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomCopyWidget extends StatelessWidget {
  const BottomCopyWidget({
    super.key,
  });

  final String text = "https://ds.lb88.com";

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 550.w,
      height: 70.w,
      decoration: BoxDecoration(
        color: const Color(0xff000A1D),
        border: Border.all(
          color: const Color.fromRGBO(255, 255, 255, 0.10),
          width: 1.w,
        ),
        borderRadius: BorderRadius.circular(8.w),
      ),
      padding: EdgeInsets.only(left: 20.w),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 24.w,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
          AppButton(
            width: 150.w,
            height: 70.w,
            radius: 8.w,
            text: 'Cópia',
            onClick: () {
              copyText(text);
            },
          )
        ],
      ),
    );
  }
}

class ItemType2Widget extends StatelessWidget {
  ItemType2Widget({
    super.key,
    required this.index,
  });

  final int index;
  final List<String> names = [
    "Bónus de Convite",
    "Jackpot de desempacotar",
    "Introdução ao nível VIP",
    "Baixar aplicativo",
  ];
  final List<String> imgList = [
    "left-activity",
    "left-chest",
    "left-vip",
    "left_message",
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        switch (index) {
          case 0:
            Get.toNamed(Routes.WEBVIEW, arguments: WebURLUtil.ACTIVITY_DETAIL_INVITE);
            break;
          case 1:
            Get.toNamed(Routes.WEBVIEW, arguments: WebURLUtil.ACTIVITY_DETAIL_REWARD_BOX);
            break;
          case 2:
            Get.back();
            MainController mainController = Get.find<MainController>();
            mainController.changeSelectedTab(3);
            break;
          case 3:
            Get.toNamed(Routes.WEBVIEW, arguments: WebURLUtil.CUSTOMER_SERVICE);
            break;
        }
      },
      minSize: 0,
      padding: EdgeInsets.only(left: 30.w),
      child: SizedBox(
        width: double.infinity,
        height: 70.w,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/${imgList[index]}.webp",
              width: 40.w,
            ),
            SizedBox(width: 20.w),
            Text(
              names[index],
              style: TextStyle(fontSize: 26.w, color: Colors.white, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemType1Widget extends StatelessWidget {
  ItemType1Widget({
    super.key,
    required this.index,
  });

  final int index;

  final List<LinearGradient> gradientList = [drawerItem1, drawerItem2, drawerItem3, drawerItem4];
  final List<String> names = [
    "Canal De Telegram",
    "Primeiro depósito +20%",
    "Recarregar Cashback +10%",
    "Recompensa de check-in",
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        switch (index) {
          case 0:
            Get.toNamed(Routes.WEBVIEW, arguments: WebURLUtil.ACTIVITY_DETAIL_TELEGRAM);
            break;
          case 1:
            Get.toNamed(Routes.WEBVIEW, arguments: WebURLUtil.ACTIVITY_DETAIL_FIRST_DEPOSIT);
            break;
          case 2:
            Get.toNamed(Routes.WEBVIEW, arguments: WebURLUtil.ACTIVITY_DETAIL_DEPOSIT_BONUS);
            break;
          case 3:
            Get.toNamed(Routes.WEBVIEW, arguments: WebURLUtil.ACTIVITY_DETAIL_CHECK_IN);
            break;
        }
      },
      minSize: 0,
      padding: EdgeInsets.zero,
      child: Container(
        width: 550.w,
        height: 72.w,
        margin: EdgeInsets.only(top: 12.w),
        padding: EdgeInsets.only(left: 32.w),
        decoration: BoxDecoration(gradient: gradientList[index]),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              names[index],
              style: TextStyle(
                fontSize: 24.w,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            index == 0
                ? Image.asset(
                    "assets/images/telegram-2.webp",
                    height: double.infinity,
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  HeaderWidget({
    super.key,
    required this.isLogin,
  });

  final GlobeController globeController = Get.find<GlobeController>();
  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isLogin
            ? Container(
                padding: EdgeInsets.only(left: 45.w, top: 36.w),
                child: Image.asset(
                  "assets/images/vip/medal-0.webp",
                  width: 132.w,
                ),
              )
            : const SizedBox(),
        isLogin
            ? Container(
                padding: EdgeInsets.only(top: 95.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CupertinoButton(
                      onPressed: () async {
                        requestUserInfo();
                        var appInfo = await EnvironmentConfig.getAppInfo();
                        Log.d(appInfo);
                      },
                      minSize: 0,
                      padding: EdgeInsets.zero,
                      child: Obx(() {
                        var avatar = globeController.userInfoEntity.value?.avatar ?? "0";
                        return Image.asset("assets/images/avatar/avatar$avatar.webp", width: 90.w);
                      }),
                    ),
                    SizedBox(height: 22.w),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Obx(() {
                          return Text(
                            globeController.userInfoEntity.value?.username ?? "",
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 26.w,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          );
                        }),
                        CupertinoButton(
                          minSize: 0,
                          padding: EdgeInsets.all(10.w),
                          onPressed: () {
                            copyText(globeController.userInfoEntity.value?.username ?? "");
                          },
                          child: Image.asset("assets/images/i-copy-white.webp", width: 25.w),
                        )
                      ],
                    ),
                    SizedBox(height: 10.w),
                  ],
                ),
              )
            : const SizedBox(),
        CupertinoButton(
          minSize: 0,
          padding: EdgeInsets.all(30.w),
          onPressed: () {
           // Get.back();
            closeHomeDrawer();
          },
          child: Image.asset(
            "assets/images/i-popup-btn.webp",
            width: 40.w,
          ),
        ),
      ],
    );
  }
}
String tagHomeDrawer = "tagHomeDrawer";
void showHomeDrawer() {
  SmartDialog.show(
    tag: tagHomeDrawer,
    keepSingle: true,
    alignment: Alignment.centerLeft,
    builder: (BuildContext context) {
      return const SafeArea(child: HomeDrawerWidget());
    },
  );
}

void closeHomeDrawer(){
  SmartDialog.dismiss(tag: tagHomeDrawer);
}
