import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_comm/app/modules/home/views/swiper_component.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeChildTabPage extends StatelessWidget {
  const HomeChildTabPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        Container(
          width: double.infinity,
          height: 280.w,
          padding: EdgeInsets.only(top: 20.w),
          child:  SwiperComponent(),
        )
      ],
    );
  }
}
