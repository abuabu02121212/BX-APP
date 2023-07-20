import 'package:flutter/cupertino.dart';
import 'package:flutter_comm/util/Log.dart';

class AppNavigatorObserver extends NavigatorObserver {
  RoutePopCallBack? popCallBack;
  List<Route<dynamic>> routerList = [];
  List<String?> routerNameList = [];
  String? curRouterName;
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    routerList.add(route);
    routerNameList.add(route.settings.name);
    curRouterName = routerNameList.isEmpty ? "" : routerNameList.last;
    print("LLpp ========didPush========curRouterName:$curRouterName====");
    Log.d("========didPush========curRouterName:$curRouterName====");
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    var routeName = route.settings.name;
    if (popCallBack != null) {
      popCallBack!(routeName);

      /// 重置
      popCallBack = null;
    }
    routerList.removeLast();
    routerNameList.removeLast();
    curRouterName = routerNameList.isEmpty ? "" : routerNameList.last;
    Log.d("========didPop========routeName:$routeName====");
    print("====LLpp====didPop========routeName:$routeName====");
  }

  void setPopListener(RoutePopCallBack callBack) {
    popCallBack = callBack;
  }
}

typedef RoutePopCallBack = void Function(String? routeName);
