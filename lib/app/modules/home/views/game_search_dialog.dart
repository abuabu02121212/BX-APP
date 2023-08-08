import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_comm/widget/input_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../util/entity/entites.dart';
import '../../../../util/extensions.dart';
import '../../../component/app_empty.dart';
import '../../../component/app_user_info_input_field.dart';
import '../../../entity/game_nav.dart';
import '../controllers/game_list_requests.dart';
import '../controllers/home_controller.dart';
import 'game_type_list.dart';

class GameSearchWidget extends StatelessWidget {
  GameSearchWidget({super.key, required this.dataList});

  final List<GameNavEntity>? dataList;

  final HomeController controller = Get.put(HomeController());
  final EditNode editNode = EditNode();
  final platformId = '0'.obs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.topRight,
            child: CupertinoButton(
              onPressed: () {
                Get.back();
              },
              minSize: 0,
              padding: EdgeInsets.only(right: 20.w, top: 40.w),
              child: Image.asset(
                "assets/images/dialog-close.webp",
                width: 40.w,
              ),
            ),
          ),
          Container(
            height: 60.w,
            alignment: Alignment.center,
            child: Text(
              "Category",
              style: TextStyle(fontSize: 32.w, color: Colors.white, fontWeight: FontWeight.w700),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 10.w, left: 20.w, right: 20.w),
            child: UserInfoInputField(
              prefixIcon: null,
              paddingLeft: 0,
              editNode: editNode,
              height: 96.w,
              hint: 'To search for',
              bgColor: const Color(0xff000A1D),
              border: Border.all(color: const Color(0xff2A2E3E), width: 1.w),
              errText: '',
              onTextChanged: (text) {},
              suffixWidget: CupertinoButton(
                onPressed: () {
                  startSearch(1);
                },
                minSize: 0,
                padding: EdgeInsets.only(left: 10.w, right: 30.w, top: 10.w, bottom: 10.w),
                child: Image.asset("assets/images/game_search.webp", width: 32.w),
              ),
              isEmail: false,
            ),
          ),
          Expanded(
              child: GameGridWidget(
            controller: controller,
            widget: this,
          ))
        ],
      ),
    );
  }

  void startSearch(int pageIndex) {
    if (editNode.text.value.isNotEmpty) {
      requestGameSearch(
        controller.searchRxList,
        '0',
        keyWord: editNode.text.value,
        platformId: "0",
        pageIndex: pageIndex,
        onSuccess: () {},
      );
    }
  }
}
int searchDialogListItemIndex = -9;
class GameGridWidget extends StatelessWidget {
  GameGridWidget({
    super.key,
    required this.controller,
    required this.widget,
  }) {
    scrollController.addScrollToBottomListener(() {
      widget.startSearch(-1);
    });
  }

  final HomeController controller;
  final AppScrollController scrollController = AppScrollController();
  final GameSearchWidget widget;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      var searchRxList = controller.searchRxList;
      RequestResultEntity? requestResultEntity = searchRxList.other;
      bool isLastPage = requestResultEntity?.isLastPage ?? false;
      return searchRxList.isNotEmpty
          ? GridView.builder(
              itemCount: isLastPage ? searchRxList.length : searchRxList.length + 1,
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              shrinkWrap: true,
              controller: scrollController,
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 0.9),
              itemBuilder: (BuildContext context, int index) {
                bool isLoadMoreItem = searchRxList.length == index;
                return isLoadMoreItem
                    ? ItemMoreWidget(controller: controller, listItemIndex: 0)
                    : GameItemWidget(
                        isVerticalItem: true,
                        gameEntity: searchRxList[index],
                        controller: controller,
                        listItemIndex: searchDialogListItemIndex,
                      );
              },
            )
          : AppEmpty(
              width: double.infinity,
              height: 400.w,
              alignment: Alignment.center,
            );
    });
  }
}

void showSearchDialog(List<GameNavEntity>? list) {
  Get.dialog(
    GameSearchWidget(
      dataList: list,
    ),
    barrierDismissible: false,
    barrierColor: const Color.fromRGBO(0, 0, 0, 0.94),
  );
}
