import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_comm/app/entity/game_type.dart';
import 'package:flutter_comm/app/modules/home/views/swiper_component.dart';
import 'package:flutter_comm/app/modules/home/views/swiper_component_notice.dart';
import 'package:flutter_comm/app/modules/home/views/tag_component.dart';
import 'package:flutter_comm/app/modules/login_register/views/login_regiseter_widget.dart';
import 'package:flutter_comm/app/modules/main/controllers/main_controller.dart';
import 'package:flutter_comm/app/routes/app_pages.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:marqueer/marqueer.dart';
import '../../../../globe_controller.dart';
import '../../../../http/comm_request.dart';
import '../../../../util/app_util.dart';
import '../../../../util/text_util.dart';
import '../../../../widget/back_event_interceptor.dart';
import '../../../app_style.dart';
import '../../../component/app_button.dart';
import '../../home_menu/views/home_menu_view.dart';
import '../controllers/home_controller.dart';
import 'game_type_list.dart';
import 'game_type_title_bar.dart';
import 'last_win_widget.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  @override
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 0,
        titleSpacing: 0,
        toolbarHeight: 110.w,
        title: HomeHeader(),
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
                padding: EdgeInsets.zero,
                controller: controller.scrollController,
                physics: const BouncingScrollPhysics(),
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
        Container(
          width: double.infinity,
          height: 280.w,
          child: SwiperComponent(
            radius: 0,
          ),
        ),
        HomeMarquee(),
        HomeGameTypesWidget(),
        Obx(() {
          bool isShowRecommendGamePage = controller.selectedGameTypeIndex.value == -1;
          return isShowRecommendGamePage
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...List.generate(controller.recList.length, (index) {
                      return HorizontalGameListWidget(
                        list: controller.recList[index],
                        tabIndex: index,
                      );
                    }),
                    WinListWidget(),
                    BrandListWidget(),
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
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GameTypeTitleBar(),
                    Container(
                      margin: EdgeInsets.only(top: 27.w, left: 20.w, right: 20.w),
                      alignment: Alignment.topLeft,
                      child: HomeGameTagComponent(),
                    ),
                    VerticalGameTypeList(),
                  ],
                );
        }),
        SizedBox(height: 125.w),
      ],
    );
  }
}

class BrandListWidget extends StatelessWidget {
   BrandListWidget({
    super.key,
  });
  final HomeController controller = Get.put(HomeController());
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
              CupertinoButton(
                minSize: 0,
                padding: EdgeInsets.zero,
                onPressed: () async {
                  if(controller.csEntity.value == null){
                    await controller.requestCsData();
                  }
                  var facebook = controller.csEntity.value?.facebook ?? "-";
                  AppUtil.launch(facebook);
                },
                child: Image.asset("assets/images/index-b-f.webp", width: 76.w),
              ),
              SizedBox(width: 30.w),
              CupertinoButton(
                minSize: 0,
                padding: EdgeInsets.zero,
                onPressed: () async {
                  if(controller.csEntity.value == null){
                    await controller.requestCsData();
                  }
                  var telegram = controller.csEntity.value?.telegram ?? "-";
                  AppUtil.launch(telegram);
                },
                child: Image.asset("assets/images/index-b-t.webp", width: 76.w),
              ),
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
            child: Obx(() {
              return GridView.builder(
                  itemCount: controller.gameTypes.length,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, childAspectRatio: 2.4),
                  itemBuilder: (BuildContext context, int index) {
                    return Obx(() {
                      bool isSelected = controller.selectedGameTypeIndex.value == index;
                      GameTypeEntity gameTypeEntity = controller.gameTypes[index];
                      return CupertinoButton(
                        onPressed: () {
                          if (controller.selectedGameTypeIndex.value != index) {
                            controller.selectedGameTypeIndex.value = index;
                            controller.addPressedRecord(index);
                          }
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
                                gameTypeEntity.name,
                                style: TextStyle(color: Colors.white, fontSize: 26.w),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
                  });
            })),
      ),
    );
  }
}

class HomeMarquee extends StatelessWidget {
  HomeMarquee({
    super.key,
  });

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 40.w, left: 20.w, right: 20.w),
      height: 60.w,
      decoration: BoxDecoration(color: const Color(0xff011A51), borderRadius: BorderRadius.circular(30.w)),
      child: CupertinoButton(
        onPressed: () {
          controller.requestNotice();
          showNoticeListDialog();
        },
        minSize: 0,
        padding: EdgeInsets.zero,
        child: Row(
          children: [
            SizedBox(width: 20.w),
            Image.asset("assets/images/i-notice.webp", width: 36.w),
            Expanded(
                child: Container(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 18.w),
              child: Obx(() {
                return  Marqueer(
                    pps: 30,
                    infinity: true,
                    child: Text(
                      "${controller.showingMarqueeText.value}                        ",
                        style: TextStyle(
                         fontSize: 22.w,
                         color: Colors.white,
                       ),
                      )
                );
              }),
            )),
          ],
        ),
      ),
    );
  }
}

class HomeHeader extends StatelessWidget {
  HomeHeader({
    super.key,
  });

  final GlobeController globeController = Get.find<GlobeController>();
  final angel = 0.0.obs;
  final isEnd = true.obs;

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
          Obx(() {
            var userInfo = globeController.balance.value;
            return userInfo == null
                ? AppButton(
                    width: 350.w,
                    height: 60.w,
                    radius: 30.w,
                    text: 'Registar Conta',
                    onClick: () {
                      showLoginRegisterDialog();
                    },
                  )
                : Container(
                    width: 350.w,
                    height: 60.w,
                    decoration: BoxDecoration(
                        gradient: btnLinearBg,
                        borderRadius: BorderRadius.circular(30.w),
                        border: Border.all(color: const Color(0x66335a94), width: 1.w)),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CupertinoButton(
                          onPressed: () {
                            if (isEnd.value) {
                              isEnd.value = false;
                              angel.value += 1;
                              requestCommBalance();
                            }
                          },
                          minSize: 0,
                          padding: EdgeInsets.zero,
                          child: Padding(
                            padding: EdgeInsets.only(left: 20.w, top: 10.w, bottom: 10.w, right: 0.w),
                            child: Obx(() {
                              return AnimatedRotation(
                                turns: angel.value,
                                duration: const Duration(milliseconds: 600),
                                onEnd: () {
                                  isEnd.value = true;
                                },
                                child: Image.asset("assets/images/refresher_balance.webp", width: 36.w),
                              );
                            }),
                          ),
                        ),
                        Text(
                          AppUtil.amountFormat(globeController.balance.value?.brl ?? '0'),
                          style: TextStyle(fontSize: 26.w, color: Colors.white, fontWeight: FontWeight.w400),
                        ),
                        AppButton(
                          width: 121.w,
                          height: 60.w,
                          radius: 30.w,
                          text: 'Conta',
                          onClick: () {
                            MainController mainController = Get.find<MainController>();
                            mainController.changeSelectedTab(2);
                          },
                        )
                      ],
                    ),
                  );
          }),
          SizedBox(width: 26.w),
          CupertinoButton(
            onPressed: () {
              if (globeController.isLogin()) {
                Get.toNamed(Routes.NOTICE_LIST);
              } else {
                showLoginRegisterDialog();
              }
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
