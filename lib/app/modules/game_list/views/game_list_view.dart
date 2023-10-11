import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_comm/app/modules/game_list/views/tab_component.dart';
import 'package:flutter_comm/widget/horizontal_indicator_tab.dart';
import 'package:flutter_comm/widget/keep_alive_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../../generated/l10n.dart';
import '../../../../widget/vetival_tab_group.dart';
import '../../../app_style.dart';
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
                        controller: VerticalTabController(),
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
                              indicatorTabController: controller.indicatorTabController,
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
              Container(
                width: double.infinity,
                height: 100.w,
                padding: EdgeInsets.only(left: 0.w, right: 0.w, top: 0.w, bottom: 0.w),
                decoration: const BoxDecoration(
                  color: Color(0xff1A1C1F),
                ),
                child: const SizedBox(),
              )
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
