import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_comm/app/modules/home/views/swiper_component.dart';
import 'package:flutter_comm/app/modules/home/views/tab_component.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../../util/toast_util.dart';
import '../../../../widget/single_scroll_view_marquee.dart';
import '../../../app_style.dart';
import '../../../component/app_button.dart';
import '../controllers/home_controller.dart';

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
        child: Center(
          child: Container(
            color: Colors.black,
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.topLeft,
            child: ListView.builder(
              itemCount: itemWidgetList.length,
              cacheExtent: 1334.w * 3,
              itemBuilder: (BuildContext context, int index) {
                return itemWidgetList[index];
              },
            ),
          ),
        ),
      ),
    );
  }
}

List<Widget> itemWidgetList = [
  SizedBox(
    width: double.infinity,
    height: 280.w,
    child: const SwiperComponent(
      radius: 0,
    ),
  ),
  const HomeMarquee(),
  HomeGameTypesWidget(),
  GameTitleBar(),
  Container(
    margin: EdgeInsets.only(top: 27.w, left: 20.w, right: 20.w),
    alignment: Alignment.topLeft,
    child: HomeGameChildTypeTabComponent(),
  ),
  ...List.generate(7, (index) => GameListWidget(titleImgPath: "assets/images/index-title${index + 1}.webp")),
];

class GameListWidget extends StatelessWidget {
  GameListWidget({
    super.key,
    required this.titleImgPath,
  });

  final HomeController controller = Get.put(HomeController());
  final String titleImgPath;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 40.w),
        Image.asset(titleImgPath, height: 83.w),
        Container(
          margin: EdgeInsets.only(top: 0.w, left: 20.w, right: 20.w),
          width: double.infinity,
          height: 520.w,
          decoration: BoxDecoration(
              gradient: headerLinearGradient,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30.w),
                topRight: Radius.circular(30.w),
                bottomRight: Radius.circular(30.w),
              )),
          child: GridView.builder(
            itemCount: 20,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1.2),
            itemBuilder: (BuildContext context, int index) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16.w),
                        child: Image.asset(
                          "assets/images/dialog-close.webp",
                          width: 180.w,
                          height: 180.w,
                          color: Colors.grey,
                          colorBlendMode: BlendMode.src,
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Image.asset(
                          "assets/images/game_heart.webp",
                          width: 35.w,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6.w),
                  Text(
                    "text",
                    style: TextStyle(
                      fontSize: 24.w,
                      color: const Color(0xffcccccc),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
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
            return Text(
              controller.gameTypes[controller.selectedGameTypeIndex.value].replaceAll(RegExp(r'\n+'), ''),
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
                        Toast.show("$index");
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
            onPressed: () {},
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
              Toast.show("按钮被点击");
            },
          ),
          SizedBox(width: 26.w),
          CupertinoButton(
            onPressed: () {},
            minSize: 0,
            padding: EdgeInsets.all(10.w),
            child: Image.asset("assets/images/home_message.webp", width: 60.w),
          ),
        ],
      ),
    );
  }
}
