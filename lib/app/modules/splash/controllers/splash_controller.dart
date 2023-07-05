import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

import '../../../../util/Log.dart';

class SplashController extends GetxController {
  final count = 0.obs;

  @override
  void onInit() {
    Log.d("========onInit========");
    super.onInit();
    FlutterNativeSplash.remove();
  }

  @override
  void onReady() {
    super.onReady();
    Log.d("========onReady========");
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
