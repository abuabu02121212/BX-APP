import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_comm/app/routes/app_pages.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../../app_config.dart';
import '../../../../generated/l10n.dart';
import '../../../../util/toast_util.dart';
import '../../../component/app_button.dart';
import '../../../component/app_user_info_input_field.dart';
import '../../forget_psw/views/forget_psw_widget.dart';
import '../../login_register/views/login_regiseter_widget.dart';
import '../../register/views/register_view.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginView'),
        centerTitle: true,
      ),
      body: Center(
        child: LoginWidget(),
      ),
    );
  }
}

class LoginWidget extends StatelessWidget {
  LoginWidget({super.key}) {
    Get.create<LoginController>(() => LoginController());
    controller = Get.put(LoginController());
  }

  late final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24.w),
        child: Container(
          width: 600.w,
          height: 650.w,
          color: const Color(0xff252527),
          padding: EdgeInsets.only(left: 30.w, right: 30.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 32.w),
                      child: Text(
                        S.current.login,
                        style: TextStyle(
                          fontSize: 32.w,
                          color: const Color(0xffffffff),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0.w,
                      top: 28.w,
                      child: CupertinoButton(
                        minSize: 0,
                        padding: EdgeInsets.only(left: 10.w, top: 10.w, bottom: 10.w),
                        onPressed: () {
                          Get.back();
                        },
                        child: Image.asset("assets/images/close.webp", width: 24.w),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 56.w),
                child: UserInfoInputField(
                  prefixIcon: 'assets/images/input_uname.webp',
                  editNode: controller.userNameEditNode,
                  hint: 'Por favor, insira o nome de usuário',
                  errText: 'Número de celular de 10 ou 11 dígitos',
                  isUserName: true,
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: UserInfoInputField(
                  prefixIcon: 'assets/images/input_psw.webp',
                  editNode: controller.keyEditNode,
                  hint: 'Senha (4-12 letras e números)',
                  errText: 'Senha (4-12 letras e números)',
                  isPassword: true,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.w, left: 5.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/checked_icon.webp", width: 30.w),
                        SizedBox(width: 10.w),
                        Text(
                          S.current.RememberMe,
                          style: TextStyle(
                            fontSize: 24.w,
                            color: const Color(0xff8F9DAB),
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                    CupertinoButton(
                      onPressed: () {
                        Get.back();
                        showForgetPswDialog();
                      },
                      minSize: 0,
                      padding: EdgeInsets.zero,
                      child: Text(
                        S.current.ForgotPassword,
                        style: TextStyle(
                          fontSize: 26.w,
                          color: const Color(0xff3EA1F8),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 35.w),
                child: AppButton(
                  width: 540.w,
                  height: 80.w,
                  radius: 16.w,
                  text: S.current.login,
                  onClick: () {
                    controller.login();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 2.w, right: 2.w, top: 30.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CupertinoButton(
                      onPressed: () {
                        Get.back();
                        showForgetPswDialog();
                      },
                      minSize: 0,
                      padding: EdgeInsets.zero,
                      child: Text(
                        S.current.PlayDemo,
                        style: TextStyle(
                          fontSize: 26.w,
                          color: const Color(0xff3EA1F8),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    CupertinoButton(
                      onPressed: () {
                        Get.back();
                        showRegisterDialog();
                      },
                      minSize: 0,
                      padding: EdgeInsets.zero,
                      child: Text(
                        S.current.RegisterAnAccount,
                        style: TextStyle(
                          fontSize: 26.w,
                          color: const Color(0xff3EA1F8),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )
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

void showLoginDialog() {
  String routerName = 'login-dialog';
  if (appNavigatorObserver.curRouterName == routerName) {
    return;
  }
  Get.dialog(LoginWidget(), name: routerName, barrierDismissible: false
      //  barrierColor: const Color.fromRGBO(0, 0, 0, 0.7),
      );
}
