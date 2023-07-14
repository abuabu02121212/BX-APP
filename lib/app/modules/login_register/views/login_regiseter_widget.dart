import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_comm/app/modules/login_register/views/tab_component.dart';
import 'package:flutter_comm/app/modules/register/views/register_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../login/views/login_view.dart';
import '../controllers/login_register_controller.dart';

class LoginRegisterWidget extends StatelessWidget {
  LoginRegisterWidget({super.key});

  final List<Widget> pageList = [LoginWidget(), RegisterWidget()];
  final LoginRegisterController controller = Get.put(LoginRegisterController());

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Material(
        color: Colors.transparent,
        child: Container(
          margin: EdgeInsets.only(top: 250.w),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                  bottom: 0.w,
                  child: CupertinoButton(
                    minSize: 0,
                    padding: EdgeInsets.all(10.w),
                    onPressed: () {
                      Get.back();
                    },
                    child: Image.asset(
                      "assets/images/dialog-close.webp",
                      width: 40.w,
                    ),
                  )),
              Padding(
                padding: EdgeInsets.only(top: 70.w, bottom: 70.w),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.w),
                  child: Container(
                    width: 634.w,
                    //  height: 752.w,
                    decoration: const BoxDecoration(color: Color(0xff011A51)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 20.w),
                        LoginRegisterTabComponent(
                          onSelectChanged: (int index) {
                            controller.selectedIndex.value = index;
                          },
                        ),
                        Obx(() {
                          return pageList[controller.selectedIndex.value];
                        }),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void showLoginRegisterDialog() {
  Get.dialog(
    LoginRegisterWidget(),
    barrierDismissible: false
    //  barrierColor: const Color.fromRGBO(0, 0, 0, 0.7),
  );
}
