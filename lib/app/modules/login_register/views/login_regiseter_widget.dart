import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_comm/app/modules/login_register/views/tab_component.dart';
import 'package:flutter_comm/app/modules/register/views/register_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../util/toast_util.dart';
import '../../login/views/login_view.dart';

class LoginRegisterWidget extends StatelessWidget {
  LoginRegisterWidget({super.key});

  final List<Widget> pageList = [const LoginWidget(), const RegisterView()];

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.w),
      child: Container(
        width: 634.w,
        height: 752.w,
        decoration: const BoxDecoration(color: Color(0xff011A51)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LoginRegisterTabComponent(
              onSelectChanged: (int index) {
                Toast.show("index:$index");
              },
            ),
            Expanded(
              child: PageView.builder(
                itemCount: 10,
                onPageChanged: (index) {},
                controller: PageController(),
                itemBuilder: (BuildContext context, int index) {
                  return pageList[index];
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
