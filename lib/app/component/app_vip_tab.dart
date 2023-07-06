import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widget/horizontal_list_view_tab.dart';

class AppVipTab extends StatelessWidget {
  AppVipTab({super.key});

  final List<String> list = List.generate(30, (index) => index.toString());
  final double itemWidth = 140.w;
  final double height = 56.w;
  final double width = 740.w;

  @override
  Widget build(BuildContext context) {
    return HorizontalListViewTab(
        size: list.length,
        itemWidth: itemWidth,
        itemBuilder: (BuildContext context, int index, int selectedPos) {
          bool isSelect = index == selectedPos;
          return Center(
            child: Container(
              color: Colors.green,
              width: itemWidth,
              height: height,
              child: Center(
                child: Text(
                  list[index],
                  style: TextStyle(color: Color(isSelect ? 0xffffffff : 0xffcccccc)),
                ),
              ),
            ),
          );
        },
        width: width,
        height: height,
        itemMargin: 2,
        bgColor: Colors.yellow,
        onSelectChanged: (pos) {});
  }
}
