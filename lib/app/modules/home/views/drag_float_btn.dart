import 'package:draggable_float_widget/draggable_float_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../util/Log.dart';
import '../../../../util/overlay_util.dart';

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
        Log.d("=================");
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
