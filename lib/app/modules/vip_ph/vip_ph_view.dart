import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_comm/app/app_style.dart';
import 'package:flutter_comm/util/base_appbar_ph.dart';
import 'package:flutter_comm/util/base_scaffold_ph.dart';
import 'package:flutter_comm/util/toast_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:simple_progress_indicators/simple_progress_indicators.dart';

import '../../../generated/l10n.dart';
import 'vip_ph_logic.dart';

class Vip_phPage extends StatefulWidget {
  const Vip_phPage({Key? key}) : super(key: key);

  @override
  State<Vip_phPage> createState() => _Vip_phPageState();
}

class _Vip_phPageState extends State<Vip_phPage> {
  final logic = Get.put(Vip_phLogic());
  final state = Get.find<Vip_phLogic>().state;

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldPH(
      backgroundColor: const Color(0xff1A1C1F),
      appBar: BaseAppbarPH(
        title: S.current.VIP,
        actions: [
          CupertinoButton(
              padding: EdgeInsets.fromLTRB(0, 0, 20.w, 0),
              child: Text(
                S.current.History,
                style: pubTextStyle(
                    const Color(0xFF3EA1F8), 24.sp, FontWeight.w400),
              ),
              onPressed: () => {
                    Toast.show('msg'),
                  }),
        ],
      ),
      body: Container(
        alignment: Alignment.topLeft,
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(0.w, 30.h, 0.w, 30.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 20.w, right: 20.w),
              child: Text(
                S.current.CurrentLevel,
                style: pubTextStyle(
                  const Color(0xffffffff),
                  26.sp,
                  FontWeight.w400,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 23.h, left: 20.w, right: 20.w),
              height: 170.h,
              width: double.infinity,
              decoration: pubBoxDecoration(),
              padding: EdgeInsets.fromLTRB(20.w, 0.h, 20.w, 0.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Image(
                        image:
                            const AssetImage('assets/images/user/bg_vip.webp'),
                        width: 135.w,
                      ),
                      Positioned(
                        bottom: 2.h,
                        right: 0.h,
                        left: 0.h,
                        child: Text(
                          '${S.current.VIP}1',
                          textAlign: TextAlign.center,
                          style: pubTextStyle(
                              const Color(0xffffffff), 21.sp, FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 36.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(TextSpan(children: [
                        TextSpan(
                            text: S.current.ToAchieveNextLevel,
                            style: pubTextStyle(const Color(0xff8F9DAB), 22.sp,
                                FontWeight.w400)),
                        TextSpan(
                            text: '${S.current.VIP}1',
                            style: pubTextStyle(const Color(0xff3EA1F8), 22.sp,
                                FontWeight.w700)),
                      ])),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text.rich(TextSpan(children: [
                        TextSpan(
                            text: S.current.WagerAdditional,
                            style: pubTextStyle(const Color(0xff8F9DAB), 22.sp,
                                FontWeight.w400)),
                        TextSpan(
                            text: '1000.00',
                            style: pubTextStyle(const Color(0xffffffff), 22.sp,
                                FontWeight.w700)),
                      ])),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30.h, left: 20.w, right: 20.w),
              child: Text(
                S.current.VIPLevelList,
                style: pubTextStyle(
                  const Color(0xffffffff),
                  26.sp,
                  FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: const Color(0xff3EA1F8),
              indicatorWeight: 4,
              labelColor: const Color(0xff3EA1F8),
              labelPadding: EdgeInsets.zero,
              controller: logic.tabController,
              unselectedLabelColor: const Color(0xff5D656F),
              unselectedLabelStyle:
                  TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w400),
              labelStyle:
                  TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w700),
              onTap: (index) => {
                logic.pageController.jumpToPage(index),
              },
              tabs: [
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      S.current.UpgradeBonus,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      S.current.DailyBonus,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      S.current.WeeklyBonus,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      S.current.MonthlyBonus,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.only(
                    top: 30.h, left: 20.w, right: 20.w, bottom: 120.h),
                width: double.infinity,
                color: const Color(0xff252527),
                child: PageView(
                  onPageChanged: (int index) => {
                    logic.tabController.animateTo(index),
                  },
                  controller: logic.pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    MediaQuery.removePadding(
                      removeBottom: true,
                      context: context,
                      child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (BuildContext context, int index) {
                            return index == 9
                                ? _getIllustrate()
                                : index.isEven
                                    ? Container(
                                        width: double.infinity,
                                        padding: EdgeInsets.only(
                                            left: 30.w, right: 30.w),
                                        height: 80.h,
                                        decoration: index == 0
                                            ? BoxDecoration(
                                                color: const Color(0xff1A1C1F),
                                                border: Border.all(
                                                    color: const Color.fromRGBO(
                                                        93, 101, 111, 0.40),
                                                    width: 1.w),
                                                borderRadius:
                                                    BorderRadius.circular(8.w))
                                            : BoxDecoration(
                                                color: const Color(0xff1A1C1F),
                                                borderRadius:
                                                    BorderRadius.circular(8.w)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              S.current.Level,
                                              style: pubTextStyle(
                                                  const Color(0xffffffff),
                                                  24.sp,
                                                  FontWeight.w400),
                                            ),
                                            const Expanded(child: SizedBox()),
                                            Row(
                                              children: [
                                                Text(
                                                  S.current.UpgradeNeedsWagar,
                                                  style: pubTextStyle(
                                                      const Color(0xffffffff),
                                                      24.sp,
                                                      FontWeight.w400),
                                                ),
                                                if (index == 0)
                                                  SizedBox(
                                                    width: 12.w,
                                                  ),
                                                if (index == 0)
                                                  Image(
                                                    image: const AssetImage(
                                                        'assets/images/vip/ic_prompt.webp'),
                                                    width: 24.w,
                                                  ),
                                                //
                                              ],
                                            ),
                                            const Expanded(child: SizedBox()),
                                            Text(
                                              S.current.Bonus,
                                              style: pubTextStyle(
                                                  const Color(0xffffffff),
                                                  24.sp,
                                                  FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                      )
                                    : Container(
                                        width: double.infinity,
                                        padding: EdgeInsets.only(
                                            left: 30.w, right: 30.w),
                                        height: 80.h,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Stack(
                                              children: [
                                                Image(
                                                  image: const AssetImage(
                                                      'assets/images/vip/bg_vip_1.webp'),
                                                  width: 74.w,
                                                ),
                                                Positioned(
                                                  right: 0,
                                                  left: 0,
                                                  top: 12.h,
                                                  child: Center(
                                                    child: Text(
                                                      '1',
                                                      style: pubTextStyle(
                                                          const Color(
                                                              0xffffffff),
                                                          26.sp,
                                                          FontWeight.w700),
                                                    ),
                                                  ),
                                                  // Text('1',style: pubTextStyle(Color(0xffffffff), 26.sp, FontWeight.w700),textAlign: TextAlign.center,),
                                                ),
                                              ],
                                            ),
                                            const Expanded(child: SizedBox()),
                                            Container(
                                              width: 320.w,
                                              height: 23.h,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color:
                                                        const Color(0xff07BB65),
                                                    width: 1.w),
                                                borderRadius:
                                                    BorderRadius.circular(15.r),
                                              ),
                                              child: Stack(
                                                children: [
                                                  ProgressBar(
                                                    width: 320.w,
                                                    height: 25.h,
                                                    value: 0.9,
                                                    gradient:
                                                        const LinearGradient(
                                                      begin: Alignment.topLeft,
                                                      end:
                                                          Alignment.bottomRight,
                                                      colors: [
                                                        Color(0xff07BB65),
                                                        Color(0xff07BB65)
                                                      ],
                                                    ),
                                                  ),
                                                  Center(
                                                    child: Text(
                                                        '700.00/1000.00',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: pubTextStyle(
                                                            const Color(
                                                                0xffffffff),
                                                            20.sp,
                                                            FontWeight.w400)),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const Expanded(child: SizedBox()),
                                            Text(
                                              '0.30',
                                              style: pubTextStyle(
                                                  const Color(0xffF09B1B),
                                                  24.sp,
                                                  FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                      );
                          }),
                    ),
                    const Text('data1'),
                    const Text('data2'),
                    const Text('data3'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getIllustrate() {
    return Container(
      width: 710.w,
      padding: EdgeInsets.all(30.w),
      margin: EdgeInsets.only(bottom: 30.h, top: 30.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: const Color(0xff252527),
        border: Border.all(
            color: const Color.fromRGBO(93, 101, 111, 0.40), width: 1.w),
      ),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text.rich(TextSpan(children: [
          Text(S.current.InstructionsVIPRules,
              style: pubTextStyle(
                  const Color(0xffffffff), 24.sp, FontWeight.w400,
                  height: 1.5)),
          Text(S.current.InstructionsVIPRules_1,
              style: pubTextStyle(
                  const Color(0xff8F9DAB), 24.sp, FontWeight.w400,
                  height: 1.5)),
          SizedBox(
            height: 36.h,
          ),
          Text(S.current.InstructionsVIPRules_2,
              style: pubTextStyle(
                  const Color(0xff8F9DAB), 24.sp, FontWeight.w400,
                  height: 1.5)),
          SizedBox(
            height: 36.h,
          ),
          Text(S.current.InstructionsVIPRules_3,
              style: pubTextStyle(
                  const Color(0xff8F9DAB), 24.sp, FontWeight.w400,
                  height: 1.5)),
          SizedBox(
            height: 36.h,
          ),
          Text(S.current.InstructionsVIPRules_4,
              style: pubTextStyle(
                  const Color(0xff8F9DAB), 24.sp, FontWeight.w400,
                  height: 1.5)),
          SizedBox(
            height: 36.h,
          ),
          Text(S.current.InstructionsVIPRules_5,
              style: pubTextStyle(
                  const Color(0xff8F9DAB), 24.sp, FontWeight.w400,
                  height: 1.5)),
          SizedBox(
            height: 36.h,
          ),
          Text(S.current.InstructionsVIPRules_6,
              style: pubTextStyle(
                  const Color(0xff8F9DAB), 24.sp, FontWeight.w400,
                  height: 1.5)),
          SizedBox(
            height: 36.h,
          ),
          Text(S.current.InstructionsVIPRules_7,
              style: pubTextStyle(
                  const Color(0xff8F9DAB), 24.sp, FontWeight.w400,
                  height: 1.5)),
          // ]),
          // ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<Vip_phLogic>();
    super.dispose();
  }
}
