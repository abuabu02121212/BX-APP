import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_comm/util/Log.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/observers/route_observer.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'app/routes/app_pages.dart';
import 'app_config.dart';
import 'err_page.dart';
import 'globe_exception_catch.dart';
import 'navigator/observer.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized(); // 保证 WidgetsBindingObserver使用时候，已经初始化
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  GlobeExceptionHandler().init(() => runApp(
    const ScreenAdapterConfigurationWidget(
      child: RefreshConfigurationWidget(),
    ),
  ));
  //FlutterChain.capture(() => runApp(buildScreenUtilInit(child: getRootWidget())));
  if (Platform.isAndroid) {
    /// 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  }
}

class RefreshConfigurationWidget extends StatelessWidget {
  const RefreshConfigurationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshConfiguration(
        headerBuilder: () => const ClassicHeader(refreshingIcon: CupertinoActivityIndicator()),
        footerBuilder: () => const ClassicFooter(loadingIcon: CupertinoActivityIndicator()),
        hideFooterWhenNotFull: false,
        // Viewport不满一屏时,禁用上拉加载更多功能
        enableBallisticLoad: false,
        // 可以通过惯性滑动触发加载更多
        enableBallisticRefresh: false,
        child: Builder(builder: (context) {
          Log.d("===根页面重构？===Builder========");
          return const AppConfigurationWidget();
        }));
  }
}

class ScreenAdapterConfigurationWidget extends StatelessWidget {
  const ScreenAdapterConfigurationWidget({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(750, 1334),
      minTextAdapt: true,
      builder: (context, widget) => child,
    );
  }
}

class AppConfigurationWidget extends StatelessWidget {
  const AppConfigurationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // showPerformanceOverlay:true, // CPU/UI性能监控
      enableLog: false,

      /// title 只对Android生效，ios种，任务视图名称取的是 Info.pList 文件中的CFBundleDisplayName或CFBundleName
      title: "app标题",
      /// 4. Theme.of方法可以获取当前的 ThemeData，MaterialDesign种有些样式不能自定义，比如导航栏高度
      theme: appThemeData,
      defaultTransition: Transition.rightToLeftWithFade,

      /// routes 路由配置：对象是Map<String, WidgetBuilder>
      // routes: [], 这种方式配置路由，defaultTransition 不能生效
      getPages: AppPages.routes,
      /// 与 routes 中的 / 效果基本一致， 指定应用的第一个显示页面
      /// /// home 与 routes配置的 / 互斥 同时配置会抛异常
      initialRoute: AppPages.INITIAL,
      initialBinding: AppInitBinding(context),

      /// 配置404页面: 如果路由不存在则跳到该页面
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (BuildContext context) => const ErrPage());
      },
      builder: (context, widget) {
        return MediaQuery(
          ///设置文字大小不随系统设置改变
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: widget ?? const SizedBox(),
        );
      },

      /// 配置页面离开和进入的监听
      navigatorObservers: [MyNavigatorObserver(), routeObserver],
      routingCallback: (Routing? routing) {
        Log.d('cur route: ${routing?.current}  name: ${routing?.route?.settings.name}');
      },
    );
  }
}
