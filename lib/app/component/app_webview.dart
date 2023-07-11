import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'app_header.dart';

class AppWebview extends StatefulWidget {
  const AppWebview({super.key});

  @override
  State<AppWebview> createState() => _AppWebviewState();
}

class _AppWebviewState extends State<AppWebview> {
  final GlobalKey webViewKey = GlobalKey();

  bool _isAppBarVisible = true;
  double _statusBarHeight = 0.0;
  double _appBarHeight = kToolbarHeight;
  InAppWebViewController? webViewController;

  @override
  Widget build(BuildContext context) {

    if (_statusBarHeight == 0.0) {
      _statusBarHeight = MediaQuery.of(context).padding.top;
      _appBarHeight += _statusBarHeight;
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(_isAppBarVisible ?  _appBarHeight : 0),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: _isAppBarVisible ? _appBarHeight : 0,
          child: AppBar(
            titleSpacing: 0,
            leadingWidth: 0,
            title: const AppHeader(title: "Webview"),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: InAppWebView(
              initialUrlRequest: URLRequest(url: Uri.parse('https://github.com/flutter')),
              onWebViewCreated: (controller) {
                webViewController = controller;
              },
            )
          )
        ],
      )
    );
  }
}
