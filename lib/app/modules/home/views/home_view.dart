import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_comm/app/modules/home/views/swiper_component.dart';
import 'package:flutter_comm/app/modules/home/views/tab_component.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import '../../../../util/toast_util.dart';
import '../../../../widget/auto_scroll.dart';
import '../../../../widget/back_event_interceptor.dart';
import '../../../../widget/single_scroll_view_marquee.dart';
import '../../../app_style.dart';
import '../../../component/app_button.dart';
import '../../forget_psw/views/forget_psw_widget.dart';
import '../../home_menu/views/home_menu_view.dart';
import '../controllers/home_controller.dart';
import 'game_type_list.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 0,
        titleSpacing: 0,
        toolbarHeight: 110.w,
        title: const HomeHeader(),
        centerTitle: true,
      ),
      body: SafeArea(
        child: BackInterceptorWidget(
          isInterceptor: (obj) {
            return controller.consumePressedRecord();
          },
          child: Center(
            child: Container(
              color: Colors.black,
              width: double.infinity,
              height: double.infinity,
              alignment: Alignment.topLeft,
              child: SingleChildScrollView(
                child: ItemGenerateWidget(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ItemGenerateWidget extends StatelessWidget {
  ItemGenerateWidget({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: double.infinity,
          height: 280.w,
          child: const SwiperComponent(
            radius: 0,
          ),
        ),
        const HomeMarquee(),
        HomeGameTypesWidget(),
        Obx(() {
          bool isShowAll = controller.selectedGameTypeIndex.value == -1;
          return isShowAll
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GameTitleBar(),
                    Container(
                      margin: EdgeInsets.only(top: 27.w, left: 20.w, right: 20.w),
                      alignment: Alignment.topLeft,
                      child: HomeGameChildTypeTabComponent(),
                    ),
                    ...List.generate(7, (index) => HorizontalGameListWidget(titleImgPath: "assets/images/index-title${index + 1}.webp")),
                    WinListWidget(),
                    const BrandListWidget(),
                    Container(
                      width: double.infinity,
                      height: 94.w,
                      decoration: const BoxDecoration(color: Color(0xff011A51)),
                      margin: EdgeInsets.only(bottom: 110.w),
                      alignment: Alignment.center,
                      child: Text(
                        "Copyright © All Rights Reserved by Luckyking",
                        style: TextStyle(
                          fontSize: 24.w,
                          color: const Color.fromRGBO(255, 255, 255, 0.60),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                )
              : const VerticalGameTypeList();
        }),
        SizedBox(height: 125.w),
      ],
    );
  }
}

class BrandListWidget extends StatelessWidget {
  const BrandListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 68.w, left: 20.w, right: 20.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Provedores de jogos", style: TextStyle(fontSize: 32.w, color: Colors.white, fontWeight: FontWeight.w700)),
          SizedBox(height: 10.w),
          Image.asset("assets/images/jobs.webp", width: 704.w),
          SizedBox(height: 24.w),
          Image.asset("assets/images/dot_line.webp", width: double.infinity),
          SizedBox(height: 30.w),
          Text("Entre em contato conosco", style: TextStyle(fontSize: 32.w, color: Colors.white, fontWeight: FontWeight.w700)),
          SizedBox(height: 10.w),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset("assets/images/index-b-f.webp", width: 76.w),
              SizedBox(width: 30.w),
              Image.asset("assets/images/index-b-t.webp", width: 76.w),
            ],
          ),
          SizedBox(height: 24.w),
          Image.asset("assets/images/dot_line.webp", width: double.infinity),
          SizedBox(height: 30.w),
          Text("Método de pagamento", style: TextStyle(fontSize: 32.w, color: Colors.white, fontWeight: FontWeight.w700)),
          SizedBox(height: 10.w),
          Image.asset("assets/images/index-b-p.webp", width: 139.w),
          SizedBox(height: 30.w),
          Image.asset("assets/images/dot_line.webp", width: double.infinity),
          SizedBox(height: 30.w),
          Text("Responsabilidade", style: TextStyle(fontSize: 32.w, color: Colors.white, fontWeight: FontWeight.w700)),
          SizedBox(height: 30.w),
          Image.asset("assets/images/index-b-r.webp", width: 92.w),
          SizedBox(height: 30.w),
          Text(
            "A LUCKYKING.com opera através de Elektra Entertainment B.V., com número de registro 157256 e domicílio social em Julianaplein 36 Willemstad, Curaçao, certificada pelo governo de Curaçao através da Licença 8048/JAZ2021-105 emitida para prestação de serviço de Cassino e apostas esportivas.",
            style: TextStyle(
              fontSize: 26.w,
              color: const Color.fromRGBO(255, 255, 255, 0.60),
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 30.w),
          BottomIconsWidget(),
          SizedBox(height: 50.w),
        ],
      ),
    );
  }
}

class BottomIconsWidget extends StatelessWidget {
  BottomIconsWidget({
    super.key,
  });

  final List<String> names = ["Safe \npayment", "24/7 \nsupport", "Mobile \nfriends", "Highest \nodds", "Multi- \ncurrency"];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
          names.length,
          (index) => Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/bottom${index + 1}.webp",
                    width: 42.w,
                  ),
                  SizedBox(height: 8.w),
                  Text(
                    names[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22.w, color: const Color(0xffCCCED2), fontWeight: FontWeight.w400),
                  ),
                ],
              )),
    );
  }
}

class WinListWidget extends StatelessWidget {
  WinListWidget({super.key});

  final HomeController controller = Get.put(HomeController());
  final AutoScrollUtil autoScrollUtil = AutoScrollUtil();

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
            child: ListView.builder(
              itemCount: 10,
              controller: autoScrollUtil.sc,
              itemBuilder: (BuildContext context, int index) {
                return Container(
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
                                "**********612",
                                maxLines: 1,
                                style: TextStyle(fontSize: 24.w, color: Colors.white, fontWeight: FontWeight.w400),
                              ),
                            ),
                            Text(
                              "Noite de Carna..ggfgfghfhg.",
                              maxLines: 1,
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
                              "R\$765",
                              style: TextStyle(fontSize: 24.w, color: Colors.white, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          )
          // Text(""),
        ],
      ),
      // child: ,
    );
  }
}

class GameTitleBar extends StatelessWidget {
  GameTitleBar({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 28.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(() {
            int selectedIndex = controller.selectedGameTypeIndex.value;
            return Text(
              selectedIndex > -1 ? controller.gameTypes[selectedIndex].replaceAll(RegExp(r'\n+'), '') : "",
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CupertinoButton(
                  onPressed: () {},
                  minSize: 0,
                  padding: EdgeInsets.zero,
                  child: Container(
                      width: 60.w,
                      height: 60.w,
                      decoration: BoxDecoration(
                        gradient: headerLinearGradient,
                        borderRadius: BorderRadius.circular(16.w),
                      ),
                      alignment: Alignment.center,
                      child: Image.asset("assets/images/i-filter1.webp", width: 32.w)),
                ),
                CupertinoButton(
                  onPressed: () {},
                  minSize: 0,
                  padding: EdgeInsets.zero,
                  child: Container(
                      width: 60.w,
                      height: 60.w,
                      decoration: BoxDecoration(
                        gradient: headerLinearGradient,
                        borderRadius: BorderRadius.circular(16.w),
                      ),
                      alignment: Alignment.center,
                      child: Image.asset("assets/images/i-filter2.webp", width: 32.w)),
                ),
                CupertinoButton(
                  onPressed: () {},
                  minSize: 0,
                  padding: EdgeInsets.zero,
                  child: Container(
                      width: 60.w,
                      height: 60.w,
                      decoration: BoxDecoration(
                        gradient: headerLinearGradient,
                        borderRadius: BorderRadius.circular(16.w),
                      ),
                      alignment: Alignment.center,
                      child: Image.asset("assets/images/i-filter3.webp", width: 32.w)),
                ),
                CupertinoButton(
                  onPressed: () {},
                  minSize: 0,
                  padding: EdgeInsets.zero,
                  child: Container(
                      width: 60.w,
                      height: 60.w,
                      decoration: BoxDecoration(
                        gradient: headerLinearGradient,
                        borderRadius: BorderRadius.circular(16.w),
                      ),
                      alignment: Alignment.center,
                      child: Image.asset("assets/images/i-filter4.webp", width: 32.w)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class HomeGameTypesWidget extends StatelessWidget {
  HomeGameTypesWidget({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 24.w, left: 20.w, right: 20.w),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.w),
        child: Container(
            width: double.infinity,
            height: 148.w,
            decoration: BoxDecoration(gradient: headerLinearGradient),
            child: GridView.builder(
                itemCount: 8,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, childAspectRatio: 2.4),
                itemBuilder: (BuildContext context, int index) {
                  return Obx(() {
                    bool isSelected = controller.selectedGameTypeIndex.value == index;
                    return CupertinoButton(
                      onPressed: () {
                        controller.selectedGameTypeIndex.value = index;
                        controller.addPressedRecord(index);
                      },
                      minSize: 0,
                      padding: EdgeInsets.zero,
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(gradient: isSelected ? activeBtnLinearGradient : null),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset("assets/images/game-tab$index.webp", width: 50.w),
                            Text(
                              controller.gameTypes[index],
                              style: TextStyle(color: Colors.white, fontSize: 26.w),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
                })),
      ),
    );
  }
}

class HomeMarquee extends StatelessWidget {
  const HomeMarquee({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 40.w, left: 20.w, right: 20.w),
      height: 60.w,
      decoration: BoxDecoration(color: const Color(0xff011A51), borderRadius: BorderRadius.circular(30.w)),
      child: Row(
        children: [
          SizedBox(width: 20.w),
          Image.asset("assets/images/i-notice.webp", width: 36.w),
          Expanded(
              child: Container(
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            child: SingleScrollViewMarquee(
              text: "Bem-vindo ao paraíso dos jogos, preparamos uma variedade de jogos populares para você ter uma experiência de jogo diferente.",
              style: TextStyle(color: const Color(0xffffffff), fontSize: 22.w),
            ),
          )),
        ],
      ),
    );
  }
}

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 110.w,
      decoration: BoxDecoration(gradient: headerLinearGradient),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CupertinoButton(
            onPressed: () {
              showHomeDrawer();
            },
            minSize: 0,
            padding: EdgeInsets.all(16.w),
            child: Image.asset("assets/images/i-popup-btn.webp", width: 40.w),
          ),
          Image.asset("assets/images/logo.webp", width: 120.w),
          SizedBox(width: 90.w),
          AppButton(
            width: 350.w,
            height: 60.w,
            radius: 30.w,
            text: 'Registar Conta',
            onClick: () {
              // Get.toNamed(Routes.LOGIN_REGISTER);
              Toast.show("按钮被点击");
            },
          ),
          SizedBox(width: 26.w),
          CupertinoButton(
            onPressed: () {
              showForgetPswDialog();
              Toast.show("按钮被点击");
            },
            minSize: 0,
            padding: EdgeInsets.all(10.w),
            child: Image.asset("assets/images/home_message.webp", width: 60.w),
          ),
        ],
      ),
    );
  }
}
