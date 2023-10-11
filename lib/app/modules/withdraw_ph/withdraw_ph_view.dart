import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_comm/app/routes/app_pages.dart';
import 'package:flutter_comm/util/base_scaffold_ph.dart';
import 'package:flutter_comm/util/toast_util.dart';
import 'package:flutter_comm/widget/pin_code_text.dart';
import 'package:flutter_comm/widget/pub_bot.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../generated/l10n.dart';
import '../../../util/base_appbar_ph.dart';
import '../../../widget/online_deposit.dart';
import '../../app_style.dart';
import 'withdraw_ph_logic.dart';

class Withdraw_phPage extends StatefulWidget {
  const Withdraw_phPage({Key? key}) : super(key: key);

  @override
  State<Withdraw_phPage> createState() => _Withdraw_phPageState();
}

class _Withdraw_phPageState extends State<Withdraw_phPage> {
  final logic = Get.put(Withdraw_phLogic());
  final state = Get.find<Withdraw_phLogic>().state;

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldPH(
      backgroundColor: blackBgColor_h,
      appBar: BaseAppbarPH(
        title: S.current.Withdraw,
      ),
      body: Column(
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
                      S.current.Withdraw,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      S.current.withdrawRecords,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      S.current.TurnoverReport,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      S.current.ManageAccount,
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
              padding: EdgeInsets.only(top: 24.h, left: 20.w, right: 20.w),
              width: double.infinity,
              child: PageView(
                onPageChanged: (int index) => {
                  logic.tabController.animateTo(index),
                },
                controller: logic.pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _withdraw_view(),
                  const Text('11111'),
                  const Text('22222'),
                  const Text('33333'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _withdraw_view() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(30.h, 30.h, 25.h, 30.h),
          height: 158.h,
          width: double.infinity,
          decoration: pubBoxDecoration(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        S.current.Balance,
                        style: pubTextStyle(
                            const Color(0xffffffff), 28.sp, FontWeight.w400),
                      ),
                      SizedBox(
                        width: 13.w,
                      ),
                      Text(
                        '0.02 ',
                        style: pubTextStyle(
                            const Color(0xffF09B1B), 28.sp, FontWeight.w700),
                      ),
                      SizedBox(
                        width: 13.w,
                      ),
                      CupertinoButton(
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
                  Text(
                    S.current.required_withdraw,
                    style: pubTextStyle(
                        const Color(0xff5D656F), 22.sp, FontWeight.w400),
                  ),
                  CupertinoButton(
                      padding: EdgeInsets.zero,
                      minSize: 0,
                      child: Text(
                        S.current.Details,
                        style: pubTextStyle(
                            const Color(0xff3EA1F8), 22.sp, FontWeight.w400),
                      ),
                      onPressed: () => {
                            Toast.show('msg'),
                          })
                ],
              ),
              SizedBox(
                width: 166.w,
                height: 92.h,
                child: Stack(
                  children: [
                    Positioned(
                      top: 16.h,
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xff3EA1F8),
                          borderRadius: BorderRadius.circular(45.r),
                        ),
                        width: 160.w,
                        height: 60.h,
                        child: TextButton(
                            onPressed: () => {
                                  Toast.show('msg'),
                                },
                            child: Text(
                              S.current.Interest,
                              style: pubTextStyle(const Color(0xffffffff),
                                  26.sp, FontWeight.w700),
                            )),
                      ),
                    ),
                    Positioned(
                      right: 0.w,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(12.w, 3.h, 12.w, 12.h),
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/user/ic_tip_bubble.webp'),
                                fit: BoxFit.fill)),
                        child: Text(
                          '15%',
                          style: pubTextStyle(
                              const Color(0xFFffffff), 22.sp, FontWeight.w400),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: onlineDeposit(
                isSele: true,
                name: S.current.REGULARCASHOUT,
                click: (name) => {},
              ),
            ),
            SizedBox(
              width: 14.h,
            ),
            Expanded(
              flex: 1,
              child: onlineDeposit(
                isHave: false,
                name: S.current.TransferCRYPTOCURRENCY,
                click: (name) => {},
              ),
            )
          ],
        ),
        Container(
          padding: EdgeInsets.only(top: 30.h, bottom: 30.h),
          child: pubLin(),
        ),
        CupertinoButton(
            padding: EdgeInsets.zero,
            child: Container(
              padding: EdgeInsets.only(left: 18.h, right: 25.w),
              height: 70.h,
              decoration:
                  pubBoxDecoration(color: const Color(0xff1A1C1F), rs: 8.r),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                    image: const AssetImage(
                        'assets/images/user/ic_add_account.webp'),
                    width: 40.w,
                  ),
                  SizedBox(
                    width: 14.w,
                  ),
                  Text(
                    S.current.AddAccount,
                    style: pubTextStyle(
                        const Color(0xffffffff), 24.sp, FontWeight.w400),
                  ),
                  const Expanded(child: SizedBox()),
                  Image(
                    image: const AssetImage(
                        'assets/images/user/ic_arrow_ash_deep.webp'),
                    width: 12.w,
                  ),
                ],
              ),
            ),
            onPressed: () => {
                  Get.toNamed(Routes.WITHDRAW_PIN),
                }),
        SizedBox(
          height: 30.h,
        ),
        Container(
          height: 70.h,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.fromLTRB(23.w, 0, 23.w, 0),
          decoration: BoxDecoration(
            color: const Color(0xFF1A1C1F),
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
                color: const Color.fromRGBO(93, 101, 111, 0.40), width: 1.w),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                S.current.money_p,
                style: TextStyle(
                  fontSize: 32.sp,
                  color: const Color(0xFFffffff),
                  fontWeight: FontWeight.w600,
                ),
              ),
              Expanded(
                flex: 1,
                child: TextField(
                  controller: TextEditingController(),
                  maxLines: 1,
                  cursorColor: const Color(0xffffffff),
                  style: pubTextStyle(
                      const Color(0xFFffffff), 24.sp, FontWeight.w400),
                  onChanged: (text) async {},
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                        left: 24.w, right: 0.w, top: 0.h, bottom: 7.h),
                    hintText: S.current.Min_100_Max_50000,
                    hintStyle: pubTextStyle(
                        const Color(0xFF5D656F), 24.sp, FontWeight.w400),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 30.h, bottom: 30.h),
          child: pubLin(),
        ),
        Obx(
          () => PinCodeText(
            isNum: logic.hasError.value,
            name: S.current.WithdrawPIN,
            textEditingController: logic.controller,
            changed: (e) => {
              Toast.show('$e'),
            },
            onDone: (e) => {
              Toast.show('${e}aaaa'),
            },
            canDisplayed: () => {
              Toast.show('aaaa'),
              logic.hasError.value = !logic.hasError.value,
              logic.hasError.refresh()
            },
          ),
        ),
        const Expanded(child: SizedBox()),
        PubBot(
          name: S.current.Confirm,
          isSele: false,
          click: () => {
            Toast.show('msg'),
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    Get.delete<Withdraw_phLogic>();
    super.dispose();
  }
}
