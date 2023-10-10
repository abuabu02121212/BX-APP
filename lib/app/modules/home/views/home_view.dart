import 'package:flutter/material.dart';
import 'package:flutter_comm/app/modules/home/views/swiper_component.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import '../../../../widget/back_event_interceptor.dart';
import '../../../app_style.dart';
import '../../../component/nested_scroll_widget.dart';
import '../controllers/home_controller.dart';
import 'game_list_item_widget.dart';
import 'game_type_tab_component.dart';
import 'home_widgets.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  @override
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leadingWidth: 0,
      //   titleSpacing: 0,
      //   toolbarHeight: 110.w,
      //   title: HomeHeader(),
      //   centerTitle: true,
      // ),
      body: SafeArea(
        child: BackInterceptorWidget(
          isInterceptor: (obj) {
            return controller.consumePressedRecord();
          },
          child: NestedScrollBodyWidget(),
        ),
      ),
    );
  }
}

class NestedScrollBodyWidget extends StatelessWidget {
  NestedScrollBodyWidget({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: MyNestedScrollWidget(
        controller: controller.gameListScrollController,
        topTitle: HomeHeader(),
        collapsedHeight: 230.w,
        expandedHeight: 510.w ,
        toolbarHeight: 110.w,
        bottomTitle: SizedBox(
          width: double.infinity,
          height: 120.w,
          child: HomeGameTabsWidget(controller: controller),
        ),
        background: Column(
          children: [
            SizedBox(height: 110.w),
            SizedBox(
              width: double.infinity,
              height: 220.w,
              child: SwiperComponent(radius: 0),
            ),
            //  const ActivityWidget(),
            HomeMarquee(),
          ],
        ),
        sliverWidgetList: [
          ...List.generate(
              gameTabNameList.length,
                  (index) => GameListItemWidget(
                index: index,
                title: gameTabNameList[index],
              )),
          SliverToBoxAdapter(child: HomeBottomWidget())],
      ),
    );
  }
}

class HomeGameTabsWidget extends StatelessWidget {
  const HomeGameTabsWidget({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bottomBgColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Obx(() {
            var isShowing = controller.isShowGameTypeLeftArrow.value;
            return Opacity(
              opacity: isShowing ? 1 : 0,
              child: Transform.rotate(angle: 3.14, child: Image.asset("assets/images/arrow_gray.webp", width: 12.w)),
            );
          }),
          SizedBox(
            width: 5.w,
          ),
          SizedBox(
            width: 715.w,
            child: GameTypeTabs(
                indicatorTabController: controller.gameTypeIndicatorTabController,
                onSelectChanged: (int index, bool isClick) {
                  if(isClick){
                    controller.switchTabWithAddPressedRecord(index);
                  }

                }),
          ),
          SizedBox(
            width: 5.w,
          ),
          Obx(() {
            var isShowing = controller.isShowGameTypeRightArrow.value;
            return Opacity(
              opacity: isShowing ? 1 : 0,
              child: Transform.rotate(angle: 0, child: Image.asset("assets/images/arrow_gray.webp", width: 12.w)),
            );
          }),
        ],
      ),
    );
  }
}
