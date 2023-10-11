import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_comm/app/app_style.dart';
import 'package:flutter_comm/app/routes/app_pages.dart';
import 'package:flutter_comm/util/base_scaffold_ph.dart';
import 'package:flutter_comm/util/toast_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:simple_progress_indicators/simple_progress_indicators.dart';
import '../../../generated/l10n.dart';
import 'my_ph_logic.dart';

class My_PHPage extends StatefulWidget {
  const My_PHPage({Key? key}) : super(key: key);

  @override
  State<My_PHPage> createState() => _My_PHPageState();
}

class _My_PHPageState extends State<My_PHPage> {
  final logic = Get.put(My_PHLogic());
  final state = Get.find<My_PHLogic>().state;

  List<int> leftList = [0, 1, 2, 3, 4, 5, 6, 7];

  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return
      BaseScaffoldPH(
      backgroundColor: blackBgColor_h,
      body:
      SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage( image: AssetImage('assets/images/promotion/bg_pattern.webp'),
              fit: BoxFit.cover,),
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  const Image(
                      image: AssetImage('assets/images/user/bg_my.webp')),
                  Container(
                    padding: EdgeInsets.only(top: paddingSizeTop(context)),
                    child: Column(
                      children: [
                        _personalInformation(),
                        _userLevel(),
                        _userFunctions(context),
                        SizedBox(height: 30.h,)
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///头部信息
  Widget _personalInformation() {
    return Container(
      margin: EdgeInsets.fromLTRB(30.w, 10.h, 30.w, 0),
      child: Column(
        children: [
          SizedBox(
            height: 160.h,
            child: Row(
              children: [
                Column(
                  children: [
                    CupertinoButton(
                        padding: EdgeInsets.zero,
                        child: Image(
                            height: 160.h,
                            width: 160.w,
                            image: const AssetImage(
                                'assets/images/user/ic_profile_picture.webp')),
                        onPressed: () => {
                              Toast.show('msg'),
                            }),
                  ],
                ),
                SizedBox(
                  width: 30.w,
                ),
                Container(
                  height: 160.h,
                  padding: EdgeInsets.fromLTRB(0, 10.h, 0, 5.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'yumikocclemo',
                            style: pubTextStyle(const Color(0xffffffff), 28.sp,
                                FontWeight.w700),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          CupertinoButton(
                              padding: EdgeInsets.zero,
                              minSize: 0,
                              child: Container(
                                padding: EdgeInsets.zero,
                                child: Image(
                                  image: const AssetImage(
                                      'assets/images/user/ic_cooy_w.webp'),
                                  width: 24.w,
                                ),
                              ),
                              onPressed: () => {
                                    Toast.show('msg'),
                                  }),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          Text('${S.current.ID}49816685',
                              style: pubTextStyle(const Color(0xffffffff),
                                  24.sp, FontWeight.w400)),
                          SizedBox(
                            width: 10.w,
                          ),
                          CupertinoButton(
                              padding: EdgeInsets.zero,
                              minSize: 0,
                              child: Image(
                                image: const AssetImage(
                                    'assets/images/user/ic_cooy_w.webp'),
                                width: 24.w,
                              ),
                              onPressed: () => {Toast.show('msg')}),
                          // Expanded(flex: 1, child: SizedBox()),
                        ],
                      ),
                      Row(
                        children: [
                          Image(
                            image: const AssetImage(
                                'assets/images/user/ic_money_f.webp'),
                            width: 40.w,
                            height: 40.h,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            '0.20',
                            style: pubTextStyle(const Color(0xffffffff), 64.sp,
                                FontWeight.w700),
                          ),
                          SizedBox(
                            width: 16.w,
                          ),
                          CupertinoButton(
                              // child: Container(
                              padding: EdgeInsets.zero,
                              minSize: 0,
                              child: Image(
                                image: const AssetImage(
                                    'assets/images/user/ic_refreshed_w.webp'),
                                width: 36.w,
                              ),
                              onPressed: () => {Toast.show('msg')}),
                        ],
                      ),
                    ],
                  ),
                ),
                const Expanded(flex: 1, child: SizedBox()),
                Container(
                  padding: EdgeInsets.only(bottom: 25.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CupertinoButton(
                          padding: EdgeInsets.zero,
                          minSize: 0,
                          child: Stack(
                            children: [
                              Container(
                                padding: EdgeInsets.fromLTRB(0, 13.h, 13.h, 0),
                                child: Image(
                                  image: const AssetImage(
                                      'assets/images/user/bg_msg.webp'),
                                  width: 50.w,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(8.5.w, 26.h, 0, 0),
                                child: Image(
                                  image: const AssetImage(
                                      'assets/images/user/ic_msg.webp'),
                                  width: 33.w,
                                  height: 26.h,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 37.w),
                                width: 26.w,
                                height: 26.h,
                                decoration: BoxDecoration(
                                  color: const Color(0xffFF3F40),
                                  borderRadius: BorderRadius.circular(90.r),
                                ),
                                child: Center(
                                  child: Text('5',
                                      style: pubTextStyle(
                                          const Color(0xffffffff),
                                          22.sp,
                                          FontWeight.w400)),
                                ),
                              ),
                            ],
                          ),
                          onPressed: () => {
                                Toast.show("fafds"),
                              }),
                      CupertinoButton(
                          padding: EdgeInsets.all(5.w),
                          minSize: 0,
                          child: Image(
                            image: const AssetImage(
                                'assets/images/user/ic_arrow_left_w.webp'),
                            width: 11.5.w,
                            height: 20.h,
                          ),
                          onPressed: () => {
                                Toast.show('msg'),
                              }),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 36.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _headTab(
                    'assets/images/user/ic_main_wallet.webp', S.current.MainWallet,
                    () {
                  Get.toNamed(Routes.MAIN_WALLET_PAGE);
                }),
                line(),
                _headTab(
                    'assets/images/user/ic_withdraw.webp', S.current.Withdraw, () {
                  Get.toNamed(Routes.WITHDRAW_PH);
                }),
                line(),
                _headTab('assets/images/user/ic_deposit.webp', S.current.Deposit, () {
                  Get.toNamed(Routes.DEPOSIT_PH);
                }),
                line(),
                _headTab(
                    'assets/images/user/ic_interest.webp', S.current.Interest, () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ///头部分割线
  Widget line() {
    return Center(
        child: Container(
      width: 1.w,
      height: 80.h,
      color: const Color.fromRGBO(255, 255, 255, 0.30),
    ));
  }

  ///头部tab
  Widget _headTab(var img, var name, Function callback) {
    return CupertinoButton(
        padding: EdgeInsets.zero,
        minSize: 0.w,
        child: Container(
          margin: EdgeInsets.only(top: logic.isc(name) ? 25.h : 0.h),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image(
                image: AssetImage(img),
                height: 80.h,
                width: 80.w,
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(name,
                  textAlign: TextAlign.center,
                  style: pubTextStyle(
                      const Color(0xffffffff), 24.sp, FontWeight.w400)),
            ],
          ),
        ),
        onPressed: () => {
              callback(),
            });
  }

  double paddingSizeTop(BuildContext context) {
    final MediaQueryData data = MediaQuery.of(context);
    EdgeInsets padding = data.padding;
    padding = padding.copyWith(bottom: data.viewPadding.top);
    return padding.top;
  }

  ///用户等级
  Widget _userLevel() {
    return Container(
      height: 406.h,
      width: 690.w,
      margin: EdgeInsets.fromLTRB(30.w, 30.h, 30.w, 24.h),
      decoration: BoxDecoration(
          color: const Color(0xff252527),
          border: Border.all(
              color: const Color.fromRGBO(93, 101, 111, 0.40), width: 1.w),
          borderRadius: BorderRadius.circular(16.r)),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                  margin: EdgeInsets.fromLTRB(34.w, 32.h, 0, 0),
                  height: 140.h,
                  width: 157.w,
                  child: Stack(
                    children: [
                      Image(
                        image:
                            const AssetImage('assets/images/user/bg_vip.webp'),
                        height: 140.h,
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 15.h,
                        child: Text(
                          '${S.current.VIP} 1',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: const Color(0xffffffff),
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w700,
                              shadows: [
                                Shadow(
                                  color: const Color.fromRGBO(0, 0, 0, 0.25),
                                  offset: Offset(0.w, 3.w),
                                  blurRadius: 6.r,
                                )
                              ]),
                        ),
                      ),
                    ],
                  )),
              SizedBox(
                width: 30.w,
              ),
              Container(
                margin: EdgeInsets.only(top: 30.h),
                padding: EdgeInsets.only(top: 15.h),
                height: 140.h,
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text.rich(TextSpan(children: [
                          TextSpan(
                              text: S.current.ToAchieveNextLevel,
                              style: pubTextStyle(const Color(0xff8F9DAB),
                                  22.sp, FontWeight.w400)),
                          TextSpan(
                              text: '${S.current.VIP} 1',
                              style: pubTextStyle(const Color(0xff3EA1F8),
                                  22.sp, FontWeight.w700)),
                          TextSpan(
                              text: S.current.WagerAdditional_n,
                              style: pubTextStyle(const Color(0xff8F9DAB),
                                  22.sp, FontWeight.w400)),
                          TextSpan(
                              text: '1000.00',
                              style: pubTextStyle(const Color(0xffffffff),
                                  22.sp, FontWeight.w700)),
                        ])),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(S.current.UpgradeNeedsWager,
                            style: pubTextStyle(const Color(0xffffffff), 22.sp,
                                FontWeight.w400)),
                        SizedBox(
                          height: 15.h,
                        ),
                        Container(
                          width: 435.w,
                          height: 23.h,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color(0xff3EA1F8), width: 1.w),
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                          child: Stack(
                            children: [
                              ProgressBar(
                                width: 435.w,
                                height: 25.h,
                                value: 0.9,
                                gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color(0xff3EA1F8),
                                    Color(0xff3EA1F8)
                                  ],
                                ),
                              ),
                              Center(
                                child: Text('700.00/1000.00',
                                    textAlign: TextAlign.center,
                                    style: pubTextStyle(const Color(0xffffffff),
                                        20.sp, FontWeight.w400)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      right: 0.w,
                      top: 0.h,
                      bottom: 0.h,
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: CupertinoButton(
                          padding: EdgeInsets.zero,
                          minSize: 0,
                          onPressed: () => {Toast.show('msg')},
                          child: Image(
                            image: const AssetImage(
                                'assets/images/user/ic_arrow_ash.webp'),
                            width: 11.5.w,
                            height: 20.h,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 30.w),
            width: 689.w,
            height: 1.h,
            color: const Color.fromRGBO(93, 101, 111, 0.40),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _headTab('assets/images/user/ic_statement.webp', S.current.Statement,
                    () {
                  Toast.show('Main Wallet');
                }),
                // line(),
                _headTab('assets/images/user/ic_bet_records.webp',
                    S.current.BetRecords, () {}),
                // line(),
                _headTab('assets/images/user/ic_report.webp', S.current.Report, () {}),
                // line(),
                _headTab('assets/images/user/ic_withdrawal_settings.webp',
                    S.current.WithdrawalSettings, () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ///用户功能
  Widget _userFunctions(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 800.h,
      margin: EdgeInsets.only(left: 30.w, right: 30.w, bottom: 150.h),
      padding: EdgeInsets.only(left: 25.w, right: 25.w),
      decoration: BoxDecoration(
        color: const Color(0xff1A1C1F),
        border: Border.all(
            color: const Color.fromRGBO(93, 101, 111, 0.40), width: 1.w),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              color: const Color.fromRGBO(93, 101, 111, 0.40),
              height: 1.h,
            );
          },
          physics: const NeverScrollableScrollPhysics(),
          itemCount: leftList.length,
          itemBuilder: (BuildContext context, int index) {
            return _item(context, index);
          },
        ),
      ),
    );
  }

  Widget _item(BuildContext context, int index) {
    return CupertinoButton(
        padding: EdgeInsets.zero,
        child: SizedBox(
          height: 99.h,
          child: Row(
            children: [
              Image(
                image: logic.getItemImg(index),
                width: 48.w,
              ),
              SizedBox(
                width: 30.w,
              ),
              Text(logic.getItemName(index),
                  style: pubTextStyle(
                      const Color(0xffffffff), 24.sp, FontWeight.w400)),
              const Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              if (index == 0 || index == 4)
                Text(index == 0 ? S.current.MillionMonthly : S.current.English,
                    style: pubTextStyle(
                        index == 1
                            ? const Color(0xff3EA1F8)
                            : const Color(0xff8F9DAB),
                        24.sp,
                        FontWeight.w400)),
              if (index == 1)
                Text.rich(TextSpan(children: [
                  TextSpan(
                      text: 'Server 21 ',
                      style: pubTextStyle(
                          const Color(0xffffffff), 24.sp, FontWeight.w400)),
                  TextSpan(
                      text: '83MS',
                      style: pubTextStyle(
                          const Color(0xff07BB65), 24.sp, FontWeight.w400)),
                ])),
              SizedBox(
                width: 30.w,
              ),
              Image(
                image: const AssetImage('assets/images/user/'
                    'ic_arrow_ash_deep.webp'),
                width: 11.5.w,
                height: 20.h,
              ),
            ],
          ),
        ),
        onPressed: () => {
              Toast.show('msg'),
            });
  }

  @override
  void dispose() {
    Get.delete<My_PHLogic>();
    super.dispose();
  }
}
