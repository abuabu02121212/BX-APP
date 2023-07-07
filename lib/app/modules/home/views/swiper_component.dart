import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SwiperComponent extends StatelessWidget {
  const SwiperComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.w),
      child: Swiper(
        itemWidth: double.infinity,
        itemBuilder: (BuildContext context, int index) {
          return CachedNetworkImage(
            fit: BoxFit.fill,
            imageUrl: "https://img-blog.csdnimg.cn/img_convert/91495721a1216cec3c3c68304040be50.png",
          );
        },
        itemCount: 3,
        autoplay: true,
        pagination: SwiperPagination(
          margin: EdgeInsets.all(20.w),
          builder: DotSwiperPaginationBuilder(size: 10.w, activeSize: 10.w, space: 8.w),
        ),
        control: const SwiperControl(size: 0),
      ),
    );
  }
}
