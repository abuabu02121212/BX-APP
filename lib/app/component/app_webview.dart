import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'app_header.dart';

enum ProgressIndicatorType { circular, linear }

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
        preferredSize: Size.fromHeight(_isAppBarVisible ?  _appBarHeight : 0),
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
                  initialUrlRequest: URLRequest(url: WebUri(widget.url)),
                  initialSettings: InAppWebViewSettings(
                      allowsBackForwardNavigationGestures: true
                  ),
                  onWebViewCreated: (controller) {
                    _webViewController = controller;
                  },
                  onProgressChanged: (controller, progress) {
                    setState(() {
                      _progress = progress / 100;
                    });
                  },
                ),
                _progress < 1.0 ? getProgressIndicator(type) : Container(),
              ],
            )
          )
        ],
      )
    );
  }
}