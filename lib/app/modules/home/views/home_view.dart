import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_comm/app/modules/home/views/swiper_component.dart';
import 'package:flutter_comm/util/loading_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import '../../../../util/entity/entites.dart';
import '../../../../util/extensions.dart';
import '../../../../widget/back_event_interceptor.dart';
import '../../../component/app_empty.dart';
import '../../../entity/game_item.dart';
import '../../../entity/promotion_entity.dart';
import '../../../routes/app_pages.dart';
import '../controllers/game_list_requests.dart';
import '../controllers/home_controller.dart';
import 'game_search_dialog.dart';
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CupertinoButton(
              onPressed: () {
                final List<List<PromotionEntity>> listData = PromotionEntity.getLocalData();
                var entity = listData[0][0];
                Get.toNamed(Routes.WEBVIEW, arguments: entity.url);
              },
              minSize: 0,
              padding: EdgeInsets.zero,
              child: Image.asset("assets/images/home_aty_2.webp", height: 119.w),
            ),
            SizedBox(width: 20.w,),
            CupertinoButton(
              onPressed: () {
                final List<List<PromotionEntity>> listData = PromotionEntity.getLocalData();
                var entity = listData[0][3];
                Get.toNamed(Routes.WEBVIEW, arguments: entity.url);
              },
              minSize: 0,
              padding: EdgeInsets.zero,
              child: Image.asset("assets/images/home_aty_1.webp", height: 119.w),
            ),
          ],
        ),
        HomeGameTypesTabWidget(),
        //  SearchWidget(),
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
          padding: EdgeInsets.only(top: 20.w),
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
      var login = controller.globalController.isLogin();
      var itemSize = login ? controller.tab1List.length + 1 : controller.tab1List.length;
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...List.generate(itemSize, (index) {
            if (login && index == 0) {
              return Tab01HorizontalGameItemListWidget(
                list: controller.tab1FavRxList,
                listItemIndex: -1,
              );
            }
            index = login ? index - 1 : index;
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
    scrollController.addScrollToBottomListener(() async {
      var platformId = controller.curTab2GameNavEntityList[listItemIndex].id;
      if (controller.hotIsSelected.value) {
        // 热门 加载更多
        AppLoading.show();
        await requestHotGameList(
          controller.tab2List[listItemIndex],
          int.tryParse(controller.getCurGameType()) ?? 0,
          platformId: platformId,
          pageSize: 20,
          pageIndex: -1,
        );
        AppLoading.close();
      } else if (!controller.favIsSelected.value) {
        // 正常列表 加载更多
        AppLoading.show();
        await requestGameList(
          controller.tab2List[listItemIndex],
          controller.getCurGameType(),
          platformId: platformId,
          pageIndex: -1,
        );
        AppLoading.close();
      }
    });
  }

  final HomeController controller;
  final AppRxList<GameEntity> list;
  final int listItemIndex;
  final pageIndex = 1.obs;
  final AppScrollController scrollController = AppScrollController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GameTypeTitleBar(
          listItemIndex: listItemIndex,
          typeName: list.strExt ?? "",
        ),
        // SizedBox(height: 10.w,),
        Obx(() {
          RequestResultEntity? requestResultEntity = list.other;
          bool isLastPage = requestResultEntity?.isLastPage ?? false;
          return list.isNotEmpty
              ? SizedBox(
                  width: double.infinity,
                  height: list.length > 1 ? 540.w : 270.w,
                  //    color: Colors.pink,
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
                              controller: controller,
                              listItemIndex: listItemIndex,
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

class HomeGameTypesTabWidget extends StatelessWidget {
  HomeGameTypesTabWidget({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 26.w, left: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            width: 630.w,
            child: SizedBox(
                height: 88.w,
                child: Obx(() {

                  return ListView.separated(
                    itemCount: controller.gameTypes.length,
                    physics: const BouncingScrollPhysics(),
                    controller: controller.sc2,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Obx(() {
                        bool isSelected = controller.selectedGameTypeIndex.value == index;
                        return CupertinoButton(
                          onPressed: () {
                            if (controller.selectedGameTypeIndex.value != index) {
                              controller.switchTabWithAddPressedRecord(index);
                            }
                          },
                          minSize: 0,
                          padding: EdgeInsets.zero,
                          alignment: Alignment.center,
                          child: Container(
                            alignment: Alignment.center,
                            width: 88.w,
                            decoration:
                                BoxDecoration(color: isSelected ? const Color(0xffEEBD36) : const Color(0xff0F1A34), borderRadius: BorderRadius.circular(12.w)),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset("assets/images/game-tab$index.webp", width: 78.w),
                              ],
                            ),
                          ),
                        );
                      });
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        width: 20.w,
                      );
                    },
                  );
                })),
          ),
          SizedBox(
            width: 10.w,
          ),
          CupertinoButton(
            minSize: 0,
            padding: EdgeInsets.all(10.w),
            child: Container(
              width: 60.w,
              height: 60.w,
              decoration: BoxDecoration(
                color: const Color(0xff0F1A34),
                borderRadius: BorderRadius.circular(30.w),
              ),
              alignment: Alignment.center,
              child: Image.asset("assets/images/game_search.webp", width: 32.w),
            ),
            onPressed: () {
              showSearchDialog(null);
            },
          )
        ],
      ),
    );
  }
}
