import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_comm/app/entity/notice.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class SwiperNoticeComponent extends StatelessWidget {
  SwiperNoticeComponent({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.w),
        child: Obx(() {
          var list = controller.noticeListRx;
          return Container(
            width: 634.w,
            height: 600.w,
            padding: EdgeInsets.only(left: 32, right: 32.w, bottom: 10),
            color: const Color(0xff011A51),
            child: Swiper(
              itemWidth: double.infinity,
              itemBuilder: (BuildContext context, int index) {
                NoticeEntity entity = list[index];
                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 48.w),
                      Text(
                        entity.title,
                        style: TextStyle(fontSize: 26.w, color: Colors.white, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(height: 76.w),
                      Padding(
                        padding: EdgeInsets.only(bottom: 30.w),
                        child: Text(
                          entity.content,
                          style: TextStyle(fontSize: 26.w, color: Colors.white, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                );
              },
              itemCount: list.length,
              autoplay: false,
              loop: false,
              pagination: SwiperPagination(
                margin: EdgeInsets.all(20.w),
                builder: SwiperCustomPagination(builder: (BuildContext context, SwiperPluginConfig config) {
                  return Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(config.itemCount, (index) {
                        bool isSelected = index == config.activeIndex;
                        Color color = isSelected ? const Color.fromRGBO(204, 204, 204, 1) : const Color.fromRGBO(204, 204, 204, 0.5);
                        return Container(
                          width: isSelected ? 56.w : 16.w,
                          height: 16.w,
                          decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(8.w)),
                          margin: EdgeInsets.only(left: 4.w, right: 4.w),
                        );
                      }),
                    ),
                  );
                }),
              ),
              control: const SwiperControl(size: 0),
            ),
          );
        }),
      ),
    );
  }
}

void showNoticeListDialog() {
  Get.dialog(
    SwiperNoticeComponent(),
    barrierDismissible: true,
    barrierColor: const Color.fromRGBO(0, 0, 0, 0.8),
  );
}
