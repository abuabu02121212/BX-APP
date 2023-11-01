import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_comm/util/size.dart';
import 'package:flutter_comm/util/toast_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../generated/l10n.dart';
import '../../../util/base_appbar_ph.dart';
import '../../../util/base_scaffold_ph.dart';
import '../../../widget/lower_part.dart';
import '../../../widget/online_deposit.dart';
import '../../../widget/pub_bot.dart';
import '../../app_style.dart';
import '../../component/app_empty_promotion.dart';
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
        title: S.current.MessageCenter,
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
                      S.current.Support,
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
                          S.current.News,
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
                      S.current.Notice,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      S.current.Marquee,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      S.current.FeedbackRewards,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(
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
                  _getNotice(),
                  _getMarquee(),
                  _getFeedbackRewards(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getMyFeedBackR() {
    return Column(
      children: [
        AppEmptyPromotion(
          width: 710.px,
          height: 500.px,
          name: S.current.Nofeedback,
        ),
      ],
    );
  }

  Widget _getMyFeedBackL() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              S.current.FeedbackContent,
              style: pubTextStyle_default(type: 1, size: 26.sp),
            ),
            SizedBox(
              width: 11.px,
            ),
            Text(
              S.current.Suggestions_revision,
              style: pubTextStyle_default(size: 26.sp),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 20.px),
          height: 220.px,
          alignment: Alignment.centerLeft,
          decoration: pubBoxDecoration(color: const Color(0xff1A1C1F)),
          padding: EdgeInsets.all(22.px),
          child: TextField(
            controller: TextEditingController(),
            maxLines: 5,
            cursorColor: const Color(0xffffffff),
            style:
                pubTextStyle(const Color(0xFFffffff), 24.sp, FontWeight.w400),
            onChanged: (text) async {},
            decoration: InputDecoration(
              border: InputBorder.none,
              // contentPadding: EdgeInsets.only(
              //     left: 24.px, right: 0.px, top: 0.px, bottom: 7.px),
              hintText: S.current.Any_opinion_you,
              hintStyle: pubTextStyle_default(),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 12.px, right: 22.px, bottom: 18.px),
          alignment: Alignment.centerRight,
          child: Text(
            '0/200',
            style: pubTextStyle_default(type: 4),
          ),
        ),
        Row(
          children: [
            Text(
              S.current.AttachPhotoHere,
              style: pubTextStyle_default(type: 1, size: 26.sp),
            ),
            SizedBox(
              width: 11.px,
            ),
            Text(
              S.current.Easier_adopted,
              style: pubTextStyle_default(size: 26.sp),
            ),
          ],
        ),
        Container(
          height: 120.px,
          margin: EdgeInsets.only(top: 19.px),
          child: Row(
            children: [
              CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: Container(
                    height: 120.px,
                    width: 120.px,
                    alignment: Alignment.center,
                    decoration:
                        pubBoxDecoration(color: const Color(0xff1A1C1F)),
                    child: Image(
                      image: const AssetImage('assets/images/user/ic_add.webp'),
                      width: 38.px,
                    ),
                  ),
                  onPressed: () => {
                        Toast.show('msg'),
                      }),
              SizedBox(
                width: 24.px,
              ),
              Text(
                'Image and video (not',
                style: TextStyle(
                  color: const Color(0xff5D656F),
                  fontWeight: FontWeight.w400,
                  fontSize: 24.sp,
                ),
                maxLines: null,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 50.px,
        ),
        Text(
          S.current.RewardRules,
          style: pubTextStyle_default(type: 1, size: 26.sp),
        ),
        Container(
          margin: EdgeInsets.only(top: 16.px),
          child: Text(
            S.current.A_large_reward,
            style: pubTextStyle_default(type: 4),
          ),
        ),
      ],
    );
  }

  Widget _getFeedbackRewards() {
    return Obx(
      () => Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 24.px, left: 20.px, right: 20.px),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: onlineDeposit(
                        isSele: state.isCREATE.value,
                        name: S.current.CREATE,
                        click: (name) => {
                          state.isCREATE.value = true,
                          state.isCREATE.refresh(),
                        },
                      ),
                    ),
                    SizedBox(
                      width: 14.px,
                    ),
                    Expanded(
                      flex: 1,
                      child: onlineDeposit(
                        isSele: !(state.isCREATE.value),
                        name: S.current.MY_FEEDBACK,
                        click: (name) => {
                          state.isCREATE.value = false,
                          state.isCREATE.refresh(),
                        },
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 49.px),
                  child: state.isCREATE.value
                      ? _getMyFeedBackL()
                      : _getMyFeedBackR(),
                ),
              ],
            ),
          ),
          const Expanded(child: SizedBox()),
          Container(
            width: double.infinity,
            color: const Color(0xff1A1C1F),
            child: state.isCREATE.value
                ? PubBot(
                    name: S.current.SubmitFeedback,
                    click: () => {Toast.show('fdafa')},
                  )
                : Lowerpart(
                    name: '0.01',
                    click: () => {Toast.show('fdafa')},
                  ),
          ),
        ],
      ),
    );
  }

  Widget _getMarquee() {
    return Container(
      padding: EdgeInsets.only(top: 24.px, left: 20.px, right: 20.px),
      child: ListView.separated(
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
                  decoration: pubBoxDecoration(color: const Color(0xff1A1C1F)),
                  child: Row(
                    children: [
                      Image(
                        image: const AssetImage('assets/images/i-notice.webp'),
                        width: 43.px,
                      ),
                      SizedBox(
                        width: 24.px,
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Full-time customer service isonline for translation,solvingproblems considerately',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: pubTextStyle_default(type: 1, size: 28.sp),
                        ),
                      ),
                      SizedBox(
                        width: 48.px,
                      ),
                      Image(
                        image: const AssetImage(
                            'assets/images/user/ic_arrow_ash_deep.webp'),
                        width: 12.px,
                      ),
                    ],
                  ),
                ),
                onPressed: () => {
                      Toast.show('msg'),
                    });
          }),
    );
  }

  Widget _getNotice() {
    return AppEmptyPromotion(
      width: 710.px,
      height: 500.px,
      name: S.current.NoMessages,
    );
  }

  Widget _getNews() {
    return Container(
      padding: EdgeInsets.only(top: 24.px, left: 20.px, right: 20.px),
      child: ListView.separated(
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
                  decoration: pubBoxDecoration(color: const Color(0xff1A1C1F)),
                  alignment: Alignment.center,
                  padding: EdgeInsets.fromLTRB(30.px, 26.px, 30.px, 26.px),
                  child: Row(
                    children: [
                      index.isEven
                          ? Image(
                              image: const AssetImage(
                                  'assets/images/user/ic_read_msg.webp'),
                              width: 56.px,
                            )
                          : Stack(
                              children: [
                                Container(
                                  padding:
                                      EdgeInsets.only(top: 14.px, right: 14.px),
                                  child: Image(
                                    image: const AssetImage(
                                        'assets/images/user/ic_msg.webp'),
                                    width: 56.px,
                                  ),
                                ),
                                Positioned(
                                    top: 0,
                                    right: 0,
                                    child: Container(
                                      width: 20.px,
                                      height: 20.px,
                                      decoration: pubBoxDecoration_r(
                                          color: const Color(0xffD94F39),
                                          rs: 10.px),
                                    ))
                              ],
                            ),
                      SizedBox(
                        width: 30.px,
                      ),
                      Expanded(
                        flex: 1,
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
                      index.isEven
                          ? Text(
                              S.current.Read,
                              style: pubTextStyle_default(
                                type: 4,
                              ),
                            )
                          : Text(
                              S.current.Unread,
                              style: pubTextStyle_default(
                                type: 1,
                              ),
                            ),
                      SizedBox(
                        width: 30.px,
                      ),
                      Image(
                        image: const AssetImage(
                            'assets/images/user/ic_arrow_ash_deep.webp'),
                        width: 12.px,
                      ),
                    ],
                  ),
                ),
                onPressed: () => {
                      Toast.show('msg'),
                    });
          }),
    );
  }

  Widget _getSupport() {
    return Container(
      padding: EdgeInsets.only(top: 24.px, left: 20.px, right: 20.px),
      child: ListView.separated(
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
                    image:
                        const AssetImage('assets/images/user/ic_msg_head.webp'),
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
                            color: const Color(0xff3EA1F8), rs: 30.px),
                        child: Text(
                          S.current.Enter,
                          style: pubTextStyle_default(
                              type: 1,
                              size: 26.sp,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      onPressed: () => {
                            Toast.show('msg'),
                          })
                ],
              ),
            );
          }),
    );
  }

  @override
  void dispose() {
    Get.delete<Message_centerLogic>();
    super.dispose();
  }
}
