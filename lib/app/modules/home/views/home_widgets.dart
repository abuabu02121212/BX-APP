import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_comm/app/modules/home/views/swiper_component_notice.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:marqueer/marqueer.dart';
import '../../../../globe_controller.dart';
import '../../../../http/comm_request.dart';
import '../../../../util/app_util.dart';
import '../../../app_style.dart';
import '../../../component/app_button.dart';
import '../../../routes/app_pages.dart';
import '../../home_menu/views/home_menu_view.dart';
import '../../login_register/views/login_regiseter_widget.dart';
import '../../main/controllers/main_controller.dart';
import '../controllers/home_controller.dart';
import '../controllers/home_requests.dart';



class HomeHeader extends StatelessWidget {
  HomeHeader({
    super.key,
  });

  final GlobeController globeController = Get.find<GlobeController>();
  final angel = 0.0.obs;
  final isEnd = true.obs;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 110.w,
      decoration: BoxDecoration(
        color: headerBgColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CupertinoButton(
            onPressed: () {
              showHomeDrawer();
            },
            minSize: 0,
            padding: EdgeInsets.all(16.w),
            child: Image.asset("assets/images/i-popup-btn.webp", width: 40.w),
          ),
          Image.asset("assets/images/logo.webp", width: 120.w),
          SizedBox(width: 90.w),
          Obx(() {
            var userInfo = globeController.balance.value;
            return userInfo == null
                ? AppButton(
              width: 350.w,
              height: 60.w,
              radius: 30.w,
              text: 'Registar Conta',
              onClick: () {
                showLoginRegisterDialog();
              },
            )
                : Container(
              width: 350.w,
              height: 60.w,
              decoration: BoxDecoration(
                  gradient: btnLinearBg,
                  borderRadius: BorderRadius.circular(30.w),
                  border: Border.all(color: const Color(0x66335a94), width: 1.w)),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CupertinoButton(
                    onPressed: () {
                      if (isEnd.value) {
                        isEnd.value = false;
                        angel.value += 1;
                        requestCommBalance();
                      }
                    },
                    minSize: 0,
                    padding: EdgeInsets.zero,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.w, top: 10.w, bottom: 10.w, right: 0.w),
                      child: Obx(() {
                        return AnimatedRotation(
                          turns: angel.value,
                          duration: const Duration(milliseconds: 600),
                          onEnd: () {
                            isEnd.value = true;
                          },
                          child: Image.asset("assets/images/refresher_balance.webp", width: 36.w),
                        );
                      }),
                    ),
                  ),
                  Text(
                    AppUtil.amountFormat(globeController.balance.value?.brl ?? '0'),
                    style: TextStyle(fontSize: 26.w, color: Colors.white, fontWeight: FontWeight.w400),
                  ),
                  AppButton(
                    width: 121.w,
                    height: 60.w,
                    radius: 30.w,
                    text: 'Conta',
                    onClick: () {
                      MainController mainController = Get.find<MainController>();
                      mainController.changeSelectedTab(2);
                    },
                  )
                ],
              ),
            );
          }),
          SizedBox(width: 26.w),
          CupertinoButton(
            onPressed: () {
              if (globeController.isLogin()) {
                Get.toNamed(Routes.NOTICE_LIST);
              } else {
                showLoginRegisterDialog();
              }
            },
            minSize: 0,
            padding: EdgeInsets.all(10.w),
            child: Image.asset("assets/images/home_message.webp", width: 60.w),
          ),
        ],
      ),
    );
  }
}

class HomeMarquee extends StatelessWidget {
  HomeMarquee({
    super.key,
  });

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 40.w, left: 20.w, right: 20.w),
      height: 60.w,
      decoration: BoxDecoration(color: const Color.fromRGBO(3, 51, 119, 1), borderRadius: BorderRadius.circular(30.w)),
      child: CupertinoButton(
        onPressed: () {
          requestNotice(controller.noticeListRx, controller.showingMarqueeText);
          showNoticeListDialog();
        },
        minSize: 0,
        padding: EdgeInsets.zero,
        child: Row(
          children: [
            SizedBox(width: 20.w),
            Image.asset("assets/images/i-notice.webp", width: 36.w),
            Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 18.w),
                  child: Obx(() {
                    return Marqueer(
                        pps: 30,
                        infinity: true,
                        child: Text(
                          "${controller.showingMarqueeText.value}                        ",
                          style: TextStyle(
                            fontSize: 22.w,
                            color: Colors.white,
                          ),
                        ));
                  }),
                )),
          ],
        ),
      ),
    );
  }
}

class BrandListWidget extends StatelessWidget {
  BrandListWidget({
    super.key,
  });

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 68.w, left: 20.w, right: 20.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Provedores de jogos", style: TextStyle(fontSize: 32.w, color: Colors.white, fontWeight: FontWeight.w700)),
          SizedBox(height: 10.w),
          Image.asset("assets/images/jobs.webp", width: 704.w),
          SizedBox(height: 24.w),
          Image.asset("assets/images/dot_line.webp", width: double.infinity),
          SizedBox(height: 30.w),
          Text("Entre em contato conosco", style: TextStyle(fontSize: 32.w, color: Colors.white, fontWeight: FontWeight.w700)),
          SizedBox(height: 10.w),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CupertinoButton(
                minSize: 0,
                padding: EdgeInsets.zero,
                onPressed: () async {
                  if (controller.csEntity.value == null) {
                    await requestCsData(controller.csEntity);
                  }
                  var facebook = controller.csEntity.value?.facebook ?? "-";
                  AppUtil.launch(facebook);
                },
                child: Image.asset("assets/images/index-b-f.webp", width: 76.w),
              ),
              SizedBox(width: 30.w),
              CupertinoButton(
                minSize: 0,
                padding: EdgeInsets.zero,
                onPressed: () async {
                  if (controller.csEntity.value == null) {
                    await requestCsData(controller.csEntity);
                  }
                  var telegram = controller.csEntity.value?.telegram ?? "-";
                  AppUtil.launch(telegram);
                },
                child: Image.asset("assets/images/index-b-t.webp", width: 76.w),
              ),
            ],
          ),
          SizedBox(height: 24.w),
          Image.asset("assets/images/dot_line.webp", width: double.infinity),
          SizedBox(height: 30.w),
          Text("Método de pagamento", style: TextStyle(fontSize: 32.w, color: Colors.white, fontWeight: FontWeight.w700)),
          SizedBox(height: 10.w),
          Image.asset("assets/images/index-b-p.webp", width: 139.w),
          SizedBox(height: 30.w),
          Image.asset("assets/images/dot_line.webp", width: double.infinity),
          SizedBox(height: 30.w),
          Text("Responsabilidade", style: TextStyle(fontSize: 32.w, color: Colors.white, fontWeight: FontWeight.w700)),
          SizedBox(height: 30.w),
          Image.asset("assets/images/index-b-r.webp", width: 92.w),
          SizedBox(height: 30.w),
          Text(
            "A LUCKYKING.com opera através de Elektra Entertainment B.V., com número de registro 157256 e domicílio social em Julianaplein 36 Willemstad, Curaçao, certificada pelo governo de Curaçao através da Licença 8048/JAZ2021-105 emitida para prestação de serviço de Cassino e apostas esportivas.",
            style: TextStyle(
              fontSize: 26.w,
              color: const Color.fromRGBO(255, 255, 255, 0.60),
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 30.w),
          BottomIconsWidget(),
          SizedBox(height: 50.w),
        ],
      ),
    );
  }
}

class BottomIconsWidget extends StatelessWidget {
  BottomIconsWidget({
    super.key,
  });

  final List<String> names = ["Safe \npayment", "24/7 \nsupport", "Mobile \nfriends", "Highest \nodds", "Multi- \ncurrency"];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
          names.length,
              (index) => Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/bottom${index + 1}.webp",
                width: 42.w,
              ),
              SizedBox(height: 8.w),
              Text(
                names[index],
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22.w, color: const Color(0xffCCCED2), fontWeight: FontWeight.w400),
              ),
            ],
          )),
    );
  }
}