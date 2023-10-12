import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_comm/app/modules/game_list/views/tab_component.dart';
import 'package:flutter_comm/widget/keep_alive_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../../generated/l10n.dart';
import '../../../../widget/vetival_tab_group.dart';
import '../../../component/app_header.dart';
import '../../../component/app_user_info_input_field.dart';
import '../../../entity/game_item.dart';
import '../../home/views/game_type_list.dart';
import '../controllers/game_list_controller.dart';

class GameListView extends GetView<GameListController> {
  const GameListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppHeader(
          titleWidget: Text(
            "SLOT",
            style: TextStyle(
              fontSize: 32.w,
              color: const Color(0xffffffff),
              fontWeight: FontWeight.w400,
            ),
          ),
          isNeedLeftBackArrow: true,
        ),
        centerTitle: true,
        titleSpacing: 0,
        leadingWidth: 0,
        toolbarHeight: 90.w,
      ),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xff1A1C1F),
            image: DecorationImage(
              image: AssetImage('assets/images/promotion/bg_pattern.webp'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 10.w, left: 20.w, right: 20.w),
                child: Stack(
                  children: [
                    Image.asset("assets/images/search_bg.webp", width: 710.w),
                    UserInfoInputField(
                      prefixIcon: null,
                      paddingLeft: 0,
                      editNode: controller.editNode,
                      height: 60.w,
                      showErrHeight: 60.w,
                      hint: S.current.SearchGames,
                      bgColor: const Color(0x00000A1D),
                      border: Border.all(color: const Color(0x002A2E3E), width: 0.w),
                      errText: '',
                      onTextChanged: (text) {},
                      suffixWidget: CupertinoButton(
                        onPressed: () {},
                        minSize: 60.w,
                        padding: EdgeInsets.only(left: 15.w, right: 22.w, top: 10.w, bottom: 10.w),
                        child: Image.asset("assets/images/search_icon.webp", width: 28.w),
                      ),
                      isEmail: false,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 140.w,
                      height: double.infinity,
                      padding: EdgeInsets.only(left: 0.w, right: 0.w, top: 23.w, bottom: 0.w),
                      //  decoration: const BoxDecoration(color: Color(0x88cccccc)),
                      child: VerticalTabGroup(
                        size: controller.gameTypeSize,
                        itemBuilder: _buildIndicatorTabItemBuilder2,
                        width: 100.w,
                        height: double.infinity,
                        itemHeight: 100.w,
                        itemMargin: 20.w,
                        onSelectChanged: (pos) {},
                        bgColor: Colors.transparent,
                        alignment: Alignment.center,
                        controller: controller.verticalTabController,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: double.infinity,
                        padding: EdgeInsets.only(left: 0.w, right: 0.w, top: 0.w, bottom: 0.w),
                        //  decoration: const BoxDecoration(color: Color(0x88ffcccc)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GameListHorizontalTab(
                              onSelectChanged: (int t, bool v) {},
                              indicatorTabController: controller.horizontalTabController,
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(right: 20.w),
                                child: GridView.builder(
                                    itemCount: 22,
                                    physics: const BouncingScrollPhysics(),
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      mainAxisSpacing: 22.w,
                                      crossAxisSpacing: 22.h,
                                      childAspectRatio: 182 / 232.0,
                                    ),
                                    itemBuilder: (BuildContext context, int index) {
                                      return GameItemWidget(gameEntity: GameEntity.fromJson({}));
                                    }),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              BottomPageIndexWidget(controller: controller)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIndicatorTabItemBuilder2(BuildContext context, int index, int selectedPos) {
    bool selected = index == selectedPos;
    Color color = selected ? Colors.white : const Color(0xff5D656F);
    Color bgColor = selected ? const Color(0xff3EA1F8) : const Color(0xff1A1C1F);
    return AliveWidget(
      child: Column(
        children: [
          Container(
            height: 100.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.w),
              color: bgColor,
            ),
            child: Center(
              child: Text(
                "tab-$index",
                style: TextStyle(color: color),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomPageIndexWidget extends StatelessWidget {
  const BottomPageIndexWidget({
    super.key,
    required this.controller,
  });

  final GameListController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100.w,
      padding: EdgeInsets.only(left: 0.w, right: 0.w, top: 0.w, bottom: 0.w),
      decoration: const BoxDecoration(
        color: Color(0xff1A1C1F),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Obx(() {
            return BotTurnPageWidget(
              enable: controller.curSelectPageIndex.value > 1,
              onPressed: () {
                controller.jumPrePage();
              },
            );
          }),
          Obx(() {
            List<int> showPageNumList = controller.getShowPageNumList(controller.curSelectPageIndex.value, controller.pageSize.value - 1);
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(showPageNumList.length, (index) {
                var pageNum = showPageNumList[index];
                if (pageNum == -9) {
                  return Padding(
                    padding: EdgeInsets.only(left: 15.w, right: 15.w),
                    child: Text(
                      "...",
                      style: TextStyle(
                        fontSize: 24.w,
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  );
                }
                return BotPageNumWidget(
                  pageNumber: pageNum,
                  isSelected: pageNum == controller.curSelectPageIndex.value,
                  controller: controller,
                );
              }),
            );
          }),
          Obx(() {
            return BotTurnPageWidget(
              isLeft: false,
              enable: controller.curSelectPageIndex.value < controller.pageSize.value - 1,
              onPressed: () {
                controller.jumNextPage();
              },
            );
          }),
        ],
      ),
    );
  }
}

class BotPageNumWidget extends StatelessWidget {
  const BotPageNumWidget({
    super.key,
    required this.pageNumber,
    this.isSelected = false,
    required this.controller,
  });

  final int pageNumber;
  final bool isSelected;
  final GameListController controller;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        controller.curSelectPageIndex.value = pageNumber;
      },
      minSize: 0,
      padding: EdgeInsets.only(left: 6.w, right: 6.w, top: 10.w, bottom: 10.w),
      child: Container(
        width: 50.w,
        height: 50.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xff3EA1F8) : Colors.transparent,
          borderRadius: BorderRadius.circular(12.w),
          border: Border.all(color: const Color(0xff5D656F), width: isSelected ? 0 : 1.w),
        ),
        child: Text(
          pageNumber.toString(),
          style: TextStyle(
            fontSize: 24.w,
            color: const Color(0xffffffff),
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}

class BotTurnPageWidget extends StatelessWidget {
  const BotTurnPageWidget({
    super.key,
    this.isLeft = true,
    this.enable = true,
    this.onPressed,
  });

  final bool isLeft;
  final bool enable;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    var leftIcon = Icons.arrow_back_ios_outlined;
    var rightIcon = Icons.arrow_forward_ios_outlined;
    return CupertinoButton(
      onPressed: enable ? onPressed : null,
      minSize: 0,
      padding: EdgeInsets.only(left: 6.w, right: 6.w, top: 10.w, bottom: 10.w),
      child: Container(
        width: 50.w,
        height: 50.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.w),
          border: Border.all(color: const Color(0xff5D656F), width: 1.w),
        ),
        child: Icon(
          isLeft ? leftIcon : rightIcon,
          color: enable ? Colors.white : Color(0xff555557),
          size: 20.w,
        ),
      ),
    );
  }
}
