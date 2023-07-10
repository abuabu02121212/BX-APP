import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../widget/input_field.dart';

class UserInfoInputField extends StatelessWidget {
  const UserInfoInputField({
    super.key,
    required this.prefixIcon,
    required this.editNode,
    required this.errText,
    this.isUserName = false,
    this.isPassword = false,
    this.isPhone = false,
    this.isCode = false,
    this.isEmail = false,
    required this.hint,
  });

  final String prefixIcon;
  final EditNode editNode;
  final String errText;
  final String hint;
  final bool isUserName;
  final bool isPassword;
  final bool isPhone;
  final bool isCode;
  final bool isEmail;

  @override
  Widget build(BuildContext context) {
    List<TextInputFormatter>? tarFormatterList = [];
    if (isUserName) {
      tarFormatterList = userNameFormatterList;
    } else if (isPassword) {
      tarFormatterList = passwordFormatterList;
    } else if (isEmail) {
      tarFormatterList = emailFormatterList;
    } else if (isPhone) {
      tarFormatterList = phoneFormatterList;
    }
    return SizedBox(
      width: double.infinity,
      height: 114.w,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyInputFiled(
            width: double.infinity,
            height: 72.w,
            hint: hint,
            obscureText: isPassword,
            inputFormatters: tarFormatterList,
            keyboardType: isPhone || isCode ? TextInputType.number : TextInputType.text,
            hintStyle: TextStyle(color: const Color(0xff969799), fontSize: 26.w),
            textStyle: TextStyle(color: const Color(0xffffffff), fontSize: 26.w),
            prefix: Padding(
              padding: EdgeInsets.only(left: 20.w, right: 10.w),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(prefixIcon, width: 28.w),
                  if (isPhone)
                    Padding(
                      padding: EdgeInsets.only(left: 20.w),
                      child: Text(
                        "+55",
                        style: TextStyle(
                          fontSize: 26.w,
                          color: const Color(0xff0ED1F4),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )
                ],
              ),
            ),
            onTextChanged: (text) {
              if (isUserName) {
                editNode.isDisplayErrHint.value = usernameRegExp.hasMatch(text);
              } else if (isPassword) {
                editNode.isDisplayErrHint.value = pswRegExp.hasMatch(text);
              } else if (isPhone) {
                editNode.isDisplayErrHint.value = phoneNumExp.hasMatch(text);
              }
            },
            editNode: editNode,
          ),
          Obx(() {
            return editNode.isDisplayErrHint.value
                ? Padding(
                    padding: EdgeInsets.only(left: 76.w, top: 6.w),
                    child: Text(
                      errText,
                      style: TextStyle(
                        fontSize: 24.w,
                        color: const Color(0xffFF690D),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  )
                : const SizedBox();
          })
        ],
      ),
    );
  }
}
