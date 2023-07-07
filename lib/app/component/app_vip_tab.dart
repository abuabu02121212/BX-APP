import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widget/horizontal_list_view_tab.dart';

class AppVipTab extends StatelessWidget {
  AppVipTab({
    super.key,
    required this.maxActiveIndex,
    required this.onItemClick,
  });

  final List<String> list = List.generate(30, (index) => index.toString());
  final double itemWidth = 150.w;
  final double height = 60.w;
  final int maxActiveIndex;
  final Callback<int> onItemClick;

  @override
  Widget build(BuildContext context) {
    return HorizontalListViewTab(
        size: list.length,
        itemWidth: itemWidth,
        itemBuilder: (BuildContext context, int index, int selectedPos) {
          bool isActive = index <= maxActiveIndex;
          return Center(
            child: Container(
              width: itemWidth,
              height: height,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                isActive ? "assets/images/vip_unlock_bg.png" : "assets/images/vip_lock_bg.png",
              ))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (!isActive)
                    Padding(
                      padding: EdgeInsets.only(right: 5.w),
                      child: Image.asset("assets/images/vip_lock.webp", width: 30.w),
                    ),
                  Transform.translate(
                    offset: Offset(0, 2.w),
                    child: Text(
                      "VIP $index",
                      style: TextStyle(
                        color: isActive ? const Color(0xff000000) : const Color(0xffffffff),
                        fontSize: 28.w,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        width: double.infinity,
        height: height,
        itemMargin: 4.w,
        bgColor: Colors.transparent,
        onSelectChanged: onItemClick);
  }
}
