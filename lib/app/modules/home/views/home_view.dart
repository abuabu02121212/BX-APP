import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_comm/app/modules/home/views/swiper_component.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../../util/toast_util.dart';
import '../../../../widget/list_view_marquee.dart';
import '../../../app_style.dart';
import '../../../component/app_button.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 0,
        titleSpacing: 0,
        toolbarHeight: 110.w,
        title: const HomeHeader(),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          color: Colors.black,
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.topLeft,
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 280.w,
                child: const SwiperComponent(
                  radius: 0,
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 40.w),
                height: 60.w,
                decoration: BoxDecoration(color: const Color(0xff011A51), borderRadius: BorderRadius.circular(30.w)),
                child: Row(
                  children: [
                    Image.asset("assets/images/i-notice.webp", width: 36.w),
                    Expanded(
                        child: Container(
                      padding: EdgeInsets.only(left: 20.w, right: 20.w),
                      child: ListViewMarquee(
                        child: Text(
                          "Bem-vindo ao paraíso dos jogos, preparamos uma variedade de jogos populares para você ter uma experiência de jogo diferente.",
                          style: TextStyle(color: const Color(0xffffffff), fontSize: 22.w),
                        ),
                      ),
                    )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 110.w,
      decoration: BoxDecoration(gradient: headerLinearGradient),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CupertinoButton(
            onPressed: () {},
            minSize: 0,
            padding: EdgeInsets.all(16.w),
            child: Image.asset("assets/images/i-popup-btn.webp", width: 40.w),
          ),
          Image.asset("assets/images/logo.webp", width: 120.w),
          SizedBox(width: 90.w),
          AppButton(
            width: 350.w,
            height: 60.w,
            radius: 30.w,
            text: 'Registar Conta',
            onClick: () {
              Toast.show("按钮被点击");
            },
          ),
          SizedBox(width: 26.w),
          CupertinoButton(
            onPressed: () {},
            minSize: 0,
            padding: EdgeInsets.all(10.w),
            child: Image.asset("assets/images/home_message.webp", width: 60.w),
          ),
        ],
      ),
    );
  }
}
