import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../../util/toast_util.dart';
import '../../../app_style.dart';
import '../../../component/app_button.dart';
import '../../../component/app_header.dart';
import '../../../component/app_user_info_input_field.dart';
import '../controllers/center_pay_password_controller.dart';

class CenterPayPasswordView extends GetView<CenterPayPasswordController> {
  const CenterPayPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        titleSpacing: 0,
        leadingWidth: 0,
        toolbarHeight: 110.w,
        backgroundColor: const Color.fromRGBO(3, 90, 202, 1),
        title: const AppHeader(title: "Senha de pagamento"),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 30.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() {
                return Visibility(
                  visible: controller.getPayPasswordStatus(),
                  child: Container(
                    width: double.infinity.w,
                    margin: EdgeInsets.only(top: 10.w),
                    child: UserInfoInputField(
                      height: 114.w,
                      prefixIcon: 'assets/images/modify-key-1.webp',
                      editNode: controller.psw1EditNode,
                      prefixIconWidth: 38.w,
                      paddingLeft: 12.w,
                      paddingRight: 2.w,
                      hint: 'Digite sua senha atual.',
                      errText: '',
                      bgColor: const Color(0xff011A51),
                      border: Border.all(color: const Color(0xff2A2E3E), width: 1.w),
                      radius: 8.w,
                      isPassword: true,
                    ),
                  ),
                );
              }),
              Container(
                width: double.infinity.w,
                margin: EdgeInsets.only(top: 0.w),
                child: UserInfoInputField(
                  height: 114.w,
                  prefixIcon: 'assets/images/modify-key-2.webp',
                  editNode: controller.psw2EditNode,
                  prefixIconWidth: 38.w,
                  paddingLeft: 12.w,
                  paddingRight: 2.w,
                  hint: 'Por favor insira uma nova senha',
                  errText: '',
                  bgColor: const Color(0xff011A51),
                  border: Border.all(color: const Color(0xff2A2E3E), width: 1.w),
                  radius: 8.w,
                  isPassword: true,
                ),
              ),
              Container(
                width: double.infinity.w,
                margin: EdgeInsets.only(top: 0.w),
                child: UserInfoInputField(
                  height: 114.w,
                  prefixIcon: 'assets/images/modify-key-3.webp',
                  editNode: controller.psw3EditNode,
                  prefixIconWidth: 38.w,
                  paddingLeft: 12.w,
                  paddingRight: 2.w,
                  hint: 'Confirme a nova senha',
                  errText: '',
                  bgColor: const Color(0xff011A51),
                  border: Border.all(color: const Color(0xff2A2E3E), width: 1.w),
                  radius: 8.w,
                  isPassword: true,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.w, right: 10.w),
                child: Text(
                  "* Insira 6 - 12 caracteres alfanuméricos. não diferencia maiúsculas de minúsculas. (caracteres chineses não permitidos)",
                  style: TextStyle(
                    fontSize: 26.w,
                    color: const Color(0xffffffff),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: 40.w),
              Center(
                child: AppButton(
                  width: 580.w,
                  height: 90.w,
                  radius: 100.w,
                  text: 'Enviar',
                  onClick: () {
                    controller.submit();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
