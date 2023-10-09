import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_comm/app/app_style.dart';
import 'package:flutter_comm/app/modules/promotion_ph/promotion_ph_event.dart';
import 'package:flutter_comm/app/modules/promotion_ph/promotion_ph_logic.dart';
import 'package:flutter_comm/util/toast_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:simple_progress_indicators/simple_progress_indicators.dart';

import '../../../generated/l10n.dart';

class PromotionPHPage extends StatefulWidget {
  const PromotionPHPage({Key? key}) : super(key: key);

  @override
  State<PromotionPHPage> createState() => _PromotionPHPageState();
}

class _PromotionPHPageState extends State<PromotionPHPage> {
  final logic = Get.put(PromotionPHLogic());
  final state = Get.find<PromotionPHLogic>().state;

  // List<String> tabNames = ["Event", "Mission", "Rebate", "Rewards"];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 2000.h,
      decoration: const BoxDecoration(
        color: Color(0xff1A1C1F),
        image: DecorationImage(
          image: AssetImage('assets/images/promotion/bg_pattern.webp'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.zero,
            height: 90.h,
            decoration: const BoxDecoration(
              color: Color(0xff1A1C1F),
            ),
            child: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: const Color(0xff3EA1F8),
              indicatorWeight: 1,
              labelColor: const Color(0xff3EA1F8),
              labelPadding: EdgeInsets.zero,
              // controller: TabController(length: 4, vsync: ),
              controller: logic.tabController,
              unselectedLabelColor: const Color(0xff8F9DAB),
              labelStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              onTap: (index) => {
                logic.pageController?.jumpToPage(index),
              },
              tabs:  [
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(S.current.Event),
                  ),
                ),
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(S.current.Mission),
                  ),
                ),
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(S.current.Rebateable),
                  ),
                ),
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(S.current.Rewards),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(
              width: double.infinity,
              child: PageView(
                onPageChanged: (int index) => {
                  logic.tabController.animateTo(index),
                },
                controller: logic.pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _getEventItem(),
                  _getMissionItem(),
                  _getRebateItem(),
                  _getRewardsItem(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getEventItem() {
    return promotionPHEvent(
      logic: logic,
      indexPase: 0,
      itemWidget: CupertinoButton(
        padding: EdgeInsets.zero,
        minSize: 0,
        child: Container(
          width: 710.w,
          height: 280.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
                color: const Color.fromRGBO(93, 101, 111, 0.40), width: 1.w),
            color: const Color(0xff1A1C1F),
          ),
          padding: EdgeInsets.only(top: 10.h, left: 10.w, right: 10.w),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: const Color(0xff252527),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 6.w),
                alignment: Alignment.centerLeft,
                height: 70.h,
                width: double.infinity,
                child: Row(
                  children: [
                    Image(
                      image: const AssetImage(
                          'assets/images/promotion/ic_clock.webp'),
                      width: 30.w,
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    Text(
                      '09/01/2023 00:00:00 - 09/27/2023 23:59:59',
                      style: TextStyle(
                          color: const Color(0xff8F9DAB),
                          fontWeight: FontWeight.w400,
                          fontSize: 26.sp),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        onPressed: () => {
          Toast.show('msg'),
        },
      ),
    );
  }

  Widget _getMissionItem() {
    return promotionPHEvent(
      logic: logic,
      indexPase: 1,
      itemWidget:
          // CupertinoButton(
          //   padding: EdgeInsets.zero,
          //   minSize: 0,
          //   child:
          Container(
        // alignment: Alignment.center,
        width: 710.w,
        height: 177.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
              color: const Color.fromRGBO(93, 101, 111, 0.40), width: 1.w),
          color: const Color(0xff1A1C1F),
        ),
        padding: EdgeInsets.all(30.w),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              alignment: Alignment.center,
              width: 100.w,
              padding: EdgeInsets.all(20.w),
              height: 100.h,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image:
                      AssetImage('assets/images/promotion/ic_circle_bg.webp'),
                ),
              ),
              child: const Image(
                  image:
                      AssetImage('assets/images/promotion/ic_telegram.webp')),
            ),
            SizedBox(
              width: 27.w,
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Binding a bank card for the first time, you can receive 0.10',
                  style: TextStyle(
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w400,
                      fontSize: 24.sp),
                ),
                Container(
                  width: 435.w,
                  height: 23.h,
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: const Color(0xff07BB65), width: 1.w),
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Stack(
                    children: [
                      ProgressBar(
                        width: 320.w,
                        height: 25.h,
                        value: 0.9,
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Color(0xff07BB65), Color(0xff07BB65)],
                        ),
                      ),
                      Center(
                        child: Text('700.00/1000.00',
                            textAlign: TextAlign.center,
                            style: pubTextStyle(const Color(0xffffffff), 20.sp,
                                FontWeight.w400)),
                      ),
                    ],
                  ),
                ),
              ],
            )),
            //   Image(
            //     image: const AssetImage('assets/images/left-down.webp'),
            //     width: 52.w,
            //   ),
            //   Text(
            //     'Fishing',
            //     style: TextStyle(
            //         color: const Color(0xff5D656F),
            //         fontWeight: FontWeight.w400,
            //         fontSize: 24.sp),
            //   ),

            SizedBox(
              width: 42.w,
            ),
            Container(
              padding: EdgeInsets.only(bottom: 7.h),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                      onPressed: () => {Toast.show('msg')},
                      child: Container(
                        alignment: Alignment.center,
                        width: 160.w,
                        height: 60.h,
                        decoration: BoxDecoration(
                            color: const Color(0xff3EA1F8),
                            borderRadius: BorderRadius.circular(30.h)),
                        child: Text(
                          S.current.Go,
                          style: pubTextStyle(
                              const Color(0xffffffff), 26.sp, FontWeight.w700),
                        ),
                      )),
                  const Expanded(child: SizedBox()),
                  // Text('data')
                  SizedBox(
                    width: 160.w,
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Image(
                              image: const AssetImage(
                                  'assets/images/promotion/ic_money_p.webp'),
                              width: 22.w,
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Text(
                              '0.20',
                              style: pubTextStyle(const Color(0xffF09B1B),
                                  24.sp, FontWeight.w400),
                            ),
                          ],
                        ),
                        const Expanded(child: SizedBox()),
                        Row(
                          children: [
                            Image(
                              image: const AssetImage(
                                  'assets/images/promotion/ic_lightning.webp'),
                              width: 22.w,
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Text(
                              '0',
                              style: pubTextStyle(const Color(0xff07BB65),
                                  24.sp, FontWeight.w400),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // ],
            // ),
          ],
        ),
      ),
      // onPressed: () => {
      //   Toast.show('msg'),
      // },
      // ),
    );
  }

  Widget _getRebateItem() {
    return promotionPHEvent(
      logic: logic,
      indexPase: 2,
      itemWidget: CupertinoButton(
        padding: EdgeInsets.zero,
        minSize: 0,
        child: Container(
          width: 710.w,
          height: 130.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
                color: const Color.fromRGBO(93, 101, 111, 0.40), width: 1.w),
            color: const Color(0xff1A1C1F),
          ),
          padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: const AssetImage(
                      'assets/images/promotion/ic_jili.webp',
                    ),
                    width: 59.w,
                  ),
                  Text(
                    S.current.JILI,
                    style: TextStyle(
                        color: const Color(0xff5D656F),
                        fontWeight: FontWeight.w400,
                        fontSize: 22.sp),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.current.ValidBets,
                    style: TextStyle(
                        color: const Color(0xff8F9DAB),
                        fontWeight: FontWeight.w400,
                        fontSize: 22.sp),
                  ),
                  SizedBox(
                    height: 11.h,
                  ),
                  Text(
                    S.current.Rebateable,
                    style: TextStyle(
                        color: const Color(0xff8F9DAB),
                        fontWeight: FontWeight.w400,
                        fontSize: 22.sp),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '0.00',
                    style: TextStyle(
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w700,
                        fontSize: 22.sp),
                  ),
                  SizedBox(
                    height: 11.h,
                  ),
                  Text(
                    '0.00',
                    style: TextStyle(
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w700,
                        fontSize: 22.sp),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.current.Ratio,
                    style: TextStyle(
                        color: const Color(0xff8F9DAB),
                        fontWeight: FontWeight.w400,
                        fontSize: 22.sp),
                  ),
                  SizedBox(
                    height: 11.h,
                  ),
                  Text(
                    S.current.NextRatio,
                    style: TextStyle(
                        color: const Color(0xff8F9DAB),
                        fontWeight: FontWeight.w400,
                        fontSize: 22.sp),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '0.00',
                    style: TextStyle(
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w700,
                        fontSize: 22.sp),
                  ),
                  SizedBox(
                    height: 11.h,
                  ),
                  Text(
                    '0.00',
                    style: TextStyle(
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w700,
                        fontSize: 22.sp),
                  ),
                ],
              ),
              Image(
                image: const AssetImage('assets/images/user/ic_arrow_ash.webp'),
                width: 11.5.w,
                height: 20.h,
              ),
            ],
          ),
        ),
        onPressed: () => {
          Toast.show('msg'),
        },
      ),
    );
  }

  Widget _getRewardsItem() {
    return promotionPHEvent(
      logic: logic,
      indexPase: 3,
      itemWidget: CupertinoButton(
        padding: EdgeInsets.zero,
        minSize: 0,
        child: Container(
          width: 710.w,
          height: 130.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
                color: const Color.fromRGBO(93, 101, 111, 0.40), width: 1.w),
            color: const Color(0xff1A1C1F),
          ),
          padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image(
                image: const AssetImage('assets/images/left-down.webp'),
                width: 52.w,
              ),
              Text(
                S.current.finishing,
                style: TextStyle(
                    color: const Color(0xff5D656F),
                    fontWeight: FontWeight.w400,
                    fontSize: 24.sp),
              ),
            ],
          ),
        ),
        onPressed: () => {
          Toast.show('msg'),
        },
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<PromotionPHLogic>();
    super.dispose();
  }
}
