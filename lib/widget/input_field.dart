import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

RegExp usernameRegExp = RegExp(r"^[a-zA-Z][a-zA-Z0-9]{4,13}$");
RegExp inviteCodeRegExp = RegExp(r"^[A-Za-z0-9]{6,9}$");

RegExp pswRegExp = RegExp(r"^(?!^\d+$)(?!^[a-zA-Z]+$)[0-9A-Za-z]{8,20}$");
RegExp pswInputLimit = RegExp(r'[0-9a-zA-Z]');
// 手机号正则表达式
final phoneNumExp = RegExp(r"^[1-9]([0-9]{8,8})$");
final upperCaseCharExp = RegExp(r"^[A-Z]$");

List<TextInputFormatter>? aliaFormatterList = [LengthLimitingTextInputFormatter(20), FilteringTextInputFormatter.allow(RegExp(r'[0-9A-Za-z ]'))];

List<TextInputFormatter>? usdtAddressFormatterList = [
  LengthLimitingTextInputFormatter(40),
  // FilteringTextInputFormatter.allow(RegExp(r'[1-9A-Za-z ]'))
];

List<TextInputFormatter>? verifyCodeFormatterList = [
  LengthLimitingTextInputFormatter(4),
  // FilteringTextInputFormatter.allow(RegExp(r'[1-9A-Za-z ]'))
];

final FilteringTextInputFormatter pureNumFormatter = FilteringTextInputFormatter.allow(RegExp("[0-9]"));

/// 手机号输入格式化后带有空格，故正则限制中加入空格，如果不加入空格，光标位置会忽略空格
final FilteringTextInputFormatter phoneInputFormatter = FilteringTextInputFormatter.allow(RegExp("[0-9 ]"));

class EditNode {
  final FocusNode focusNode = FocusNode();
  final hasFocus = false.obs;
  final TextEditingController editController = TextEditingController();
  final text = "".obs;
  final enable = false.obs;
  final obscureTextEnable = true.obs;
  final isDisplayErrHint = false.obs;

  EditNode() {
    focusNode.addListener(() => hasFocus.value = focusNode.hasFocus);
  }
}

class MyInputFiled extends StatelessWidget {
  const MyInputFiled({
    super.key,
    required this.width,
    required this.height,
    required this.hint,
    required this.icon,
    required this.editNode,
    this.inputFormatters,
    this.keyboardType = TextInputType.text,
  });

  final double width;
  final double height;
  final String hint;
  final String icon;
  final EditNode editNode;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.w),
      child: Container(
        width: width,
        height: height,
        color: const Color(0xff1c1c28),
        alignment: Alignment.center,
        padding: EdgeInsets.only(left: 8.w),
        child: CupertinoTextField(
          controller: editNode.editController,
          focusNode: editNode.focusNode,
          style: TextStyle(fontSize: 14.w, color: const Color(0xffffffff)),
          keyboardType: keyboardType,
          onChanged: (text) {
            editNode.text.value = text;
          },
          decoration:  const BoxDecoration(color: Colors.transparent),
          placeholder: hint,
          textAlignVertical: TextAlignVertical.center,
          textAlign: TextAlign.start,
          placeholderStyle: TextStyle(fontSize: 14.w, color: const Color(0xff6d6d7a)),
          cursorColor: Colors.white,
          cursorHeight: 20.w,
          maxLines: 1,
          maxLength: 32,
          prefix: Image.asset(icon, width: 14.w),
          padding: EdgeInsets.only(left: 10.w),
          // suffix: delView(),
          inputFormatters: inputFormatters,
        ),
      ),
    );
  }
}
