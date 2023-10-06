import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_comm/app/app_style.dart';
import 'package:flutter_comm/util/base_appbar_ph.dart';
import 'package:flutter_comm/util/base_scaffold_ph.dart';
import 'package:flutter_comm/util/toast_util.dart';
import 'package:flutter_comm/widget/online_deposit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'deposit_ph_logic.dart';

class Deposit_PHPage extends StatefulWidget {
  const Deposit_PHPage({Key? key}) : super(key: key);

  @override
  State<Deposit_PHPage> createState() => _Deposit_PHPageState();
}

class _Deposit_PHPageState extends State<Deposit_PHPage> {
  final logic = Get.put(Deposit_PHLogic());
  final state = Get.find<Deposit_PHLogic>().state;
  var list = [0, 1, 2, 3, 4, 5];

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldPH(
      backgroundColor: blackBgColor_h,
      appBar: BaseAppbarPH(
        title: 'Deposit',
        actions: [
          CupertinoButton(
              padding: EdgeInsets.fromLTRB(0, 0, 20.w, 0),
              child: Text(
                'Deposit Records',
                style: pubTextStyle(
                    const Color(0xFF3EA1F8), 22.sp, FontWeight.w400),
              ),
              onPressed: () => {
                    Toast.show('msg'),
                  }),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              // physics: const ClampingScrollPhysics(),
              physics: const ClampingScrollPhysics(),
              child: Container(
                margin: EdgeInsets.fromLTRB(20.w, 13.h, 20.w, 0),
                width: double.infinity,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: onlineDeposit(
                            isSele: true,
                            name: 'Online Deposit',
                            isHave: true,
                            nameRight: 'Free1%',
                          ),
                        ),
                        SizedBox(
                          width: 14.h,
                        ),
                        Expanded(
                          flex: 1,
                          child: onlineDeposit(
                            isHave: false,
                            name: 'Transfer and Deposit',
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Divider(
                      color: const Color.fromRGBO(93, 101, 111, 0.40),
                      height: 1.h,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: onlineDeposit(
                            isSele: true,
                            name: 'Gcash',
                            isHave: true,
                            nameRight: 'Free0.5-1%',
                            img: 'assets/images/user/ic_gcash.webp',
                          ),
                        ),
                        SizedBox(
                          width: 14.w,
                        ),
                        Expanded(
                          flex: 1,
                          child: onlineDeposit(
                            name: 'Maya',
                            isHave: true,
                            nameRight: 'Free0.5-1%',
                            img: 'assets/images/user/ic_maya.webp',
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Divider(
                      color: const Color.fromRGBO(93, 101, 111, 0.40),
                      height: 1.h,
                    ),
                    SizedBox(
                      height: 17.h,
                    ),
                    SizedBox(
                      height: 245.h,
                      child: MediaQuery.removePadding(
                        removeTop: true,
                        removeBottom: true,
                        context: context,
                        child: GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: list.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    mainAxisSpacing: 7.w,
                                    crossAxisSpacing: 14.h,
                                    childAspectRatio: 223 / 115),
                            itemBuilder: (BuildContext context, int index) {
                              return onlineDeposit(
                                isSele: index == 0 || index == 1 ? true : false,
                                name: 'Gcash',
                              );
                            }),
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    CupertinoButton(
                        padding: EdgeInsets.zero,
                        minSize: 0,
                        child: Row(
                          children: [
                            const Expanded(child: SizedBox()),
                            Text(
                              'Expand',
                              style: pubTextStyle(const Color(0xFF3EA1F8),
                                  24.sp, FontWeight.w400),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Image(
                              image: const AssetImage(
                                  'assets/images/user/ic_haircut.webp'),
                              width: 12.w,
                              height: 21.h,
                            ),
                            const Expanded(child: SizedBox()),
                          ],
                        ),
                        onPressed: () => {
                              Toast.show('msg'),
                            }),
                    SizedBox(
                      height: 23.h,
                    ),
                    Divider(
                      color: const Color.fromRGBO(93, 101, 111, 0.40),
                      height: 1.h,
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Deposit Amount',
                          style: pubTextStyle(
                              const Color(0xFFffffff), 26.sp, FontWeight.w400),
                        ),
                        CupertinoButton(
                            padding: EdgeInsets.zero,
                            minSize: 0,
                            child: Text(
                              'Additional bonus event details',
                              style: pubTextStyle(const Color(0xFF3EA1F8),
                                  24.sp, FontWeight.w400),
                            ),
                            onPressed: () => {
                                  Toast.show('msg'),
                                }),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                      height: 245.h,
                      child: MediaQuery.removePadding(
                        removeTop: true,
                        removeBottom: true,
                        context: context,
                        child: GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: list.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4,
                                    mainAxisSpacing: 7.w,
                                    crossAxisSpacing: 14.h,
                                    childAspectRatio: 162 / 115),
                            itemBuilder: (BuildContext context, int index) {
                              return onlineDeposit(
                                isHave: index == 0 || index == 1 ? true : false,
                                name: '1000',
                                nameRight: '0.5%+10',
                              );
                            }),
                      ),
                    ),
                    SizedBox(
                      height: 27.h,
                    ),
                    Container(
                      height: 70.h,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.fromLTRB(23.w, 0, 23.w, 0),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C1F),
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(
                            color: const Color.fromRGBO(93, 101, 111, 0.40),
                            width: 1.w),
                      ),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '₱',
                            style: TextStyle(
                              fontSize: 32.sp,
                              color: const Color(0xFFffffff),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          // SizedBox(width: 24.px,),
                          Expanded(
                            flex: 1,
                            child: TextField(
                              controller: TextEditingController(),
                              maxLines: 1,
                              style: pubTextStyle(const Color(0xFFffffff),
                                  24.sp, FontWeight.w400),
                              onChanged: (text) async {},
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(
                                    left: 24.w,
                                    right: 0.w,
                                    top: -23.h,
                                    bottom: 0.h),
                                hintText: 'Min 100, Max 50000',
                                hintStyle: pubTextStyle(const Color(0xFF5D656F),
                                    24.sp, FontWeight.w400),
                                // suffixIcon: IconButton(
                                //     onPressed: () => {
                                //       Toast.show('msg'),
                                //     },
                                //     icon: Image(
                                //       image: AssetImage(
                                //           'assets/images/user/vector2.webp'),width: 28.px,))
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Tips',
                        style: pubTextStyle(
                            const Color(0xFFffffff), 22.sp, FontWeight.w400),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      'It is the first time to use payment, please cooperate with scanning face to pay successfully, thank you!',
                      style: pubTextStyle(
                          const Color(0xFF5D656F), 22.sp, FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),
          ),
          CupertinoButton(
              padding: EdgeInsets.zero,
              minSize: 0,
              child: Container(
                height: 104.h,
                width: 710.w,
                margin: EdgeInsets.only(bottom: 26.h, top: 24.h),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xFF3EA1F8),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Text(
                  'Deposit Now',
                  style: pubTextStyle(
                      const Color(0xFFffffff), 26.sp, FontWeight.w700),
                ),
              ),
              onPressed: () => {
                    Toast.show('msg'),
                  }),
          SizedBox(
            height: 26.h,
          ),
        ],
        // ),
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<Deposit_PHLogic>();
    super.dispose();
  }
}
