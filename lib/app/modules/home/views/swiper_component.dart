import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SwiperComponent extends StatelessWidget {
  const SwiperComponent({super.key, this.radius = 20});

  final double radius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
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
  }
}
