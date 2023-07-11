import 'package:flutter/material.dart';
import 'package:flutter_comm/app/component/app_webview.dart';

import 'package:get/get.dart';

import '../controllers/webview_controller.dart';

class WebviewView extends GetView<WebviewController> {
  const WebviewView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const AppWebview();
  }
}
