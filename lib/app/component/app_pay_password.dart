import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../routes/app_pages.dart';
import 'app_button.dart';

class AppPayPassword extends StatelessWidget {
  const AppPayPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 634.w,
        height: 282.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.w),
          color: const Color.fromRGBO(1, 26, 81, 1),
        ),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 34.w),
                child: Text(
                  'A senha de pagamento ainda não foi\ndefinida, por favor, defina-a primeiro',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26.w,
                    height: 1.7
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 26.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppButton(
                      width: 280.w,
                      height: 90.w,
                      radius: 100.w,
                      colorList: const [
                        Color.fromRGBO(4, 75, 154, 1),
                        Color.fromRGBO(4, 75, 154, 1),
                      ],
                      text: 'Cancelar',
                      onClick: () {
                        Get.back();
                      },
                    ),
                    AppButton(
                      width: 280.w,
                      height: 90.w,
                      radius: 100.w,
                      text: 'Confirme',
                      onClick: () {
                        Get.back();
                        Get.toNamed(Routes.CENTER_PAY_PASSWORD);
                      },
                    ),
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
