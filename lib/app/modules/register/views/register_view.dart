import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_comm/app/routes/app_pages.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../../util/weburl_util.dart';
import '../../../component/app_button.dart';
import '../../../component/app_user_info_input_field.dart';
import '../controllers/register_controller.dart';
import 'email_phone_tab.dart';

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
  RegisterWidget({super.key}) {
    Get.create<RegisterController>(() => RegisterController());
    controller = Get.put(RegisterController());
  }

  late final RegisterController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 730.w,
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 50.w),
          EmailAndPhoneTab(
            onTabSelectChanged: (index) {
              controller.selectedIndex.value = index;
            },
          ),
          SizedBox(height: 20.w),
          Obx(() {
            if (controller.selectedIndex.value == 0) {
              return EmailInputListWidget(controller: controller);
            }
            return PhoneInputListWidget(controller: controller);
          }),
          SizedBox(height: 20.w),
          AppButton(
            width: 580.w,
            height: 90.w,
            radius: 100.w,
            text: 'Register agora',
            onClick: () {
              controller.register();
            },
          ),
          SizedBox(height: 30.w),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.only(left: 50.w),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Obx(() {
                    bool isAgreed = controller.isAgreed.value;
                    return CupertinoButton(
                      onPressed: () {
                        controller.isAgreed.value = !controller.isAgreed.value;
                      },
                      minSize: 0,
                      padding: EdgeInsets.only(left: 15.w, right: 8.w, top: 15.w, bottom: 15.w),
                      child: Image.asset(
                        isAgreed ? "assets/images/i-radio-active.webp" : "assets/images/i-radio-no.webp",
                        width: 40.w,
                      ),
                    );
                  }),
                  SizedBox(width: 10.w,),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(children: [
                          TextSpan(
                            text: "Eu concordo \n",
                            style: TextStyle(fontSize: 24.w, color: Colors.white, fontWeight: FontWeight.w400),
                          ),
                          TextSpan(
                            text: "com os termos e política de privacidade.",
                            recognizer: TapGestureRecognizer()..onTap = (){
                              Get.toNamed(Routes.WEBVIEW, arguments: WebURLUtil.REGISTER_RULES);
                            },
                            style: TextStyle(
                              fontSize: 24.w,
                              color: const Color(0xff0ED1F4),
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ])
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
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
            errText: 'Erro de e-mail',
            isEmail: true,
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
            errText: 'Erro no código de verificação',
            codeSender: controller.emailCodeSender,
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
            hint: 'Phone',
            errText: 'Número de telefone errado',
            isPhone: true,
          ),
        ),
        SizedBox(
          width: 580.w,
          child: UserInfoInputField(
            prefixIcon: 'assets/images/key-gray.webp',
            editNode: controller.key2EditNode,
            hint: 'Senha (4-12 letras e números)',
            errText: 'Senha (4-12 letras e números)',
            isPassword: true,
          ),
        ),
        SizedBox(
          width: 580.w,
          child: UserInfoInputField(
            prefixIcon: 'assets/images/reg-code.webp',
            editNode: controller.code2EditNode,
            hint: 'Código de verificação',
            errText: 'Erro no código de verificação',
            codeSender: controller.phoneCodeSender,
            isCode: true,
          ),
        ),
      ],
    );
  }
}
