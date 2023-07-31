import 'package:flutter/material.dart';
import 'package:flutter_comm/app/modules/promotion/views/tab_component.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../../util/toast_util.dart';
import '../../../../util/weburl_util.dart';
import '../../../component/app_button.dart';
import '../../../component/app_empty.dart';
import '../../../component/app_header.dart';
import '../../../entity/promotion_entity.dart';
import '../../../routes/app_pages.dart';
import '../controllers/promotion_controller.dart';

class PromotionView extends GetView<PromotionController> {
  PromotionView({Key? key}) : super(key: key);

  @override
  final PromotionController controller = Get.put(PromotionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leadingWidth: 0,
        toolbarHeight: 110.w,
        title: const AppHeader(
          title: "Promoção",
          isNeedLeftBackArrow: false,
        ),
      ),
      body: SafeArea(
        child: Container(
          color: const Color(0xff020a1c),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              PromotionTabComponent(
                onSelectChanged: (int index) {
                  controller.selectedIndex.value = index;
                },
              ),
              Container(
                height: 2.w,
                width: double.infinity,
                color: const Color(0xff1e315f),
              ),
              Expanded(
                child: Obx(() {
                  var pageIndex = controller.selectedIndex.value;
                  var pageList = controller.listData[pageIndex];
                  var length = pageList.length;
                  return length > 0
                      ? ListView.builder(
                          itemCount: length,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return ItemWidget(
                              entity: controller.listData[pageIndex][index],
                            );
                          },
                        )
                      : const AppEmpty(
                        width: double.infinity,
                        height: double.infinity,
                        alignment: Alignment.center,
                      );
                }),
              ),
              SizedBox(height: 125.w + 20.w),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemWidget extends StatelessWidget {
  const ItemWidget({
    super.key,
    required this.entity,
  });

  final PromotionEntity entity;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.w),
      child: Container(
        width: 688.w,
        height: 343.w,
        margin: EdgeInsets.only(top: 30.w, left: 30.w, right: 30.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.w),
          border: Border.all(color: const Color(0xff0ED1F4), width: 2.w),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.w)),
              child: Image.asset(
                "assets/images/${entity.img}.webp",
                width: double.infinity,
                height: 248.w,
                fit: BoxFit.fill,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 20.w, top: 14.w, right: 10.w),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          entity.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 28.w, color: Colors.white, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          entity.text,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 24.w, color: const Color.fromRGBO(255, 255, 255, 0.70), fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 16.w, right: 20.w),
                  child: AppButton(
                    width: 150.w,
                    height: 54.w,
                    radius: 27.w,
                    text: 'Mais',
                    onClick: () {
                      Get.toNamed(Routes.WEBVIEW, arguments: entity.url);
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
