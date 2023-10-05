import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_comm/app/modules/home/views/game_search_dialog.dart';
import 'package:flutter_comm/app/modules/home/views/swiper_component_notice.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:marqueer/marqueer.dart';
import '../../../../generated/l10n.dart';
import '../../../../globe_controller.dart';
import '../../../../http/comm_request.dart';
import '../../../../util/app_util.dart';
import '../../../app_style.dart';
import '../../../component/app_button.dart';
import '../../../component/badge.dart';
import '../../../routes/app_pages.dart';
import '../../home_menu/views/home_menu_view.dart';
import '../../login_register/views/login_regiseter_widget.dart';
import '../../main/controllers/main_controller.dart';
import '../controllers/home_controller.dart';
import '../controllers/home_requests.dart';

class HomeHeader extends StatelessWidget {
  HomeHeader({
    super.key,
  });

  final GlobeController globeController = Get.find<GlobeController>();
  final HomeController homeController = Get.find<HomeController>();
  final angel = 0.0.obs;
  final isEnd = true.obs;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 110.w,
      decoration: BoxDecoration(
        color: headerBgColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CupertinoButton(
            onPressed: () {
              showHomeDrawer();
            },
            minSize: 0,
            padding: EdgeInsets.only(left: 20.w, right: 25.w, top: 16.w, bottom: 16.w),
            child: Image.asset("assets/images/i-popup-btn.webp", width: 37.w),
          ),
          Image.asset("assets/images/logo.webp", width: 105.w),
          Expanded(
              child: Container(
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(() {
                  var userInfo = globeController.balance.value;
                  return userInfo == null
                      ? const LoginRegisterBtnWidget()
                      : Container(
                          width: 350.w,
                          height: 60.w,
                          margin: EdgeInsets.only(left: 98.w),
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                            "assets/images/home_balance_bg.webp",
                          ))),
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
                              Container(
                                // color: Colors.red,
                                width: 160.w,
                                padding: EdgeInsets.only(left: 8.w),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  AppUtil.amountFormat(globeController.balance.value?.brl ?? '0'),
                                  style: TextStyle(fontSize: 26.w, color: Colors.white, fontWeight: FontWeight.w400),
                                ),
                              ),
                              AppButton(
                                width: 121.w,
                                height: 60.w,
                                radius: 30.w,
                                borderRadius: BorderRadius.horizontal(right: Radius.circular(60.w)),
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
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
                SizedBox(width: 6.w),
                CupertinoButton(
                  onPressed: () {
                    if (globeController.isLogin()) {
                      Get.toNamed(Routes.NOTICE_LIST);
                    } else {
                      showLoginRegisterDialog();
                    }
                  },
                  minSize: 0,
                  //color: Colors.pink,
                  padding: EdgeInsets.only(left: 16.w, right: 10.w, top: 10.w, bottom: 10.w),
                  child: Transform.translate(
                    offset: Offset(0, homeController.msgCount.value > 0 ? -7.w : 0),
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        Image.asset("assets/images/home_message.webp", width: 32.5.w),
                        Visibility(
                          visible: homeController.msgCount.value > 0,
                          child: Padding(
                            padding: EdgeInsets.only(left: 20.w, bottom: 16.w),
                            child: AppBadge(
                              height: 26.w,
                              bgColor: const Color(0xffFF3F40),
                              radius: 13.w,
                              horPadding: 7.w,
                              child: Text(
                                homeController.msgCount.value > 99 ? "99+" : homeController.msgCount.value.toString(),
                                style: TextStyle(
                                  fontSize: 22.w,
                                  color: const Color(0xffffffff),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
              ],
            ),
          )),
        ],
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
      margin: EdgeInsets.only(top: 0.w, left: 0.w, right: 0.w),
      height: 60.w,
      decoration: const BoxDecoration(color: Color(0xff1A1C1F)),
      child: CupertinoButton(
        onPressed: () {
          requestNotice(controller.noticeListRx, controller.showingMarqueeText);
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
                return Marqueer(
                    pps: 30,
                    infinity: true,
                    child: Text(
                      "${controller.showingMarqueeText.value}                        ",
                      style: TextStyle(
                        fontSize: 24.w,
                        color: const Color.fromRGBO(255, 255, 255, 0.5),
                      ),
                    ));
              }),
            )),
          ],
        ),
      ),
    );
  }
}

class SearchWidget extends StatelessWidget {
  SearchWidget({
    super.key,
  });

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 30.w, left: 20.w, right: 20.w),
      height: 72.w,
      decoration: BoxDecoration(color: const Color.fromRGBO(1, 26, 81, 0), borderRadius: BorderRadius.circular(30.w)),
      child: CupertinoButton(
        onPressed: () {
          showSearchDialog(null);
        },
        minSize: 0,
        padding: EdgeInsets.zero,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(100.w), border: Border.all(color: const Color.fromRGBO(4, 75, 154, 0.5), width: 1.w)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.w, right: 12.w),
                child: Image.asset("assets/images/search-1.webp", width: 27.w),
              ),
              Text(
                "To search for",
                style: TextStyle(
                  fontSize: 26.w,
                  color: const Color(0xff969799),
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HomeBottomWidget extends StatelessWidget {
  HomeBottomWidget({
    super.key,
  });

  final List<String> nameList1 = [
    S.current.Reward,
    S.current.Rebate,
    S.current.VIP,
    S.current.Agent,
    S.current.Event,
    S.current.Mission,
  ];

  final List<String> nameList2 = [
    S.current.CockFighting,
    S.current.Cards,
    S.current.Fishing,
    S.current.Slot,
    S.current.Live,
    S.current.Sports,
    S.current.Lottery,
  ];

  final List<String> nameList3 = [
    S.current.OnlineSupport,
    S.current.FeedbackRewards,
    S.current.HelpCenter,
  ];

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40.w),
      color: const Color(0xff121518),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 60.w),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitlesColumnWidget(title: S.current.Casino, names: nameList1),
                TitlesColumnWidget(title: S.current.Games, names: nameList2),
                TitlesColumnWidget(title: S.current.Support, names: nameList3),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 1.w,
            margin: EdgeInsets.only(left: 30.w, right: 30.w, top: 60.w, bottom: 60.w),
            color: const Color.fromRGBO(93, 101, 111, 0.3),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(
              4,
              (index) => CupertinoButton(
                minSize: 0,
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Image.asset(
                  "assets/images/home_bottom_app_$index.webp",
                  width: 68.w,
                ),
                onPressed: () {},
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 60.w),
            child: Text(
              S.current.home_bottom_illustrate,
              style: TextStyle(
                fontSize: 22.w,
                color: const Color(0xff5D656F),
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 1.w,
            margin: EdgeInsets.only(left: 30.w, right: 30.w, top: 45.w, bottom: 60.w),
            color: const Color.fromRGBO(93, 101, 111, 0.3),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(
              5,
              (index) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                child: Image.asset(
                  "assets/images/home_bot_game_icon_$index.webp",
                  width: 115.w,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 60.w,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(
              4,
              (index) => Image.asset(
                "assets/images/home_bot_company_icon_$index.webp",
                width: 112.w,
              ),
            ),
          ),
          SizedBox(
            height: 60.w,
          ),
          Center(
            child: Text(
              S.current.homeRights,
              style: TextStyle(
                fontSize: 22.w,
                color: const Color(0xff5D656F),
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(
            height: 120.w,
          ),
        ],
      ),
    );
  }
}

class TitlesColumnWidget extends StatelessWidget {
  const TitlesColumnWidget({
    super.key,
    required this.title,
    required this.names,
  });

  final String title;
  final List<String> names;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 24.w,
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(
          height: 11.w,
        ),
        ...List.generate(
            names.length,
            (index) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.w),
                  child: Text(
                    names[index],
                    style: TextStyle(
                      fontSize: 24.w,
                      color: const Color(0xff5D656F),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )),
      ],
    );
  }
}
