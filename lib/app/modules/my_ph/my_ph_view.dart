import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_comm/app/app_style.dart';
import 'package:flutter_comm/app/modules/my_ph/user_list_w.dart';
import 'package:flutter_comm/app/routes/app_pages.dart';
import 'package:flutter_comm/util/base_scaffold_ph.dart';
import 'package:flutter_comm/util/size.dart';
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

  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldPH(
      backgroundColor: blackBgColor_h,
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/promotion/bg_pattern.webp'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  const Image(
                      image: AssetImage('assets/images/user/bg_my.webp')),
                  Column(
                    children: [
                      SizedBox(
                        height: 100.px,
                      ),
                      _personalInformation(),
                      _userLevel(),
                      UserListW(
                        list: logic.leftList,
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                width: 1.sw,
                height: MediaQuery.of(context).padding.bottom,
              )
            ],
          ),
        ),
      ),
    );
  }

  ///头部信息
  Widget _personalInformation() {
    return Container(
      margin: EdgeInsets.fromLTRB(30.px, 10.px, 30.px, 0),
      child: Column(
        children: [
          SizedBox(
            height: 160.px,
            child: Row(
              children: [
                Column(
                  children: [
                    CupertinoButton(
                        padding: EdgeInsets.zero,
                        child: Image(
                            height: 160.px,
                            width: 160.px,
                            image: const AssetImage(
                                'assets/images/user/ic_profile_picture.webp')),
                        onPressed: () => {
                              Get.toNamed(Routes.PERSONAL_INFORMATION),
                            }),
                  ],
                ),
                SizedBox(
                  width: 30.px,
                ),
                Container(
                  height: 160.px,
                  padding: EdgeInsets.fromLTRB(0, 10.px, 0, 5.px),
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
                            width: 10.px,
                          ),
                          CupertinoButton(
                              padding: EdgeInsets.zero,
                              minSize: 0,
                              child: Container(
                                padding: EdgeInsets.zero,
                                child: Image(
                                  image: const AssetImage(
                                      'assets/images/user/ic_cooy_w.webp'),
                                  width: 24.px,
                                ),
                              ),
                              onPressed: () => {
                                    Toast.show('msg'),
                                  }),
                        ],
                      ),
                      Row(
                        children: [
                          Text('${S.current.ID}49816685',
                              style: pubTextStyle(const Color(0xffffffff),
                                  24.sp, FontWeight.w400)),
                          SizedBox(
                            width: 10.px,
                          ),
                          CupertinoButton(
                              padding: EdgeInsets.zero,
                              minSize: 0,
                              child: Image(
                                image: const AssetImage(
                                    'assets/images/user/ic_cooy_w.webp'),
                                width: 24.px,
                              ),
                              onPressed: () => {Toast.show('msg')}),
                        ],
                      ),
                      Row(
                        children: [
                          Image(
                            image: const AssetImage(
                                'assets/images/user/ic_money_f.webp'),
                            width: 40.px,
                            height: 40.px,
                          ),
                          SizedBox(
                            width: 10.px,
                          ),
                          Text(
                            '0.20',
                            style: pubTextStyle(const Color(0xffffffff), 64.sp,
                                FontWeight.w700),
                          ),
                          SizedBox(
                            width: 16.px,
                          ),
                          CupertinoButton(
                              padding: EdgeInsets.zero,
                              minSize: 0,
                              child: Image(
                                image: const AssetImage(
                                    'assets/images/user/ic_refreshed_w.webp'),
                                width: 36.px,
                              ),
                              onPressed: () => {Toast.show('msg')}),
                        ],
                      ),
                    ],
                  ),
                ),
                const Expanded(flex: 1, child: SizedBox()),
                Container(
                  padding: EdgeInsets.only(bottom: 25.px),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CupertinoButton(
                          padding: EdgeInsets.zero,
                          minSize: 0,
                          child: Stack(
                            children: [
                              Container(
                                padding:
                                    EdgeInsets.fromLTRB(0, 13.px, 13.px, 0),
                                child: Image(
                                  image: const AssetImage(
                                      'assets/images/user/bg_msg.webp'),
                                  width: 50.px,
                                ),
                              ),
                              Container(
                                padding:
                                    EdgeInsets.fromLTRB(8.5.px, 26.px, 0, 0),
                                child: Image(
                                  image: const AssetImage(
                                      'assets/images/user/ic_msg.webp'),
                                  width: 33.px,
                                  height: 26.px,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 37.px),
                                width: 26.px,
                                height: 26.px,
                                decoration: BoxDecoration(
                                  color: const Color(0xffFF3F40),
                                  borderRadius: BorderRadius.circular(90.px),
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
                                Get.toNamed(Routes.MESSAGE_CENTER),
                              }),
                      CupertinoButton(
                          padding: EdgeInsets.all(5.px),
                          minSize: 0,
                          child: Image(
                            image: const AssetImage(
                                'assets/images/user/ic_arrow_left_w.webp'),
                            width: 11.5.px,
                            height: 20.px,
                          ),
                          onPressed: () =>
                              {Get.toNamed(Routes.PERSONAL_INFORMATION)}),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 36.px),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _headTab('assets/images/user/ic_main_wallet.webp',
                    S.current.MainWallet, () {
                  Get.toNamed(Routes.MAIN_WALLET_PAGE);
                }),
                line(),
                _headTab(
                    'assets/images/user/ic_withdraw.webp', S.current.Withdraw,
                    () {
                  Get.toNamed(Routes.WITHDRAW_PH);
                }),
                line(),
                _headTab(
                    'assets/images/user/ic_deposit.webp', S.current.Deposit,
                    () {
                  Get.toNamed(Routes.DEPOSIT_PH);
                }),
                line(),
                _headTab(
                    'assets/images/user/ic_interest.webp', S.current.Interest,
                    () {
                  Get.toNamed(Routes.INTEREST);
                }),
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
      width: 1.px,
      height: 80.px,
      color: const Color.fromRGBO(255, 255, 255, 0.30),
    ));
  }

  ///头部tab
  Widget _headTab(var img, var name, Function callback) {
    return CupertinoButton(
        padding: EdgeInsets.zero,
        minSize: 0.px,
        child: Container(
          margin: EdgeInsets.only(top: logic.isc(name) ? 25.px : 0.px),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image(
                image: AssetImage(img),
                height: 80.px,
                width: 80.px,
              ),
              SizedBox(
                height: 8.px,
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
      height: 406.px,
      width: 690.px,
      margin: EdgeInsets.fromLTRB(30.px, 30.px, 30.px, 24.px),
      decoration: BoxDecoration(
          color: const Color(0xff252527),
          border: Border.all(
              color: const Color.fromRGBO(93, 101, 111, 0.40), width: 1.px),
          borderRadius: BorderRadius.circular(16.px)),
      child: Column(
        children: [
          CupertinoButton(
              padding: EdgeInsets.zero,
              child: Row(
                children: [
                  Container(
                      margin: EdgeInsets.fromLTRB(34.px, 32.px, 0, 0),
                      height: 140.px,
                      width: 157.px,
                      child: Stack(
                        children: [
                          Image(
                            image: const AssetImage(
                                'assets/images/user/bg_vip.webp'),
                            height: 140.px,
                          ),
                          Positioned(
                            left: 0,
                            right: 0,
                            bottom: 4.px,
                            child: Text(
                              '${S.current.VIP} 1',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: const Color(0xffffffff),
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w700,
                                  shadows: [
                                    Shadow(
                                      color:
                                          const Color.fromRGBO(0, 0, 0, 0.25),
                                      offset: Offset(0.px, 3.px),
                                      blurRadius: 6.px,
                                    )
                                  ]),
                            ),
                          ),
                        ],
                      )),
                  SizedBox(
                    width: 30.px,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30.px),
                    padding: EdgeInsets.only(top: 15.px),
                    height: 140.px,
                    child: Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            Text(S.current.UpgradeNeedsWager,
                                style: pubTextStyle(const Color(0xffffffff),
                                    22.sp, FontWeight.w400)),
                            Container(
                              width: 435.px,
                              height: 23.px,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color(0xff3EA1F8),
                                    width: 1.px),
                                borderRadius: BorderRadius.circular(15.px),
                              ),
                              child: Stack(
                                children: [
                                  ProgressBar(
                                    width: 435.px,
                                    height: 25.px,
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
                                        style: pubTextStyle(
                                            const Color(0xffffffff),
                                            20.sp,
                                            FontWeight.w400)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          right: 0.px,
                          top: 0.px,
                          bottom: 0.px,
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: Image(
                              image: const AssetImage(
                                  'assets/images/user/ic_arrow_ash.webp'),
                              width: 11.5.px,
                              height: 20.px,
                              // ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              onPressed: () => {
                    Get.toNamed(Routes.VIP_PH),
                  }),
          Container(
            margin: EdgeInsets.only(top: 30.px),
            width: 689.px,
            height: 1.px,
            color: const Color.fromRGBO(93, 101, 111, 0.40),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.px),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _headTab(
                    'assets/images/user/ic_statement.webp', S.current.Statement,
                    () {
                  Toast.show('Main Wallet');
                }),
                _headTab('assets/images/user/ic_bet_records.webp',
                    S.current.BetRecords, () {}),
                _headTab('assets/images/user/ic_report.webp', S.current.Report,
                    () {}),
                _headTab('assets/images/user/ic_withdrawal_settings.webp',
                    S.current.WithdrawalSettings, () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<My_PHLogic>();
    super.dispose();
  }
}

class EmptyApp extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container();
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(0.0, 0.0);
}
