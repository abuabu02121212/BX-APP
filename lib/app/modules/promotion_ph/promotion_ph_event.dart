import 'package:flutter/cupertino.dart';
import 'package:flutter_comm/app/app_style.dart';
import 'package:flutter_comm/app/component/app_empty_promotion.dart';
import 'package:flutter_comm/app/modules/promotion_ph/promotion_ph_logic.dart';
import 'package:flutter_comm/util/toast_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class promotionPHEvent extends StatelessWidget {
  promotionPHEvent({
    super.key,
    required this.logic,
    required this.indexPase,
    required this.itemWidget,
  });

  // Event mission rebate rewards
  static const List<String> tabNames = [
    "Event",
    "Mission",
    "Rebate",
    "Rewards"
  ];

  PromotionPHLogic logic;
  int indexPase;
  Widget itemWidget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Container(
            height: 120.h,
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            child: Row(
              children: [
                Visibility(
                  visible: indexPase == 2 ? true : false,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    width: 250.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                                text: TextSpan(
                                    text: 'Total Valid Bets',
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
                          height: 8.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                                text: TextSpan(
                                    text: 'Rebateable',
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
                        width: 250.w,
                        height: 60.h,
                        padding: EdgeInsets.fromLTRB(30.w, 0.h, 30.w, 0.h),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromRGBO(93, 101, 111, 0.40),
                              width: 1.w),
                          borderRadius: BorderRadius.circular(35.r),
                          color: const Color(0xff1A1C1F),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Distributed',
                              style: TextStyle(
                                  color: const Color(0xffffffff),
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                            Image(
                              image: const AssetImage(
                                  'assets/images/promotion/ic_arrow_down_gray.webp'),
                              height: 12.h,
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
                      width: 180.w,
                      height: 60.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.r),
                        border: Border.all(
                            width: 1.w, color: const Color(0xff3EA1F8)),
                      ),
                      child: Text(
                        'History',
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
                  width: 15.w,
                ),
                CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: Container(
                      alignment: Alignment.center,
                      width: 180.w,
                      height: 60.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40.r),
                          color: const Color(0xff8F9DAB)
                          // border: Border.all(width: 1.w,color: const Color(0xff3EA1F8)),
                          ),
                      child: Text(
                        'Collect All',
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
            margin: EdgeInsets.only(left: 20.w, right: 20.w),
            width: double.infinity,
            height: 1200.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (indexPase == 2)
                  SizedBox(
                    height: double.infinity,
                    // padding: EdgeInsets.only(bottom: 50.h),
                    width: 120.w,
                    child: ListView.separated(
                        itemBuilder: (BuildContext context, int index) {
                          return _gameName(index);
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: 24.h,
                          );
                        },
                        itemCount: logic.list_name1.length),
                  ),
                if (indexPase == 2)
                  SizedBox(
                    width: 22.w,
                  ),
                Container(
                  width: indexPase == 2 ? 568.w : 710.w,
                  // height: double.infinity,
                  // height: 2000.h,
                  padding: EdgeInsets.only(bottom: 50.h),
                  child: MediaQuery.removePadding(
                    removeBottom: true,
                    removeTop: true,
                    context: context,
                    child: indexPase != 3
                        ? ListView.separated(
                            itemBuilder: (BuildContext context, int index) {
                              return itemWidget;
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                height: 15.h,
                              );
                            },
                            itemCount: logic.list_name.length)
                        : AppEmptyPromotion(
                            width: indexPase == 2 ? 568.w : 710.w,
                            height: 500.h,
                          ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _gameName(int index) {
    return Obx(() => Container(
          width: 100.w,
          height: 100.h,
          decoration: logic.index3.value == index
              ? getBoxDecoration()
              : getBoxDecoration2(),
          child: CupertinoButton(
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Image(
                    image: AssetImage(
                        "assets/images/${logic.index3.value == index ? "game-tab${logic.imgListY[index]}" : "game-tab-un${logic.imgListY[index]}"}.webp"),
                    width: 52.w,
                    height: 52.h,
                  ),
                  Text(
                    logic.nameList[index],
                    style: pubTextStyle(
                        const Color(0xffffffff), 22.sp, FontWeight.w700),
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
          color: const Color.fromRGBO(121, 121, 121, 0.30), width: 1.w),
      borderRadius: BorderRadius.circular(24.r),
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
      borderRadius: BorderRadius.circular(24.r),
    );
  }
}
