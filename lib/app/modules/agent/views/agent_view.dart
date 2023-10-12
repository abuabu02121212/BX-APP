import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_comm/util/toast_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../../generated/l10n.dart';
import '../../../app_style.dart';
import '../../../component/app_header.dart';
import '../../../component/nested_scroll_widget.dart';
import '../../home/views/home_view.dart';
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
          children: [
            SizedBox(height: toolbarHeight),
            Container(
              width: double.infinity,
              height: collapsedHeight,
              padding: EdgeInsets.only(left: 0.w, right: 0.w, top: 0.w, bottom: 0.w),
              decoration: BoxDecoration(
                color: headerBgColor,
              ),
              alignment: Alignment.center,
              child: Container(
                width: 710.w,
                height: 170.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.w),
                    border: Border.all(
                  color: const Color.fromRGBO(93, 101, 111, 0.40),
                  width: 1.w,
                )),
              ),
            )
          ],
        ),
        sliverWidgetList: [
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
                childCount: 20),
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
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(12.w),
          border: Border.all(color: const Color(0xff000000), width: 1.w),
        ),
        child: const SizedBox(),
      ),
    );
  }
}
