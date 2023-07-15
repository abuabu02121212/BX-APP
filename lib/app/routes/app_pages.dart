import 'package:get/get.dart';

import '../modules/apostas/bindings/apostas_binding.dart';
import '../modules/apostas/views/apostas_view.dart';
import '../modules/component_test/bindings/component_test_binding.dart';
import '../modules/component_test/views/component_test_view.dart';
import '../modules/deposit/bindings/deposit_binding.dart';
import '../modules/deposit/views/deposit_view.dart';
import '../modules/forget_psw/bindings/forget_psw_binding.dart';
import '../modules/forget_psw/views/forget_psw_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home_menu/bindings/home_menu_binding.dart';
import '../modules/home_menu/views/home_menu_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/login_register/bindings/login_register_binding.dart';
import '../modules/login_register/views/login_register_view.dart';
import '../modules/main/bindings/main_binding.dart';
import '../modules/main/views/main_view.dart';
import '../modules/mine/bindings/mine_binding.dart';
import '../modules/mine/views/mine_view.dart';
import '../modules/notice_list/bindings/notice_list_binding.dart';
import '../modules/notice_list/views/notice_list_view.dart';
import '../modules/promotion/bindings/promotion_binding.dart';
import '../modules/promotion/views/promotion_view.dart';
import '../modules/recompensas/bindings/recompensas_binding.dart';
import '../modules/recompensas/views/recompensas_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/transaction/bindings/transaction_binding.dart';
import '../modules/transaction/views/transaction_view.dart';
import '../modules/vip/bindings/vip_binding.dart';
import '../modules/vip/views/vip_view.dart';
import '../modules/webview/bindings/webview_binding.dart';
import '../modules/webview/views/webview_view.dart';
import '../modules/withdraw/bindings/withdraw_binding.dart';
import '../modules/withdraw/views/withdraw_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.MINE,
      page: () => const MineView(),
      binding: MineBinding(),
    ),
    GetPage(
      name: _Paths.MAIN,
      page: () => MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: _Paths.COMPONENT_TEST,
      page: () => const ComponentTestView(),
      binding: ComponentTestBinding(),
    ),
    GetPage(
      name: _Paths.PROMOTION,
      page: () => PromotionView(),
      binding: PromotionBinding(),
    ),
    GetPage(
      name: _Paths.DEPOSIT,
      page: () => const DepositView(),
      binding: DepositBinding(),
    ),
    GetPage(
      name: _Paths.VIP,
      page: () => const VipView(),
      binding: VipBinding(),
    ),
    GetPage(
      name: _Paths.WITHDRAW,
      page: () => const WithdrawView(),
      binding: WithdrawBinding(),
    ),
    GetPage(
      name: _Paths.TRANSACTION,
      page: () => const TransactionView(),
      binding: TransactionBinding(),
    ),
    GetPage(
      name: _Paths.APOSTAS,
      page: () => const ApostasView(),
      binding: ApostasBinding(),
    ),
    GetPage(
      name: _Paths.RECOMPENSAS,
      page: () => const RecompensasView(),
      binding: RecompensasBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_REGISTER,
      page: () => const LoginRegisterView(),
      binding: LoginRegisterBinding(),
    ),
    GetPage(
      name: _Paths.NOTICE_LIST,
      page: () => const NoticeListView(),
      binding: NoticeListBinding(),
    ),
    GetPage(
      name: _Paths.FORGET_PSW,
      page: () => const ForgetPswView(),
      binding: ForgetPswBinding(),
    ),
    GetPage(
      name: _Paths.WEBVIEW,
      page: () => const WebviewView(),
      binding: WebviewBinding(),
    ),
    GetPage(
      name: _Paths.HOME_MENU,
      page: () => const HomeMenuView(),
      binding: HomeMenuBinding(),
    ),
  ];
}
