import 'package:draggable_float_widget/draggable_float_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_comm/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_comm/app/modules/login_register/views/login_regiseter_widget.dart';
import 'package:flutter_comm/globe_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../util/overlay_util.dart';
import '../../../../util/weburl_util.dart';
import '../../../routes/app_pages.dart';

class FloatServiceBtnWidget extends StatelessWidget {
  const FloatServiceBtnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableFloatWidget(
      width: 90.w,
      height: 90.w,
      config: DraggableFloatWidgetBaseConfig(
        initPositionYInTop: false,
        initPositionYMarginBorder: 50,
        borderTopContainTopBar: true,
        borderBottom: 120.w,
      ),
      onTap: () {
        GlobeController globeController = Get.find<GlobeController>();
        if(globeController.isLogin()){
          HomeController homeController = Get.find<HomeController>();
          Get.toNamed(Routes.WEBVIEW, arguments: WebURLUtil.getCsLinkParam(homeController.csEntity.value!.onlinecs));
        }else{
          showLoginRegisterDialog();
        }
      },
      child: Image.asset("assets/images/float_service.webp", width: 90.w),
    );
  }
}

OverlayUtil overlayUtil = OverlayUtil();
String key = "keyFloatServiceBtnWidget";

void showFloatService(BuildContext? context) {
  overlayUtil.show(key, const FloatServiceBtnWidget(), context!);
}
