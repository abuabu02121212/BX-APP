import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_comm/widget/input_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../util/toast_util.dart';
import '../../../app_style.dart';
import '../../../component/app_button.dart';
import '../../../component/app_user_info_input_field.dart';

class GameSearchWidget extends StatelessWidget {
  GameSearchWidget({super.key, required this.dataList});

  final List<dynamic> dataList;
  final selectedIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.topRight,
          child: CupertinoButton(
            onPressed: () {
              Get.back();
            },
            minSize: 0,
            padding: EdgeInsets.only(right: 20.w, top: 40.w),
            child: Image.asset(
              "assets/images/dialog-close.webp",
              width: 40.w,
            ),
          ),
        ),
        Container(
          height: 60.w,
          alignment: Alignment.center,
          child: Text(
            "Category",
            style: TextStyle(fontSize: 32.w, color: Colors.white, fontWeight: FontWeight.w700),
          ),
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 10.w, left: 20.w, right: 20.w),
          child: UserInfoInputField(
            prefixIcon: 'assets/images/i-filter4.webp',
            editNode: EditNode(),
            height: 96.w,
            hint: 'To search for',
            bgColor: const Color(0xff000A1D),
            border: Border.all(color: const Color(0xff2A2E3E), width: 1.w),
            errText: '',
            onTextChanged: (text){

            },
            isEmail: false,
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 20.w),
          child: Text(
            "Providers",
            style: TextStyle(
              fontSize: 32.w,
              color: const Color(0xffffffff),
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(height: 10.w),
        Container(
          constraints: BoxConstraints(maxHeight: 600.w),
          child: GridView.builder(
            itemCount: dataList.length,
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 1.8),
            itemBuilder: (BuildContext context, int index) {
              return CupertinoButton(
                onPressed: () {
                  selectedIndex.value = index;
                },
                minSize: 0,
                padding: EdgeInsets.zero,
                child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Center(
                    child: Obx(() {
                      bool isSelected = selectedIndex.value == index;
                      Color textColor = isSelected ? Colors.white : const Color.fromRGBO(255, 255, 255, 0.40);
                      return Container(
                        width: 220.w,
                        height: 86.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          gradient: isSelected ? activeBtnLinearGradient : tabBgLinearGradient,
                          borderRadius: BorderRadius.circular(100.w),
                          border: isSelected ? Border.all(width: 1.w, color: const Color(0xff2A2E3E)) : null,
                        ),
                        child: Text(
                          dataList[index],
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 26.w,
                            color: textColor,
                            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              );
            },
          ),
        ),
        Container(
          width: double.infinity,
          padding:  EdgeInsets.only(left: 20.w, right: 20.w, top: 10.w),
          child: AppButton(
            width: double.infinity,
            height: 90.w,
            radius: 100.w,
            text: 'confirm',
            onClick: () {
              Toast.show("按钮被点击");
            },
          ),
        ),
      ],
    );
  }
}

void showSearchDialog() {
  Get.dialog(
    GameSearchWidget(
      dataList: const [
        "all",
        "pocket",
        "pocket",
        "koker",
        "player games",
      ],
    ),
    barrierDismissible: false,
    barrierColor: const Color.fromRGBO(0, 0, 0, 0.8),
  );
}
