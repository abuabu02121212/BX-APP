import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_comm/app/app_style.dart';
import 'package:flutter_comm/util/base_appbar_ph.dart';
import 'package:flutter_comm/util/base_scaffold_ph.dart';
import 'package:flutter_comm/util/size.dart';
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
              padding: EdgeInsets.fromLTRB(0, 0, 20.px, 0),
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
        height: double.infinity,
        // margin: EdgeInsets.only(bottom: 180.px),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                controller: ScrollController(),
                // primary: true,
                child: Container(
                  alignment: Alignment.topLeft,
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(0.px, 30.px, 0.px, 30.px),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20.px, right: 20.px),
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
                        margin: EdgeInsets.only(
                            top: 23.px, left: 20.px, right: 20.px),
                        height: 170.px,
                        width: double.infinity,
                        decoration: pubBoxDecoration(),
                        padding: EdgeInsets.fromLTRB(20.px, 0.px, 20.px, 0.px),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Stack(
                              children: [
                                Image(
                                  image: const AssetImage(
                                      'assets/images/user/bg_vip.webp'),
                                  width: 135.px,
                                ),
                                Positioned(
                                  bottom: 2.px,
                                  right: 0.px,
                                  left: 0.px,
                                  child: Text(
                                    '${S.current.VIP}1',
                                    textAlign: TextAlign.center,
                                    style: pubTextStyle(const Color(0xffffffff),
                                        21.sp, FontWeight.w700),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 36.px,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text.rich(TextSpan(children: [
                                  TextSpan(
                                      text: S.current.ToAchieveNextLevel,
                                      style: pubTextStyle(
                                          const Color(0xff8F9DAB),
                                          22.sp,
                                          FontWeight.w400)),
                                  TextSpan(
                                      text: '${S.current.VIP}1',
                                      style: pubTextStyle(
                                          const Color(0xff3EA1F8),
                                          22.sp,
                                          FontWeight.w700)),
                                ])),
                                SizedBox(
                                  height: 10.px,
                                ),
                                Text.rich(TextSpan(children: [
                                  TextSpan(
                                      text: S.current.WagerAdditional,
                                      style: pubTextStyle(
                                          const Color(0xff8F9DAB),
                                          22.sp,
                                          FontWeight.w400)),
                                  TextSpan(
                                      text: '1000.00',
                                      style: pubTextStyle(
                                          const Color(0xffffffff),
                                          22.sp,
                                          FontWeight.w700)),
                                ])),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: 30.px, left: 20.px, right: 20.px),
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
                        height: 15.px,
                      ),
                      TabBar(
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicatorColor: const Color(0xff3EA1F8),
                        indicatorWeight: 2,
                        labelColor: const Color(0xff3EA1F8),
                        labelPadding: EdgeInsets.zero,
                        controller: logic.tabController,
                        unselectedLabelColor: const Color(0xff5D656F),
                        unselectedLabelStyle: TextStyle(
                            fontSize: 28.sp, fontWeight: FontWeight.w400),
                        labelStyle: TextStyle(
                            fontSize: 28.sp, fontWeight: FontWeight.w700),
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
                      // Expanded(
                      //   flex: 1,
                      //   child:
                      Container(
                        height: ((8 * 80) + 30).px,
                        padding: EdgeInsets.only(
                            top: 30.px,
                            left: 20.px,
                            right: 20.px,
                            bottom: 0.px),
                        // width: double.infinity,
                        color: const Color(0xff252527),
                        // color:  Colors.tealAccent,
                        child: PageView(
                          onPageChanged: (int index) => {
                            logic.tabController.animateTo(index),
                          },
                          controller: logic.pageController,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            MediaQuery.removePadding(
                              removeBottom: true,
                              removeTop: true,
                              context: context,
                              child: SizedBox(
                                height: 8 * 80,
                                child: ListView.builder(
                                    // shrinkWrap: true,
                                    itemCount: 8,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return index.isEven
                                          ? Container(
                                              // width: double.infinity,
                                              padding: EdgeInsets.only(
                                                  left: 30.px, right: 30.px),
                                              height: 80.px,
                                              decoration: index == 0
                                                  ? BoxDecoration(
                                                      color: const Color(
                                                          0xff1A1C1F),
                                                      border: Border.all(
                                                          color: const Color
                                                                  .fromRGBO(
                                                              93, 101, 111, 0.40),
                                                          width: 1.px),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.px))
                                                  : BoxDecoration(
                                                      color: const Color(
                                                          0xff1A1C1F),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.px)),
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
                                                  const Expanded(
                                                      child: SizedBox()),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        S.current
                                                            .UpgradeNeedsWagar,
                                                        style: pubTextStyle(
                                                            const Color(
                                                                0xffffffff),
                                                            24.sp,
                                                            FontWeight.w400),
                                                      ),
                                                      if (index == 0)
                                                        SizedBox(
                                                          width: 12.px,
                                                        ),
                                                      if (index == 0)
                                                        Image(
                                                          image: const AssetImage(
                                                              'assets/images/vip/ic_prompt.webp'),
                                                          width: 24.px,
                                                        ),
                                                      //
                                                    ],
                                                  ),
                                                  const Expanded(
                                                      child: SizedBox()),
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
                                                  left: 30.px, right: 30.px),
                                              height: 80.px,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Stack(
                                                    children: [
                                                      Image(
                                                        image: const AssetImage(
                                                            'assets/images/vip/bg_vip_1.webp'),
                                                        width: 74.px,
                                                      ),
                                                      Positioned(
                                                        right: 0,
                                                        left: 0,
                                                        top: 12.px,
                                                        child: Center(
                                                          child: Text(
                                                            '1',
                                                            style: pubTextStyle(
                                                                const Color(
                                                                    0xffffffff),
                                                                26.sp,
                                                                FontWeight
                                                                    .w700),
                                                          ),
                                                        ),
                                                        // Text('1',style: pubTextStyle(Color(0xffffffff), 26.sp, FontWeight.w700),textAlign: TextAlign.center,),
                                                      ),
                                                    ],
                                                  ),
                                                  const Expanded(
                                                      child: SizedBox()),
                                                  Container(
                                                    width: 320.px,
                                                    height: 23.px,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: const Color(
                                                              0xff07BB65),
                                                          width: 1.px),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.px),
                                                    ),
                                                    child: Stack(
                                                      children: [
                                                        ProgressBar(
                                                          width: 320.px,
                                                          height: 25.px,
                                                          value: 0.9,
                                                          gradient:
                                                              const LinearGradient(
                                                            begin: Alignment
                                                                .topLeft,
                                                            end: Alignment
                                                                .bottomRight,
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
                                                                  TextAlign
                                                                      .center,
                                                              style: pubTextStyle(
                                                                  const Color(
                                                                      0xffffffff),
                                                                  20.sp,
                                                                  FontWeight
                                                                      .w400)),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const Expanded(
                                                      child: SizedBox()),
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
                            ),
                            const Text('data1'),
                            const Text('data2'),
                            const Text('data3'),
                          ],
                        ),
                      ),

                      _getIllustrate(),
                      // SizedBox(
                      //   height: 24.h,
                      // ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              // width: double.infinity,
              height: 120.px,
              // margin: EdgeInsets.only(bottom: 20.px),
              padding: EdgeInsets.fromLTRB(18.px, 24.px, 18.px, 15.px),
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    height: 80.px,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.px),
                      border: Border.all(
                          color: const Color(0xff3EA1F8), width: 1.px),
                    ),
                    child: TextButton(
                      onPressed: () => {
                        Get.back(),
                      },
                      child: Text(
                        S.current.Back,
                        style: pubTextStyle(
                            const Color(0xff3EA1F8), 26.sp, FontWeight.w700),
                      ),
                    ),
                  )),
                  SizedBox(
                    width: 17.px,
                  ),
                  Expanded(
                      child: Container(
                    height: 80.px,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.px),
                        color: const Color(0xff3EA1F8)
                        // border: Border.all(
                        //     color: const Color(0xff3EA1F8), width: 1.w),
                        ),
                    child: TextButton(
                      onPressed: () => {
                        Toast.show('msg'),
                      },
                      child: Text(
                        S.current.CollectAll,
                        style: pubTextStyle(
                            const Color(0xffffffff), 26.sp, FontWeight.w700),
                      ),
                    ),
                  )),
                ],
              ),
            ),
            Container(
              width: 1.sw,
              height: MediaQuery.of(context).padding.bottom,
              color: bottomBgColor,
            )
          ],
        ),
      ),
    );
  }

  Widget _getIllustrate() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(30.px),
      // margin: EdgeInsets.only(bottom: 30.h, top: 30.h),
      margin: EdgeInsets.only(top: 30.px, left: 20.px, right: 20.px),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.px),
        color: const Color(0xff252527),
        border: Border.all(
            color: const Color.fromRGBO(93, 101, 111, 0.40), width: 1.px),
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
            height: 36.px,
          ),
          Text(S.current.InstructionsVIPRules_2,
              style: pubTextStyle(
                  const Color(0xff8F9DAB), 24.sp, FontWeight.w400,
                  height: 1.5)),
          SizedBox(
            height: 36.px,
          ),
          Text(S.current.InstructionsVIPRules_3,
              style: pubTextStyle(
                  const Color(0xff8F9DAB), 24.sp, FontWeight.w400,
                  height: 1.5)),
          SizedBox(
            height: 36.px,
          ),
          Text(S.current.InstructionsVIPRules_4,
              style: pubTextStyle(
                  const Color(0xff8F9DAB), 24.sp, FontWeight.w400,
                  height: 1.5)),
          SizedBox(
            height: 36.px,
          ),
          Text(S.current.InstructionsVIPRules_5,
              style: pubTextStyle(
                  const Color(0xff8F9DAB), 24.sp, FontWeight.w400,
                  height: 1.5)),
          SizedBox(
            height: 36.px,
          ),
          Text(S.current.InstructionsVIPRules_6,
              style: pubTextStyle(
                  const Color(0xff8F9DAB), 24.sp, FontWeight.w400,
                  height: 1.5)),
          SizedBox(
            height: 36.px,
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
