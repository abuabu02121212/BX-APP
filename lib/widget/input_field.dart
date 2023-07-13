import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

RegExp usernameRegExp = RegExp(r"^[a-zA-Z][a-zA-Z0-9]{4,13}$");
RegExp pswRegExp = RegExp(r"^[0-9A-Za-z]{4,12}$");
final phoneNumExp = RegExp(r"^[1-9]([0-9]{8,8})$");
RegExp inviteCodeRegExp = RegExp(r"^[A-Za-z0-9]{6,9}$");

RegExp emailExp = RegExp("^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}\$");
// 手机号正则表达式
final upperCaseCharExp = RegExp(r"^[A-Z]$");

List<TextInputFormatter>? userNameFormatterList = [
  LengthLimitingTextInputFormatter(14),
  FilteringTextInputFormatter.allow(RegExp(r'[0-9a-zA-Z]')),
];

List<TextInputFormatter>? passwordFormatterList = [
  LengthLimitingTextInputFormatter(20),
  FilteringTextInputFormatter.allow(RegExp(r'[0-9a-zA-Z]')),
];

List<TextInputFormatter>? phoneFormatterList = [
  LengthLimitingTextInputFormatter(11),

  /// 手机号输入格式化后带有空格，故正则限制中加入空格，如果不加入空格，光标位置会忽略空格
  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
];

List<TextInputFormatter>? codeFormatterList = [
  LengthLimitingTextInputFormatter(6),
  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
];

List<TextInputFormatter>? emailFormatterList = [
  LengthLimitingTextInputFormatter(64),
  FilteringTextInputFormatter.allow(emailExp),
];

List<TextInputFormatter>? aliaFormatterList = [
  LengthLimitingTextInputFormatter(20),
  FilteringTextInputFormatter.allow(RegExp(r'[0-9A-Za-z ]')),
];

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
  late final text = "".obs;
  final enable = false.obs;
  final obscureTextEnable = true.obs;
  final isDisplayErrHint = false.obs;
  final eyeIsOPen = false.obs;

  EditNode() {
    focusNode.addListener(() => hasFocus.value = focusNode.hasFocus);
    editController.addListener(() {
      text.value = editController.text;
    });
  }

  dispose() {
    focusNode.dispose();
    editController.dispose();
  }
}

class MyInputFiled extends StatelessWidget {
  const MyInputFiled({
    super.key,
    required this.width,
    required this.height,
    required this.hint,
    this.prefix,
    this.suffix,
    required this.editNode,
    this.inputFormatters,
    this.keyboardType = TextInputType.text,
    this.onTextChanged,
    this.bgColor = Colors.black,
    this.radius = 50,
    this.hintStyle,
    this.textStyle,
    this.obscureText = false,
    this.textDirection,
  });

  final double width;
  final double height;
  final double radius;
  final String hint;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final Widget? prefix;
  final Widget? suffix;
  final Color? bgColor;
  final EditNode editNode;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onTextChanged;
  final bool obscureText;
  final TextDirection? textDirection;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Container(
        width: width,
        height: height,
        color: bgColor,
        alignment: Alignment.center,
        padding: EdgeInsets.only(left: 8.w),
        child: CupertinoTextField(
          controller: editNode.editController,
          focusNode: editNode.focusNode,
          textDirection: textDirection,
          style: textStyle ?? TextStyle(color: Colors.white, fontSize: 28.w),
          keyboardType: keyboardType,
          onChanged: (text) {
            editNode.text.value = text;
            onTextChanged!(text);
          },
          decoration: const BoxDecoration(color: Colors.transparent),
          placeholder: hint,
          textAlignVertical: TextAlignVertical.center,
          textAlign: TextAlign.start,
          placeholderStyle: hintStyle ?? TextStyle(color: const Color.fromRGBO(255, 255, 255, 0.4), fontSize: 28.w),
          cursorColor: Colors.white,
          cursorHeight: 32.w,
          maxLines: 1,
          obscureText: obscureText,
          maxLength: 32,
          prefix: prefix,
          suffix: suffix,
          padding: EdgeInsets.only(left: 10.w),
          // suffix: delView(),
          inputFormatters: inputFormatters,
        ),
      ),
    );
  }
}
