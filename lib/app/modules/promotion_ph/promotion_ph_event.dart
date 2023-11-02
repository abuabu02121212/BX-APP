import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_comm/app/app_style.dart';
import 'package:flutter_comm/app/component/app_empty_promotion.dart';
import 'package:flutter_comm/app/modules/promotion_ph/promotion_ph_logic.dart';
import 'package:flutter_comm/util/size.dart';
import 'package:flutter_comm/util/toast_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../generated/l10n.dart';

class promotionPHEvent extends StatelessWidget {
  promotionPHEvent({
    super.key,
    required this.logic,
    required this.indexPase,
    required this.itemWidget,
  });

  PromotionPHLogic logic;
  int indexPase;
  Widget itemWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: double.infinity,
      // padding: EdgeInsets.only(bottom: 100.h),
      child: Column(
        children: [
          Container(
            height: 120.px,
            padding: EdgeInsets.only(left: 20.px, right: 20.px),
            child: Row(
              children: [
                Visibility(
                  visible: indexPase == 2 ? true : false,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    width: 250.px,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                                text: TextSpan(
                                    text: S.current.TotalValidBets,
                                    style: TextStyle(
                                        color: const Color(0xff8F9DAB),
                                        fontSize: 24.sp,
                                        fontWeight: FontWeight.w400))),
                            RichText(
                                text: TextSpan(
                                    text: '0.00',
                                    style: TextStyle(
                                        color: const Color(0xffffffff),
                                        fontSize: 24.sp,
                                        fontWeight: FontWeight.w700))),
                          ],
                        ),
                        SizedBox(
                          height: 8.px,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                                text: TextSpan(
                                    text: S.current.Rebateable,
                                    style: TextStyle(
                                        color: const Color(0xff8F9DAB),
                                        fontSize: 24.sp,
                                        fontWeight: FontWeight.w400))),
                            RichText(
                                text: TextSpan(
                                    text: '0.00',
                                    style: TextStyle(
                                        color: const Color(0xffffffff),
                                        fontSize: 24.sp,
                                        fontWeight: FontWeight.w700))),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: indexPase == 3 ? true : false,
                  child: CupertinoButton(
                      padding: EdgeInsets.zero,
                      minSize: 0,
                      child: Container(
                        width: 250.px,
                        height: 60.px,
                        padding: EdgeInsets.fromLTRB(30.px, 0.px, 30.px, 0.px),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromRGBO(93, 101, 111, 0.40),
                              width: 1.px),
                          borderRadius: BorderRadius.circular(35.px),
                          color: const Color(0xff1A1C1F),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              S.current.Distributed,
                              style: TextStyle(
                                  color: const Color(0xffffffff),
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w400),
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
                ),
                const Expanded(
                  flex: 1,
                  child: SizedBox(),
                ),
                CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: Container(
                      alignment: Alignment.center,
                      width: 180.px,
                      height: 60.px,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.px),
                        border: Border.all(
                            width: 1.px, color: const Color(0xff3EA1F8)),
                      ),
                      child: Text(
                        S.current.History,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: const Color(0xff3EA1F8),
                            fontSize: 26.sp,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    onPressed: () => {
                          Toast.show('msg'),
                        }),
                SizedBox(
                  width: 15.px,
                ),
                CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: Container(
                      alignment: Alignment.center,
                      width: 180.px,
                      height: 60.px,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40.px),
                          color: const Color(0xff8F9DAB)
                          // border: Border.all(width: 1.w,color: const Color(0xff3EA1F8)),
                          ),
                      child: Text(
                        S.current.CollectAll,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: const Color(0xffffffff),
                            fontSize: 26.sp,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    onPressed: () => {
                          Toast.show('msg'),
                        }),
              ],
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(left: 20.px, right: 20.px),
            width: double.infinity,
            height: Platform.isAndroid ? 1130.px:1080.px,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (indexPase == 2)
                  SizedBox(
                    height: double.infinity,
                    // padding: EdgeInsets.only(bottom: 50.h),
                    width: 100.px,
                    child: ListView.separated(
                        itemBuilder: (BuildContext context, int index) {
                          return _gameName(index);
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: 24.px,
                          );
                        },
                        itemCount: logic.list_name1.length),
                  ),
                if (indexPase == 2)
                  SizedBox(
                    width: 22.px,
                  ),
                SizedBox(
                  width: indexPase == 2 ? 568.px : 710.px,
                  // height: double.infinity,
                  // height: 2000.h,
                  // padding: EdgeInsets.only(bottom: 350.h),
                  child:
                      // SingleChildScrollView(
                      //   physics: NeverScrollableScrollPhysics(),
                      //   padding: EdgeInsets.zero,
                      //   controller: ScrollController(),
                      //   child:
                      MediaQuery.removePadding(
                    removeBottom: true,
                    removeTop: true,
                    context: context,
                    child: indexPase != 3
                        ? ListView.separated(
                            physics: const ClampingScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return (indexPase == 1 &&
                                      index == logic.list_name1.length)
                                  ? _getIllustrate()
                                  : itemWidget;
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                height: 15.px,
                              );
                            },
                            itemCount: indexPase == 1
                                ? logic.list_name1.length + 1
                                : logic.list_name1.length)
                        : AppEmptyPromotion(
                            name: S.current.NoRecords,
                            width: indexPase == 2 ? 568.px : 710.px,
                            height: 500.px,
                          ),
                  ),
                ),

                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _getIllustrate() {
    return Container(
      width: 710.px,
      padding: EdgeInsets.all(30.px),
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
          Text(S.current.I_Taskim,
              style: pubTextStyle(
                  const Color(0xffffffff), 24.sp, FontWeight.w400,
                  height: 1.5)),
          Text(S.current.Long_term_missions,
              style: pubTextStyle(
                  const Color(0xff8F9DAB), 24.sp, FontWeight.w400,
                  height: 1.5)),
          SizedBox(
            height: 36.px,
          ),
          Text(S.current.II_Task_conditions,
              style: pubTextStyle(
                  const Color(0xffffffff), 24.sp, FontWeight.w400,
                  height: 1.5)),
          Text(S.current.Complete_the_relevant,
              style: pubTextStyle(
                  const Color(0xff8F9DAB), 24.sp, FontWeight.w400,
                  height: 1.5)),
          SizedBox(
            height: 36.px,
          ),
          Text(S.current.III_Content_of_task,
              style: pubTextStyle(
                  const Color(0xffffffff), 24.sp, FontWeight.w400,
                  height: 1.5)),
          Text(S.current.III_Content_of_task_d,
              style: pubTextStyle(
                  const Color(0xff8F9DAB), 24.sp, FontWeight.w400,
                  height: 1.5)),

          // ]),
          // ),
        ],
      ),
    );
  }

  Widget _gameName(int index) {
    return Obx(() => Container(
          width: 100.px,
          height: 100.px,
          decoration: logic.index3.value == index
              ? getBoxDecoration()
              : getBoxDecoration2(),
          child: CupertinoButton(
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  SizedBox(
                    height: 10.px,
                  ),
                  Image(
                    image: AssetImage(
                        "assets/images/${logic.index3.value == index ? "game-tab${logic.imgListY[index]}" : "game-tab-un${logic.imgListY[index]}"}.webp"),
                    width: 52.px,
                    height: 52.px,
                  ),
                  Text(
                    logic.nameList[index],
                    style: pubTextStyle(
                        const Color(0xffffffff), 20.sp, FontWeight.w700),
                  ),
                ],
              ),
              onPressed: () => {
                    Toast.show('msg'),
                    logic.index3.value = index,
                    logic.index3.refresh(),
                  }),
        ));
  }

  BoxDecoration getBoxDecoration() {
    return BoxDecoration(
      // color: indexs ==index? : ,
      // gradient: LinearGradient(
      //     colors: [Color(0xffDEEEFB), Color(0xffBEDCEF)], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      gradient: const LinearGradient(colors: [
        Color(0xff61CEFF),
        Color(0xff1B75F0),
      ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
      border: Border.all(
          color: const Color.fromRGBO(121, 121, 121, 0.30), width: 1.px),
      borderRadius: BorderRadius.circular(24.px),
    );
  }

  BoxDecoration getBoxDecoration2() {
    return BoxDecoration(
      color: const Color(0xff1A1C1F),
      boxShadow: const [
        BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.25),
          offset: Offset(0, -1),
          spreadRadius: 2,
        ),
      ],
      borderRadius: BorderRadius.circular(24.px),
    );
  }
}
