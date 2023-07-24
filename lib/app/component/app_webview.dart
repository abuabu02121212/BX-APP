import 'package:flutter/material.dart';
import 'package:flutter_comm/app/modules/login_register/views/login_regiseter_widget.dart';
import 'package:flutter_comm/http/comm_request.dart';
import 'package:flutter_comm/util/app_util.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import '../../globe_controller.dart';
import '../modules/main/controllers/main_controller.dart';
import '../routes/app_pages.dart';
import 'app_header.dart';

enum ProgressIndicatorType { circular, linear }

class EventHandle {
  static dealEvent(String url) {
    //路由协议：brazilapp://event?type=login
    Map<String, dynamic> params = {};
    // 将url ？ 后面的参数转换成map
    if (url.contains("?")) {
      final suffixStr = url.substring(url.indexOf("?") + 1).trim();
      final isEndEqual = suffixStr.endsWith("=") ? "1" : "0";
      suffixStr.split("&").forEach((itemArgument) {
        final itemArr = itemArgument.split("=");
        if (itemArr.first.isNotEmpty) {
          params[itemArr.first] = itemArr[1];
        }
      });
      params["isEndEqual"] = isEndEqual;
    }

    final globalController = Get.find<GlobeController>();

    switch (params["type"]) {
      case "login":
        {
          // 登录
          showLoginRegisterDialog();
        }
        break;
      case "home":
        {
          // 去首页
          MainController controller = Get.find<MainController>();
          controller.toHome();
        }
        break;
      case "recompensas":
        {
          if (globalController.isLogin()) {
            // 奖励记录
            Get.toNamed(Routes.APOSTAS);
          } else {
            showLoginRegisterDialog();
          }
        }
        break;
      case "deposit":
        {
          if (globalController.isLogin()) {
            // 存款
            Get.toNamed(Routes.DEPOSIT, arguments: {'index': 0})?.then((value) {
              requestCommBalance();
            });
          } else {
            showLoginRegisterDialog();
          }
        }
        break;
      case "withdraw":
        {
          if (globalController.isLogin()) {
            // 取款
            Get.toNamed(Routes.DEPOSIT, arguments: {'index': 1})?.then((value) {
              requestCommBalance();
            });
          } else {
            showLoginRegisterDialog();
          }
        }
        break;
      case "telegram":
        {
          if (globalController.isLogin()) {
            if (params['url'] != null && params['url'].toString().isNotEmpty) {
              AppUtil.launch(params['url'].toString());
            }
          } else {
            showLoginRegisterDialog();
          }
        }
        break;
      default:
        break;
    }
  }
}


class AppWebview extends StatefulWidget {
  AppWebview({super.key, required this.url, required this.title});

  String url;
  String title;

  @override
  State<AppWebview> createState() => _AppWebviewState();
}

class _AppWebviewState extends State<AppWebview> {
  final GlobalKey webViewKey = GlobalKey();

  bool _isAppBarVisible = true;
  double _statusBarHeight = 0.0;
  double _appBarHeight = kToolbarHeight;
  InAppWebViewController? _webViewController;

  double _progress = 0.0;
  ProgressIndicatorType type = ProgressIndicatorType.linear;

  _setProgress(double progress) {
    setState(() {
      _progress = progress;
    });
  }

  Widget getProgressIndicator(ProgressIndicatorType type) {
    switch (type) {
      case ProgressIndicatorType.circular:
        return Center(
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.white.withAlpha(70),
            ),
            child: const CircularProgressIndicator(),
          ),
        );
      case ProgressIndicatorType.linear:
      default:
        return SizedBox(
          height: 2,
          child: LinearProgressIndicator(
            value: _progress,
            backgroundColor: Colors.white,
            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xff011A51)),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_statusBarHeight == 0.0) {
      _statusBarHeight = MediaQuery.of(context).padding.top;
      _appBarHeight += _statusBarHeight;
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(_isAppBarVisible ? _appBarHeight : 0),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: _isAppBarVisible ? _appBarHeight : 0,
          child: AppBar(
            titleSpacing: 0,
            leadingWidth: 0,
            title: AppHeader(title: widget.title),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                InAppWebView(
                  key: webViewKey,
                  initialUrlRequest: URLRequest(url: Uri.parse(widget.url)),
                  onWebViewCreated: (controller) {
                    _webViewController = controller;
                  },
                  onProgressChanged: (controller, progress) {
                    setState(() {
                      _progress = progress / 100;
                    });
                  },
                  shouldOverrideUrlLoading: (controller, navigationAction) async {
                    String url = navigationAction.request.url!.toString();
                    // 如果是 brazilapp:// 开头的链接，就拦截
                    if (url.startsWith('brazilapp://')) {
                      print('blocking navigation to ${url.trim()}');
                      EventHandle.dealEvent(url.trim());
                      return NavigationActionPolicy.CANCEL;
                    }

                    return NavigationActionPolicy.ALLOW;
                  },
                ),
                _progress < 1.0 ? getProgressIndicator(type) : Container(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
