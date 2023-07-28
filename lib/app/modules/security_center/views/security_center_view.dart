import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_comm/app/routes/app_pages.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../component/app_header.dart';
import '../controllers/security_center_controller.dart';

class SecurityCenterView extends GetView<SecurityCenterController> {
  const SecurityCenterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff020a1c),
      appBar: AppBar(
        titleSpacing: 0,
        leadingWidth: 0,
        toolbarHeight: 110.w,
        title: const AppHeader(title: "Centro de Segurança"),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: 45.w, right: 45.w, top: 45.w),
          decoration: BoxDecoration(color: const Color(0xff1a478e), borderRadius: BorderRadius.circular(20.w)),
          child: ListView(
            shrinkWrap: true,
            children: List.generate(
                5,
                (index) => ItemWidget(
                      index: index,
                      isLast: index == 4,
                    )),
          ),
        ),
      ),
    );
  }
}

class Line extends StatelessWidget {
  const Line({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 2.w,
      color: const Color.fromRGBO(255, 255, 255, 0.25),
    );
  }
}

class ItemWidget extends StatelessWidget {
  ItemWidget({
    super.key,
    required this.index,
    required this.isLast,
  });

  final int index;
  final bool isLast;
  final List<String> titleList = [
    "Informações pessoais",
    "Alterar senha de entrar",
    "Senha de pagamento",
    "Número da conta bancária",
    "Verificação de telefone",
  ];
  final List<String> textList = [
    "Informações pessoais completas.",
    "Combinação recomendada de letras \ne números",
    "Definir a senha de pagamento para melhorar a segurança da sua conta",
    "Adicionar número de conta bancária",
    "Verificação de telefone",
  ];

  @override
  Widget build(BuildContext context) {
    var imgPath = "assets/images/securiy_center_left_${index + 1}.webp";
    SecurityCenterController controller = Get.put(SecurityCenterController());
    if (index == 4 && !controller.isShowBindPhone) {
      imgPath = "assets/images/securiy_center_left_5_mail.webp";
    }
    return Column(
      children: [
        CupertinoButton(
          onPressed: () {
            if (index == 0) {
              Get.toNamed(Routes.CENTER_USER_INFO);
            } else if (index == 1) {
              Get.toNamed(Routes.CENTER_UPDATE_LOGIN_PASSWORD);
            } else if (index == 2) {
              Get.toNamed(Routes.CENTER_PAY_PASSWORD);
            } else if (index == 3) {
              Get.toNamed(Routes.CENTER_BANK_LIST);
            } else if (index == 4) {
              Get.toNamed(Routes.CENTER_PHONE);
            }
          },
          minSize: 0,
          padding: EdgeInsets.zero,
          child: Container(
            padding: EdgeInsets.only(top: 40.w, bottom: 32.w, left: 14.w, right: 14.w),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  imgPath,
                  width: 90.w,
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        titleList[index],
                        style: TextStyle(fontSize: 28.w, color: Colors.white, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(height: 6.w),
                      Text(
                        textList[index],
                        maxLines: 3,
                        style: TextStyle(fontSize: 24.w, color: const Color.fromRGBO(255, 255, 255, 0.70), fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Obx(() {
                        return Opacity(
                          opacity: controller.isSetupList[index].value ? 1 : 0,
                          child: Padding(
                            padding: EdgeInsets.all(10.w),
                            child: Image.asset(
                              "assets/images/security_center_right_ok.webp",
                              width: 32.w,
                            ),
                          ),
                        );
                      }
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.w),
                      child: Image.asset(
                        "assets/images/edit-1.webp",
                        width: 32.w,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.w),
                      child: Image.asset(
                        "assets/images/back_white.webp",
                        width: 20.w,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        isLast ? const SizedBox() : const Line(),
      ],
    );
  }
}
