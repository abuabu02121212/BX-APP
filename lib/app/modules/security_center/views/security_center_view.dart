import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../component/app_header.dart';
import '../controllers/security_center_controller.dart';

class SecurityCenterView extends GetView<SecurityCenterController> {
  const SecurityCenterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff020a1c),
      appBar: AppBar(
        title: AppBar(
          titleSpacing: 0,
          leadingWidth: 0,
          toolbarHeight: 110.w,
          title: const AppHeader(title: "Centro de Segurança"),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: 45.w, right: 45.w, top: 45.w),
          decoration: const BoxDecoration(color: Color(0xff1a478e)),
          child: ListView(
            children: [
              ItemWidget(),
              ItemWidget(),
              ItemWidget(),
              ItemWidget(),
              ItemWidget(),
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
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/securiy_center_left_1.webp",
          width: 90.w,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Informações pessoais",
              style: TextStyle(fontSize: 28.w, color: Colors.white, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              width: 388.w,
              child: Text(
                "Informações pessoais completas.",
                maxLines: 3,
                style: TextStyle(fontSize: 24.w, color: const Color.fromRGBO(255, 255, 255, 0.70), fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CupertinoButton(
              onPressed: () {},
              minSize: 0,
              padding: EdgeInsets.all(10.w),
              child: Image.asset(
                "assets/images/security_center_right_ok.webp",
                width: 32.w,
              ),
            ),

            CupertinoButton(
              onPressed: () {},
              minSize: 0,
              padding: EdgeInsets.all(10.w),
              child: Image.asset(
                "assets/images/security_center_right_ok.webp",
                width: 32.w,
              ),
            ),

            CupertinoButton(
              onPressed: () {},
              minSize: 0,
              padding: EdgeInsets.all(10.w),
              child: Image.asset(
                "assets/images/security_center_right_ok.webp",
                width: 32.w,
              ),
            ),
          ],
        )
      ],
    );
  }
}
