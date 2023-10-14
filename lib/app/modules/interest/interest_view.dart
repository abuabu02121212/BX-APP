import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_comm/util/size.dart';
import 'package:flutter_comm/util/toast_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../generated/l10n.dart';
import '../../../util/base_appbar_ph.dart';
import '../../../util/base_scaffold_ph.dart';
import '../../app_style.dart';
import '../../component/app_empty_promotion.dart';
import 'interest_logic.dart';

class InterestPage extends StatefulWidget {
  const InterestPage({Key? key}) : super(key: key);

  @override
  State<InterestPage> createState() => _InterestPageState();
}

class _InterestPageState extends State<InterestPage> {
  final logic = Get.put(InterestLogic());
  final state = Get.find<InterestLogic>().state;

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldPH(
      backgroundColor: blackBgColor_h,
      appBar: BaseAppbarPH(
        title: S.current.Interest,
        // ),
      ),
      body: Column(children: [
        Container(
          height: 80.px,
          alignment: Alignment.center,
          color: const Color(0xff1A1C1F),
          child: Text(
            S.current.Earnings_available,
            style:
                pubTextStyle(const Color(0xff5D656F), 22.sp, FontWeight.w400),
          ),
        ),
        Container(
          color: const Color(0xff1A1C1F),
          child: Container(
            height: 226.px,
            margin: EdgeInsets.only(left: 20.px, right: 20.px, bottom: 30.px),
            decoration: pubBoxDecoration(),
            padding: EdgeInsets.all(30.px),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        S.current.SavingBalance,
                        style: pubTextStyle_default(),
                      ),
                    ),
                    Text(
                      '0.00',
                      style: pubTextStyle_default(
                          type: 1, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      width: 42.px,
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        S.current.APR,
                        style: pubTextStyle_default(),
                      ),
                    ),
                    Text(
                      '0.00',
                      style: pubTextStyle_default(
                          type: 1, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        S.current.CurrentIncome,
                        style: pubTextStyle_default(),
                      ),
                    ),
                    Text(
                      '0.00',
                      style: pubTextStyle_default(
                          type: 3, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      width: 42.px,
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        S.current.TotalIncome,
                        style: pubTextStyle_default(),
                      ),
                    ),
                    Text(
                      '0.00',
                      style: pubTextStyle_default(
                          type: 3, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 60.px,
                      width: 200.px,
                      decoration: pubBoxDecoration_r(
                          color: const Color(0xffF09B1B), rs: 30.px),
                      child: TextButton(
                        onPressed: () => {
                          Toast.show('fsaf'),
                        },
                        child: Text(
                          S.current.Deposit,
                          style: pubTextStyle_default(
                              type: 1,
                              fontWeight: FontWeight.w700,
                              size: 26.sp),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 60.px,
                      width: 200.px,
                      decoration: pubBoxDecoration_r(rs: 30.px),
                      child: TextButton(
                        onPressed: () => {
                          Toast.show('fsaf'),
                        },
                        child: Text(
                          S.current.Withdraw,
                          style: pubTextStyle_default(
                              type: 1,
                              fontWeight: FontWeight.w700,
                              size: 26.sp),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 60.px,
                      width: 200.px,
                      decoration: pubBoxDecoration_r(rs: 30.px),
                      child: TextButton(
                        onPressed: () => {
                          Toast.show('fsaf'),
                        },
                        child: Text(
                          S.current.Collect,
                          style: pubTextStyle_default(
                              type: 1,
                              fontWeight: FontWeight.w700,
                              size: 26.sp),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.zero,
          height: 90.px,
          decoration: const BoxDecoration(
            color: Color(0xff1A1C1F),
          ),
          child: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: const Color(0xff3EA1F8),
            indicatorWeight: 2,
            labelColor: const Color(0xff3EA1F8),
            labelPadding: EdgeInsets.zero,
            controller: logic.tabController,
            unselectedLabelColor: const Color(0xff5D656F),
            labelStyle:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            onTap: (index) => {
              logic.pageController.jumpToPage(index),
            },
            tabs: [
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    S.current.IncomeStatement,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    S.current.InterestStatement,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    S.current.InterestRules,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            padding: EdgeInsets.only(top: 24.px, left: 20.px, right: 20.px),
            width: double.infinity,
            child: PageView(
              onPageChanged: (int index) => {
                logic.tabController.animateTo(index),
              },
              controller: logic.pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _incomeStatement(context),
                const Text('22222'),
                const Text('33333'),
              ],
            ),
          ),
        ),
      ]),
    );
  }

  Widget _incomeStatement(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CupertinoButton(
                padding: EdgeInsets.zero,
                child: Container(
                  height: 70.px,
                  width: 163.px,
                  decoration: pubBoxDecoration(
                    rs: 35.px,
                    color: const Color(0xff1A1C1F),
                  ),
                  padding: EdgeInsets.only(left: 25.px, right: 25.px),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        S.current.Today,
                        style: pubTextStyle_default(type: 1),
                      ),
                      Image(
                        image: const AssetImage(
                            'assets/images/promotion/ic_arrow_down_gray.webp'),
                        height: 12.px,
                      ),
                    ],
                  ),
                ),
                onPressed: () => {
                      Toast.show('msg'),
                    }),
            Row(
              children: [
                RichText(
                    text: TextSpan(
                        text: S.current.TotalIncome,
                        style: pubTextStyle_default())),
                RichText(text: const TextSpan(text: '  ')),
                RichText(
                    text: TextSpan(
                        text: '0.0000',
                        style: pubTextStyle_default(
                            fontWeight: FontWeight.w700, type: 3))),
              ],
            ),
          ],
        ),
        Container(
          height: 80.px,
          margin: EdgeInsets.only(top: 24.px),
          decoration: pubBoxDecoration(color: const Color(0xff1A1C1F)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                S.current.TotalIncome,
                style: pubTextStyle_default(type: 1),
              ),
              Text(
                S.current.Type,
                style: pubTextStyle_default(type: 1),
              ),
              Text(
                S.current.Amount_of_earnings,
                style: pubTextStyle_default(type: 1),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 15.px),
          child: AppEmptyPromotion(
            name: S.current.NoRecords,
            width: 500.px,
            height: 500.px,
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    Get.delete<InterestLogic>();
    super.dispose();
  }
}
