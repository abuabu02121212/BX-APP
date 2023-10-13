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
import 'message_center_logic.dart';

class Message_centerPage extends StatefulWidget {
  const Message_centerPage({Key? key}) : super(key: key);

  @override
  State<Message_centerPage> createState() => _Message_centerPageState();
}

class _Message_centerPageState extends State<Message_centerPage> {
  final logic = Get.put(Message_centerLogic());
  final state = Get.find<Message_centerLogic>().state;

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldPH(
      backgroundColor: blackBgColor_h,
      appBar: BaseAppbarPH(
        title: 'Message Center',
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.zero,
            height: 90.px,
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
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
              onTap: (index) => {
                logic.pageController.jumpToPage(index),
              },
              tabs: [
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Support',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Tab(
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'News',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Positioned(
                        right: 0,
                        child: Container(
                          padding:
                              EdgeInsets.fromLTRB(12.px, 3.px, 12.px, 12.px),
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/user/ic_tip_bubble.webp'),
                                  fit: BoxFit.fill)),
                          child: Text(
                            '99+',
                            style: pubTextStyle(const Color(0xFFffffff), 22.sp,
                                FontWeight.w400),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Notice',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Marquee',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Feedback\nRewards',
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
                  _getSupport(),
                  _getNews(),
                  _getSupport(),
                  _getSupport(),
                  _getSupport(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getSupport() {
    return ListView.separated(
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 24.px,
          );
        },
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 180.px,
            alignment: Alignment.center,
            padding: EdgeInsets.all(30.px),
            decoration: pubBoxDecoration(),
            child: Row(
              children: [
                Image(
                  image: AssetImage('assets/images/user/ic_msg_head.webp'),
                  width: 120.px,
                ),
                SizedBox(
                  width: 30.px,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '7X24 Online Support',
                        style: pubTextStyle_default(type: 1, size: 28.sp),
                      ),
                      Text(
                        'Full-time customer service isonline for translation,solvingproblems considerately',
                        style: pubTextStyle_default(type: 4, size: 22.sp),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 55.px,
                ),
                CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: Container(
                      width: 160.px,
                      height: 60.px,
                      alignment: Alignment.center,
                      decoration: pubBoxDecoration_r(
                          color: Color(0xff3EA1F8), rs: 30.px),
                      child: Text(
                        'Enter',
                        style: pubTextStyle_default(
                            type: 1, size: 26.sp, fontWeight: FontWeight.w700),
                      ),
                    ),
                    onPressed: () => {
                          Toast.show('msg'),
                        })
              ],
            ),
          );
        });
  }

  Widget _getNews() {
    return ListView.separated(
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 24.px,
          );
        },
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return CupertinoButton(
              padding: EdgeInsets.zero,
              child: Container(
                height: 116.px,
                alignment: Alignment.center,
                padding: EdgeInsets.fromLTRB(30.px, 26.px, 30.px, 26.px),
                decoration: pubBoxDecoration(),
                child: Row(
                  children: [
                    Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 14.px,right: 14.px),
                          child:  Image(
                            image: AssetImage('assets/images/user/ic_msg.webp'),
                            width: 56.px,
                          ),
                        ),

                        Positioned(
                            top: 0,
                            right: 0,
                            child: Container(
                          width: 20.px,
                          height: 20.px,
                          decoration: pubBoxDecoration_r(color: Color(0xffD94F39),rs: 10.px),
                        ))
                      ],
                    ),

                    SizedBox(
                      width: 30.px,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '7X24 Online Support',
                          maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: pubTextStyle_default(type: 1, size: 28.sp),
                          ),
                          Text(
                            'Full-time customer service isonline for translation,solvingproblems considerately',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: pubTextStyle_default(type: 4, size: 22.sp),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 106.px,
                    ),
                    Container(
                      width: 160.px,
                      height: 60.px,
                      alignment: Alignment.center,
                      decoration: pubBoxDecoration_r(
                          color: Color(0xff3EA1F8), rs: 30.px),
                      child: Text(
                        'Enter',
                        style: pubTextStyle_default(
                            type: 1, size: 26.sp, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
              ),
              onPressed: () => {
                    Toast.show('msg'),
                    // ),
                  });
        });
  }

  @override
  void dispose() {
    Get.delete<Message_centerLogic>();
    super.dispose();
  }
}
