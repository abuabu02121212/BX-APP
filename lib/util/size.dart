import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Adapt {
  static px(num value) {
    return value.w;
  }

  static screenW() {
    return Get.width;
  }

  static screenH() {
    return Get.height;
  }
}

extension NumberExtension on num {
  get px => Adapt.px(this);
}
