import 'package:flutter_easyloading/flutter_easyloading.dart';

class AppLoading {
  static show() {
    EasyLoading.show(
      status: 'loading...',
    );
  }

  static close() {
    EasyLoading.isShow ? EasyLoading.dismiss() : null;
  }
}