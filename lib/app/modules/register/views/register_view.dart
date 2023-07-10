import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../../util/toast_util.dart';
import '../../../component/app_button.dart';
import '../../../component/app_user_info_input_field.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RegisterView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'RegisterView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class RegisterWidget extends StatelessWidget {
  RegisterWidget({super.key});

  final RegisterController controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 730.w,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 40.w),
          Obx(() {
            var selectedIndex = controller.selectedIndex.value;
            String img1 = selectedIndex == 0 ? "assets/images/reg_email_1.webp" : "assets/images/reg_email_2.webp";
            String img2 = selectedIndex == 1 ? "assets/images/reg_phone_1.webp" : "assets/images/reg_phone_2.webp";
            return Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CupertinoButton(
                  onPressed: () {
                    controller.selectedIndex.value = 0;
                  },
                  minSize: 0,
                  padding: EdgeInsets.zero,
                  child: Image.asset(img1, width: 72.w),
                ),
                SizedBox(width: 36.w),
                Container(
                  width: 1.w,
                  height: 72.w,
                  color: const Color.fromRGBO(255, 255, 255, 0.25),
                ),
                SizedBox(width: 36.w),
                CupertinoButton(
                  onPressed: () {
                    controller.selectedIndex.value = 1;
                  },
                  minSize: 0,
                  padding: EdgeInsets.zero,
                  child: Image.asset(img2, width: 72.w),
                ),
              ],
            );
          }),
          SizedBox(height: 20.w),
          Obx(() {
            if (controller.selectedIndex.value == 0) {
              return EmailInputListWidget(controller: controller);
            }
            return PhoneInputListWidget(controller: controller);
          }),
          AppButton(
            width: 580.w,
            height: 90.w,
            radius: 100.w,
            text: 'Register agora',
            onClick: () {
              Toast.show("Entrar");
            },
          ),
        ],
      ),
    );
  }
}

class EmailInputListWidget extends StatelessWidget {
  const EmailInputListWidget({
    super.key,
    required this.controller,
  });

  final RegisterController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 580.w,
          margin: EdgeInsets.only(top: 10.w),
          child: UserInfoInputField(
            prefixIcon: 'assets/images/reg-email.webp',
            editNode: controller.emailEditNode,
            hint: 'Email',
            errText: 'Email',
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
      ],
    );
  }
}

class PhoneInputListWidget extends StatelessWidget {
  const PhoneInputListWidget({
    super.key,
    required this.controller,
  });

  final RegisterController controller;

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
            prefixIcon: 'assets/images/key-gray.webp',
            editNode: controller.keyEditNode,
            hint: 'Senha (4-12 letras e números)',
            errText: 'Senha (4-12 letras e números)',
            isPassword: true,
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
      ],
    );
  }
}
