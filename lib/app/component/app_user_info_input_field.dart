import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../widget/input_field.dart';

class UserInfoInputField extends StatelessWidget {
  const UserInfoInputField({
    super.key,
    required this.prefixIcon,
    required this.editNode,
    required this.errText,
  });

  final String prefixIcon;
  final EditNode editNode;
  final String errText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 114.w,
      color: Colors.pink,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MyInputFiled(
            width: double.infinity,
            height: 72.w,
            hint: 'Por favor, insira o nome de usuário',
            hintStyle: TextStyle(color: const Color(0xff969799), fontSize: 26.w),
            textStyle: TextStyle(color: const Color(0xffffffff), fontSize: 26.w),
            prefix: Padding(
              padding: EdgeInsets.only(left: 20.w, right: 10.w),
              child: Image.asset(prefixIcon, width: 28.w),
            ),
            onTextChanged: (text) {},
            editNode: editNode,
          ),
          Obx(() {
            return editNode.isDisplayErrHint.value
                ? Text(
                    errText,
                    style: TextStyle(
                      fontSize: 24.w,
                      color: const Color(0xffFF690D),
                      fontWeight: FontWeight.w400,
                    ),
                  )
                : const SizedBox();
          })
        ],
      ),
    );
  }
}
