import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_comm/app/entity/game_type.dart';
import 'package:flutter_comm/app/modules/home/views/swiper_component.dart';
import 'package:flutter_comm/app/modules/home/views/tag_component.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import '../../../../util/entity/entites.dart';
import '../../../../util/extensions.dart';
import '../../../../widget/back_event_interceptor.dart';
import '../../../app_style.dart';
import '../../../component/app_empty.dart';
import '../../../entity/game_item.dart';
import '../controllers/home_controller.dart';
import 'home_widgets.dart';
import 'game_type_list.dart';
import 'game_type_title_bar.dart';
import 'last_win_widget.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  @override
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 0,
        titleSpacing: 0,
        toolbarHeight: 110.w,
        title: HomeHeader(),
        centerTitle: true,
      ),
      body: SafeArea(
        child: BackInterceptorWidget(
          isInterceptor: (obj) {
            return controller.consumePressedRecord();
          },
          child: Center(
            child: Container(
              color: Colors.black,
              width: double.infinity,
              height: double.infinity,
              alignment: Alignment.topLeft,
              child: SingleChildScrollView(
                padding: EdgeInsets.zero,
                controller: controller.scrollController,
                physics: const BouncingScrollPhysics(),
                child: ItemGenerateWidget(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ItemGenerateWidget extends StatelessWidget {
  ItemGenerateWidget({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: double.infinity,
          height: 280.w,
          child: SwiperComponent(
            radius: 0,
          ),
        ),
        HomeMarquee(),
        HomeGameTypesBarWidget(),
        Obx(() {
          var tabIndex = controller.selectedGameTypeIndex.value;
          if (tabIndex == 0) {
            return RecPageWidget(controller: controller);
          } else if (tabIndex == 1) {
            return FavPageWidget(controller: controller);
          }
          return Tab2PageWidget(controller: controller);
        }),
        SizedBox(height: 125.w),
      ],
    );
  }
}

class Tab2PageWidget extends StatelessWidget {
  const Tab2PageWidget({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView.builder(
          itemCount: controller.tab2List.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            AppRxList<GameEntity> gameRxList = controller.tab2List[index];
            return Tab2PageHorizontalListItemWidget(
              controller: controller,
              list: gameRxList,
              listItemIndex: index,
            );
          });
    });
  }
}

class RecPageWidget extends StatelessWidget {
  const RecPageWidget({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...List.generate(controller.recList.length, (index) {
          return Tab01HorizontalGameItemListWidget(
            list: controller.recList[index],
            listItemIndex: index,
          );
        }),
        WinListWidget(),
        BrandListWidget(),
        Container(
          width: double.infinity,
          height: 94.w,
          decoration: const BoxDecoration(color: Color(0xff011A51)),
          margin: EdgeInsets.only(bottom: 110.w),
          alignment: Alignment.center,
          child: Text(
            "Copyright © All Rights Reserved by Luckyking",
            style: TextStyle(
              fontSize: 24.w,
              color: const Color.fromRGBO(255, 255, 255, 0.60),
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}

class FavPageWidget extends StatelessWidget {
  const FavPageWidget({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...List.generate(controller.tab1List.length, (index) {
            return Tab01HorizontalGameItemListWidget(
              list: controller.tab1List[index],
              listItemIndex: index,
            );
          }),
        ],
      );
    });
  }
}

class Tab2PageHorizontalListItemWidget extends StatelessWidget {
  Tab2PageHorizontalListItemWidget({
    super.key,
    required this.controller,
    required this.list,
    required this.listItemIndex,
  }) {
    scrollController.addListener(_scrollListener);
  }

  //  滚动监听回调
  Future<void> _scrollListener() async {
    if (scrollController.offset >= scrollController.position.maxScrollExtent && !scrollController.position.outOfRange) {
      var tabIndex = controller.level2TabSelectedIndexMap.getIndexRxByPos(listItemIndex).value;
      await controller.onLevel2ListItemTabSwitch(tabIndex, listItemIndex: listItemIndex, pageIndex: -2);
    }
  }

  final HomeController controller;
  final AppRxList<GameEntity> list;
  final int listItemIndex;
  final pageIndex = 1.obs;
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GameTypeTitleBar(
          listItemIndex: listItemIndex, typeName: list.strExt ?? "",
        ),
        Container(
          margin: EdgeInsets.only(top: 27.w, left: 20.w, right: 20.w),
          alignment: Alignment.topLeft,
          child: Obx(() {
            return HomeGameTagComponent(
              listItemIndex: listItemIndex,
              gameTagList: controller.tab2TagList[listItemIndex],
            );
          }),
        ),
        Obx(() {
          RequestResultEntity? requestResultEntity = list.other;
          bool isLastPage = requestResultEntity?.isLastPage ?? false;
          return list.isNotEmpty
              ? SizedBox(
                  width: double.infinity,
                  height: list.length > 1 ? 540.w : 270.w,
                  child: GridView.builder(
                    padding: EdgeInsets.only(top: 20.w),
                    itemCount: isLastPage ? list.length : list.length + 1,
                    physics: const BouncingScrollPhysics(),
                    controller: scrollController,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: list.length > 1 ? 2 : 1, childAspectRatio: 1.2),
                    itemBuilder: (BuildContext context, int index) {
                      bool isLoadMoreItem = list.length == index;
                      return isLoadMoreItem
                          ? ItemMoreWidget(controller: controller, listItemIndex: listItemIndex)
                          : GameItemWidget(
                              isVerticalItem: false,
                              gameEntity: list[index],
                              index: index,
                              controller: controller,
                              typeName: list.strExt,
                            );
                    },
                  ),
                )
              : AppEmpty(
                  width: double.infinity,
                  height: 400.w,
                  alignment: Alignment.center,
                );
        })
      ],
    );
  }
}

class HomeGameTypesBarWidget extends StatelessWidget {
  HomeGameTypesBarWidget({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 24.w, left: 20.w, right: 20.w),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.w),
        child: Container(
            width: double.infinity,
            height: 148.w,
            decoration: BoxDecoration(gradient: headerLinearGradient),
            child: Obx(() {
              return GridView.builder(
                  itemCount: controller.gameTypes.length,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, childAspectRatio: 2.4),
                  itemBuilder: (BuildContext context, int index) {
                    return Obx(() {
                      bool isSelected = controller.selectedGameTypeIndex.value == index;
                      GameTypeEntity gameTypeEntity = controller.gameTypes[index];
                      return CupertinoButton(
                        onPressed: () {
                          if (controller.selectedGameTypeIndex.value != index) {
                            controller.switchTabWithAddPressedRecord(index);
                          }
                        },
                        minSize: 0,
                        padding: EdgeInsets.zero,
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(gradient: isSelected ? activeBtnLinearGradient : null),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset("assets/images/game-tab$index.webp", width: 50.w),
                              Text(
                                gameTypeEntity.name,
                                style: TextStyle(color: Colors.white, fontSize: 26.w),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
                  });
            })),
      ),
    );
  }
}
