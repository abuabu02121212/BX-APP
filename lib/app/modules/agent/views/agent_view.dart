import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_comm/app/modules/agent/views/tab_component.dart';
import 'package:flutter_comm/util/size.dart';
import 'package:flutter_comm/util/toast_util.dart';
import 'package:flutter_comm/widget/horizontal_indicator_tab.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../../generated/l10n.dart';
import '../../../app_style.dart';
import '../../../component/app_header.dart';
import '../../../component/nested_scroll_widget.dart';
import '../controllers/agent_controller.dart';

class AgentView extends GetView<AgentController> {
  const AgentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: ,
      //   centerTitle: true,
      //   titleSpacing: 0,
      //   leadingWidth: 0,
      //   toolbarHeight: 90.w,
      // ),
      body: SafeArea(
        child: NestedScrollBodyWidget(),
      ),
    );
  }
}

class NestedScrollBodyWidget extends StatelessWidget {
  NestedScrollBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // titleBar高度
    double toolbarHeight = 110.w;
    // 折叠内容高度
    double collapsedHeight = 216.w;
    // 折叠悬浮控件高度
    double collapseFloatWidgetHeight = 120.w;
    return Container(
      decoration: const BoxDecoration(color: headerBgColor),
      child: MyNestedScrollWidget(
        controller: ScrollController(),
        topTitle: MyPageAppHeader(toolbarHeight),
        collapsedHeight: collapsedHeight + 13.w,
        expandedHeight: toolbarHeight + collapsedHeight + collapseFloatWidgetHeight,
        toolbarHeight: toolbarHeight,
        bottomTitle: CollapseFloatWidget(bottomFloatWidgetHeight: collapseFloatWidgetHeight),
        background: Column(
          children: [SizedBox(height: toolbarHeight), AgentUserInfoWidget(collapsedHeight: collapsedHeight)],
        ),
        sliverWidgetList: [
          const Box1Widget(),
          const Box2Widget(),
          const Box3Widget(),
          const Box4Widget(),
          const Box3Widget(),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, listIndex) => Container(
                      height: 50,
                      color: Colors.primaries[(listIndex) % Colors.primaries.length],
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(bottom: 4),
                      child: Text(
                        '$listIndex',
                        style: const TextStyle(color: Colors.black, fontSize: 10),
                      ),
                    ),
                childCount: 3),
          ),
        ],
      ),
    );
  }

  Widget MyPageAppHeader(double toolbarHeight) {
    return AppHeader(
      height: toolbarHeight,
      titleWidget: Text(
        "Agent",
        style: TextStyle(
          fontSize: 32.w,
          color: const Color(0xffffffff),
          fontWeight: FontWeight.w400,
        ),
      ),
      isNeedLeftBackArrow: true,
      bottomWidget: CupertinoButton(
        padding: EdgeInsets.only(left: 10.w, right: 20.w, top: 15.w, bottom: 15.w),
        onPressed: () {
          Toast.show("getx");
        },
        child: Text(
          S.current.History,
          style: TextStyle(
            fontSize: 22.w,
            color: const Color(0xff3EA1F8),
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}

class Box1Widget extends StatelessWidget {
  const Box1Widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        width: 710.w,
        height: 170.w,
        margin: EdgeInsets.only(top: 30.w, left: 20.w, right: 20.w, bottom: 20.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.w),
            color: const Color(0xff252527),
            border: Border.all(
              color: const Color.fromRGBO(93, 101, 111, 0.40),
              width: 1.w,
            )),
        padding: EdgeInsets.only(left: 20.px),
        child: Row(
          children: [
            const HeaderWidget(
              textBgColor: Color(0xff3EA1F8),
              text: 'A',
            ),
            SizedBox(
              width: 20.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                EasyRichText(
                  S.current.C3_is_powerful(" 22/100"),
                  defaultStyle: TextStyle(fontSize: 22.w, color: const Color(0xff8F9DAB)),
                  patternList: [
                    EasyRichTextPattern(
                      targetString: '22/100',
                      style: const TextStyle(color: Color(0xffF0A11B)),
                    ),
                  ],
                ),
                EasyRichText(
                  S.current.agent_total_info("33", "242", "343"),
                  defaultStyle: TextStyle(fontSize: 22.w, color: const Color(0xffffffff)),
                  patternList: [
                    EasyRichTextPattern(
                      targetString: '33',
                      style: const TextStyle(color: Color(0xffF0A11B)),
                    ),
                    EasyRichTextPattern(
                      targetString: '242',
                      style: const TextStyle(color: Color(0xffF0A11B)),
                    ),
                    EasyRichTextPattern(
                      targetString: '343',
                      style: const TextStyle(color: Color(0xffF0A11B)),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
    required this.textBgColor,
    required this.text,
  });

  final Color textBgColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/images/agent_header_1.webp", width: 120.w),
        Positioned(
          bottom: 0.w,
          right: 0.w,
          child: Container(
            width: 40.w,
            height: 40.w,
            padding: EdgeInsets.only(left: 0.w, right: 0.w, top: 0.w, bottom: 0.w),
            decoration: BoxDecoration(
              color: textBgColor,
              borderRadius: BorderRadius.circular(20.w),
            ),
            alignment: Alignment.center,
            child: Text(
              text,
              style: TextStyle(
                fontSize: 24.w,
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        )
      ],
    );
  }
}

class Box2Widget extends StatelessWidget {
  const Box2Widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.only(top: 30.w, left: 30.w, right: 30.w, bottom: 80.w),
        //   color: Colors.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Transform.rotate(
              angle: -3.14 * 0.168,
              child: Stack(children: [
                Transform.translate(
                  offset: Offset(0, -10.w),
                  child: Transform.rotate(
                    angle: 3.14 * 0.168,
                    child: Image.asset("assets/images/agent_arrow_2.png", width: 250.w),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 24.w,
                    ),
                    EasyRichText(
                      S.current.Contribution_by_B1(" 888"),
                      defaultStyle: TextStyle(fontSize: 22.w, color: const Color(0xffffffff)),
                      patternList: [
                        EasyRichTextPattern(
                          targetString: '888',
                          style: const TextStyle(color: Color(0xffF0A11B)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30.w,
                    ),
                    EasyRichText(
                      S.current.OtherC1_and_C2(" 888"),
                      defaultStyle: TextStyle(fontSize: 22.w, color: const Color(0xffffffff)),
                      patternList: [
                        EasyRichTextPattern(
                          targetString: '888',
                          style: const TextStyle(color: Color(0xffF0A11B)),
                        ),
                      ],
                    )
                  ],
                ),
              ]),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/images/agent_arrow_1.png", width: 40.w),
                EasyRichText(
                  S.current.ContributeToA(" 888"),
                  defaultStyle: TextStyle(fontSize: 22.w, color: const Color(0xffffffff)),
                  textAlign: TextAlign.center,
                  patternList: [
                    EasyRichTextPattern(
                      targetString: '888',
                      style: const TextStyle(color: Color(0xffF0A11B)),
                    ),
                  ],
                )
              ],
            ),
            Transform.rotate(
              angle: 3.14 * 0.168,
              child: Stack(children: [
                Transform.translate(
                  offset: Offset(0, -10.w),
                  child: Transform.rotate(
                    angle: -3.14 * 0.168,
                    child: Image.asset("assets/images/agent_arrow_3.png", width: 250.w),
                  ),
                ),
                Container(
                  //  color: Colors.blue,
                  padding: EdgeInsets.only(left: 20.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 24.w,
                      ),
                      EasyRichText(
                        S.current.B3Contribution(" 888"),
                        defaultStyle: TextStyle(fontSize: 22.w, color: const Color(0xffffffff)),
                        patternList: [
                          EasyRichTextPattern(
                            targetString: '888',
                            style: const TextStyle(color: Color(0xffF0A11B)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30.w,
                      ),
                      EasyRichText(
                        S.current.OtherC3Contribute(" 1"),
                        defaultStyle: TextStyle(fontSize: 22.w, color: const Color(0xffffffff)),
                        patternList: [
                          EasyRichTextPattern(
                            targetString: '1',
                            style: const TextStyle(color: Color(0xffF0A11B)),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class Box3Widget extends StatelessWidget {
  const Box3Widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(bottom: 20.w, left: 20.w, right: 20.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [HeaderCardItemWidget(), HeaderCardItemWidget(), HeaderCardItemWidget()],
        ),
      ),
    );
  }
}

class Box4Widget extends StatelessWidget {
  const Box4Widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(bottom: 20.w, left: 20.w, right: 20.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            ArrowRelationItemWidget(),
            ArrowRelationItemWidget(arrImgType: 2),
            ArrowRelationItemWidget(),
          ],
        ),
      ),
    );
  }
}

class ArrowRelationItemWidget extends StatelessWidget {
  const ArrowRelationItemWidget({
    super.key,
    this.arrImgType = 1,
  });

  final int arrImgType;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220.w,
      padding: EdgeInsets.only(left: 0.w, right: 0.w, top: 10.w, bottom: 0.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (arrImgType == 1)
            Image.asset("assets/images/agent_arrow_4.png", height: 60.w)
          else
            Transform.translate(offset: Offset(-90.w, 0), child: Image.asset("assets/images/agent_arrow_5.png", height: 60.w)),
          SizedBox(
            height: 20.w,
          ),
          EasyRichText(
            "Contribution to A: \n350 \nContribute to B1: \n350",
            textAlign: TextAlign.center,
            defaultStyle: TextStyle(
              fontSize: 24.w,
              color: const Color(0xffcccccc),
              fontWeight: FontWeight.w400,
            ),
            patternList: [
              EasyRichTextPattern(
                targetString: '\n350',
                style: const TextStyle(color: Color(0xffF0A11B)),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class HeaderCardItemWidget extends StatelessWidget {
  const HeaderCardItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          width: 220.w,
          height: 266.w,
          margin: EdgeInsets.only(top: 60.w),
          padding: EdgeInsets.only(left: 0.w, right: 0.w, top: 0.w, bottom: 0.w),
          decoration: BoxDecoration(
            color: const Color(0xff1A1C1F),
            borderRadius: BorderRadius.circular(16.w),
            border: Border.all(color: const Color.fromRGBO(93, 101, 111, 0.40), width: 1.w),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 70.w,
              ),
              Container(
                height: 140.w,
                padding: EdgeInsets.only(left: 10.w, right: 10.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Sub agent generally, earning",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22.w,
                        color: const Color(0xff8F9DAB),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "35/10K",
                      style: TextStyle(
                        fontSize: 22.w,
                        color: const Color(0xffF09C1B),
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 1.w,
                decoration: const BoxDecoration(color: Color.fromRGBO(93, 101, 111, 0.40)),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Valid Bets 40K",
                    style: TextStyle(
                      fontSize: 22.w,
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        const HeaderWidget(
          textBgColor: Color(0xff3EA1F8),
          text: 'A',
        ),
      ],
    );
  }
}

class AgentUserInfoWidget extends StatelessWidget {
  const AgentUserInfoWidget({
    super.key,
    required this.collapsedHeight,
  });

  final double collapsedHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: collapsedHeight,
      padding: EdgeInsets.only(left: 0.w, right: 0.w, top: 0.w, bottom: 0.w),
      decoration: const BoxDecoration(color: headerBgColor),
      alignment: Alignment.center,
      child: Container(
        width: 710.w,
        height: 170.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.w),
            color: const Color(0xff252527),
            border: Border.all(
              color: const Color.fromRGBO(93, 101, 111, 0.40),
              width: 1.w,
            )),
        padding: EdgeInsets.fromLTRB(20.px, 0.px, 20.px, 0.px),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Image(
                  image: const AssetImage('assets/images/user/bg_vip.webp'),
                  width: 135.px,
                ),
                Positioned(
                  bottom: 2.px,
                  right: 0.px,
                  left: 0.px,
                  child: Text(
                    '${S.current.VIP}1',
                    textAlign: TextAlign.center,
                    style: pubTextStyle(const Color(0xffffffff), 21.sp, FontWeight.w700),
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
                  TextSpan(text: "Player ID:  ", style: pubTextStyle(const Color(0xff8F9DAB), 24.w, FontWeight.w400)),
                  TextSpan(text: 'dfsdfsfs124', style: pubTextStyle(const Color(0xffffffff), 24.w, FontWeight.w700)),
                ])),
                SizedBox(
                  height: 10.px,
                ),
                Text.rich(TextSpan(children: [
                  TextSpan(text: "Upline ID:  ", style: pubTextStyle(const Color(0xff8F9DAB), 24.w, FontWeight.w400)),
                  TextSpan(text: 'dssdfsdfdsds', style: pubTextStyle(const Color(0xffffffff), 24.w, FontWeight.w700)),
                ])),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CollapseFloatWidget extends StatelessWidget {
  const CollapseFloatWidget({
    super.key,
    required this.bottomFloatWidgetHeight,
  });

  final double bottomFloatWidgetHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: bottomFloatWidgetHeight,
      child: Container(
        padding: EdgeInsets.only(left: 0.w, right: 0.w, top: 0.w, bottom: 0.w),
        child: AgentHorizontalTab(
          onSelectChanged: (int t, bool v) {},
          indicatorTabController: IndicatorTabController(),
        ),
      ),
    );
  }
}
