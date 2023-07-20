import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../http/api.dart';
import '../../../../util/weburl_util.dart';
import '../../../entity/banner.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class SwiperComponent extends StatelessWidget {
  SwiperComponent({super.key, this.radius = 20});

  final double radius;
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Obx(() {
        return Swiper(
          itemWidth: double.infinity,
          itemBuilder: (BuildContext context, int index) {
            BannerEntity entity = controller.bannerList[index];
            dynamic imgPath = entity.getImgPath();
            String bannerImgUrl = "$baseImgUrl$imgPath";
            return CupertinoButton(
              onPressed: () {
                Get.toNamed(Routes.WEBVIEW, arguments: WebURLUtil.getBannerTarPageParam(entity.redirectUrl));
              },
              minSize: 0,
              padding: EdgeInsets.zero,
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: bannerImgUrl,
              ),
            );
          },
          itemCount: controller.bannerList.length,
          autoplay: controller.bannerList.length > 1,
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
        );
      }),
    );
  }
}
