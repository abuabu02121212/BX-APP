import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_comm/app/app_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

///密码框
class PinCodeText extends StatelessWidget {
  var textEditingController = TextEditingController(text: "");
  Function? changed;
  Function? onDone;
  Function? canDisplayed;
  var isNum = true;
  var name = '';

  PinCodeText({
    Key? key,
    required this.textEditingController,
    this.changed,
    this.onDone,
    this.canDisplayed,
    this.isNum = true,
    this.name = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: pubTextStyle(
                    const Color(0xffffffff), 26.sp, FontWeight.w400),
              ),
              CupertinoButton(
                padding: EdgeInsets.zero,
                minSize: 0,
                onPressed: () => {
                  canDisplayed!(),
                },
                child: Image(
                  image: const AssetImage(
                      'assets/images/user/ic_password_displayed.webp'),
                  width: 40.w,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        PinCodeTextField(
          autofocus: false,
          controller: textEditingController,
          hideCharacter: isNum,
          highlight: false,
          highlightColor: const Color(0xff1A1C1F),
          defaultBorderColor: const Color.fromRGBO(93, 101, 111, 0.40),
          hasTextBorderColor: const Color(0xff1A1C1F),
          highlightPinBoxColor: const Color(0xff1A1C1F),
          maxLength: 6,
          // hasError: logic.hasError,
          pinBoxColor: const Color(0xff1A1C1F),
          pinBoxRadius: 16.r,
          pinBoxBorderWidth: 1.w,
          maskCharacter: "*",
          onTextChanged: (text) {
            changed!(text);
          },
          onDone: (text) {
            onDone!(text);
          },
          pinBoxWidth: 105.w,
          pinBoxHeight: 100.h,
          hasUnderline: false,
          wrapAlignment: WrapAlignment.spaceAround,
          pinBoxDecoration: ProvidedPinBoxDecoration.defaultPinBoxDecoration,
          pinTextStyle:
              const TextStyle(fontSize: 22.0, color: Color(0xffffffff)),
          pinTextAnimatedSwitcherTransition:
              ProvidedPinBoxTextAnimation.scalingTransition,
//                    pinBoxColor: Colors.green[100],
          pinTextAnimatedSwitcherDuration: const Duration(milliseconds: 300),
//                    highlightAnimation: true,
          highlightAnimationBeginColor: const Color(0xff1A1C1F),
          highlightAnimationEndColor: const Color(0xff1A1C1F),
          keyboardType: TextInputType.number,
        ),
      ],
    );
  }
}
