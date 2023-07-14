import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_comm/app/modules/register/views/register_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../util/toast_util.dart';
import '../../../component/app_button.dart';
import '../../../component/app_user_info_input_field.dart';
import '../../login/views/login_view.dart';
import '../controllers/forget_psw_controller.dart';

class ForgetPswWidget extends StatelessWidget {
  ForgetPswWidget({super.key});

  final List<Widget> pageList = [LoginWidget(), RegisterWidget()];
  final ForgetPswController controller = Get.put(ForgetPswController());

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
                        SizedBox(height: 40.w),
                        Text(
                          "Esqueça a senha",
                          style: TextStyle(
                            fontSize: 26.w,
                            color: const Color(0xff0ED1F4),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 14.w, bottom: 50.w),
                          child: Image.asset(
                            "assets/images/indicator-1.webp",
                            width: 90.w,
                          ),
                        ),
                        InputListWidget(controller: controller),
                        Container(
                          alignment: Alignment.center,
                          height: 140.w,
                          child: AppButton(
                            width: 580.w,
                            height: 90.w,
                            radius: 100.w,
                            text: 'Redefinir senha',
                            onClick: () {
                              Toast.show("Entrar");
                            },
                          ),
                        ),
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

class InputListWidget extends StatelessWidget {
  const InputListWidget({
    super.key,
    required this.controller,
  });

  final ForgetPswController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 580.w,
          margin: EdgeInsets.only(top: 10.w),
          child: UserInfoInputField(
            prefixIcon: 'assets/images/i-phone.webp',
            editNode: controller.phoneEditNode,
            hint: 'Tu nùmero de celular',
            errText: 'Tu nùmero de celular',
            isPhone: true,
          ),
        ),
        SizedBox(
          width: 580.w,
          child: UserInfoInputField(
            prefixIcon: 'assets/images/reg-code.webp',
            editNode: controller.codeEditNode,
            hint: 'Código de verificação',
            errText: 'Senha (4-12 letras e números)',
            isCode: true,
          ),
        ),
        SizedBox(
          width: 580.w,
          child: UserInfoInputField(
            prefixIcon: 'assets/images/key-gray.webp',
            editNode: controller.keyEditNode,
            hint: 'Senha (4-12 letras e números)',
            errText: 'Senha (4-12 letras e números)',
            isPassword: true,
          ),
        ),
      ],
    );
  }
}

void showForgetPswDialog() {
  Get.dialog(
    ForgetPswWidget(),
    barrierDismissible: false,
  );
}
