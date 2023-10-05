import 'package:draggable_float_widget/draggable_float_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_comm/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_comm/app/modules/home/controllers/home_requests.dart';
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
      width: 110.w,
      height: 110.w,
      config: DraggableFloatWidgetBaseConfig(
        initPositionYInTop: false,
        initPositionYMarginBorder: 50,
        borderTopContainTopBar: true,
        borderBottom: 120.w,
      ),
      onTap: () async {
        HomeController homeController = Get.find<HomeController>();
        if (!isHasCsUrl(homeController)) await requestCsData(homeController.csEntity);
        if (isHasCsUrl(homeController)) {
          Get.toNamed(Routes.WEBVIEW, arguments: WebURLUtil.getCsLinkParam(homeController.csEntity.value!.onlinecs));
        }
      },
      child: Image.asset("assets/images/float_service.webp", width: 110.w),
    );
  }

  bool isHasCsUrl(HomeController homeController) {
        var isHasCsUrl = homeController.csEntity.value?.onlinecs.isNotEmpty ?? false;
    return isHasCsUrl;
  }
}

OverlayUtil overlayUtil = OverlayUtil();
String key = "keyFloatServiceBtnWidget";

void showFloatService(BuildContext? context) {
  overlayUtil.show(key, const FloatServiceBtnWidget(), context!);
}
