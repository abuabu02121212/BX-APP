import 'package:get/get.dart';
import 'package:flutter_comm/app/modules/change_profile/change_profile_binding.dart';
import 'package:flutter_comm/app/modules/change_profile/change_profile_view.dart';
import 'package:flutter_comm/app/modules/deposit_ph/deposit_ph_binding.dart';
import 'package:flutter_comm/app/modules/deposit_ph/deposit_ph_view.dart';
import 'package:flutter_comm/app/modules/interest/interest_binding.dart';
import 'package:flutter_comm/app/modules/interest/interest_view.dart';
import 'package:flutter_comm/app/modules/main_wallet/main_wallet_binding.dart';
import 'package:flutter_comm/app/modules/main_wallet/main_wallet_view.dart';
import 'package:flutter_comm/app/modules/message_center/message_center_binding.dart';
import 'package:flutter_comm/app/modules/message_center/message_center_view.dart';
import 'package:flutter_comm/app/modules/my_ph/my_ph_binding.dart';
import 'package:flutter_comm/app/modules/my_ph/my_ph_view.dart';
import 'package:flutter_comm/app/modules/personal_information/personal_information_binding.dart';
import 'package:flutter_comm/app/modules/personal_information/personal_information_view.dart';
import 'package:flutter_comm/app/modules/promotion_ph/promotion_ph_binding.dart';
import 'package:flutter_comm/app/modules/promotion_ph/promotion_ph_view.dart';
import 'package:flutter_comm/app/modules/vip_ph/vip_ph_binding.dart';
import 'package:flutter_comm/app/modules/vip_ph/vip_ph_view.dart';
import 'package:flutter_comm/app/modules/withdraw_ph/withdraw_ph_binding.dart';
import 'package:flutter_comm/app/modules/withdraw_ph/withdraw_ph_view.dart';
import 'package:flutter_comm/app/modules/withdraw_pin/withdraw_pin_binding.dart';
import 'package:flutter_comm/app/modules/withdraw_pin/withdraw_pin_view.dart';

import '../modules/agent/bindings/agent_binding.dart';
import '../modules/agent/views/agent_view.dart';
import '../modules/apostas/bindings/apostas_binding.dart';
import '../modules/apostas/views/apostas_view.dart';
import '../modules/center_bank_list/bindings/center_bank_list_binding.dart';
import '../modules/center_bank_list/views/center_bank_list_view.dart';
import '../modules/center_bank_list_add/bindings/center_bank_list_add_binding.dart';
import '../modules/center_bank_list_add/views/center_bank_list_add_view.dart';
import '../modules/center_pay_password/bindings/center_pay_password_binding.dart';
import '../modules/center_pay_password/views/center_pay_password_view.dart';
import '../modules/center_pay_password_sms/bindings/center_pay_password_sms_binding.dart';
import '../modules/center_pay_password_sms/views/center_pay_password_sms_view.dart';
import '../modules/center_phone/bindings/center_phone_binding.dart';
import '../modules/center_phone/views/center_phone_view.dart';
import '../modules/center_update_login_password/bindings/center_update_login_password_binding.dart';
import '../modules/center_update_login_password/views/center_update_login_password_view.dart';
import '../modules/center_user_info/bindings/center_user_info_binding.dart';
import '../modules/center_user_info/views/center_user_info_view.dart';
import '../modules/component_test/bindings/component_test_binding.dart';
import '../modules/component_test/views/component_test_view.dart';
import '../modules/deposit/bindings/deposit_binding.dart';
import '../modules/deposit/views/deposit_view.dart';
import '../modules/deposit_ph/deposit_ph_binding.dart';
import '../modules/deposit_ph/deposit_ph_binding.dart';
import '../modules/deposit_ph/deposit_ph_view.dart';
import '../modules/deposit_ph/deposit_ph_view.dart';
import '../modules/forget_psw/bindings/forget_psw_binding.dart';
import '../modules/forget_psw/views/forget_psw_view.dart';
import '../modules/game_list/bindings/game_list_binding.dart';
import '../modules/game_list/views/game_list_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home_menu/bindings/home_menu_binding.dart';
import '../modules/home_menu/views/home_menu_view.dart';
import '../modules/interest/interest_binding.dart';
import '../modules/interest/interest_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/login_register/bindings/login_register_binding.dart';
import '../modules/login_register/views/login_register_view.dart';
import '../modules/main/bindings/main_binding.dart';
import '../modules/main/views/main_view.dart';
import '../modules/main_wallet/main_wallet_binding.dart';
import '../modules/main_wallet/main_wallet_binding.dart';
import '../modules/main_wallet/main_wallet_view.dart';
import '../modules/main_wallet/main_wallet_view.dart';
import '../modules/mine/bindings/mine_binding.dart';
import '../modules/mine/views/mine_view.dart';
import '../modules/my_ph/my_ph_binding.dart';
import '../modules/my_ph/my_ph_binding.dart';
import '../modules/my_ph/my_ph_view.dart';
import '../modules/my_ph/my_ph_view.dart';
import '../modules/notice_list/bindings/notice_list_binding.dart';
import '../modules/notice_list/views/notice_list_view.dart';
import '../modules/personal_information/personal_information_binding.dart';
import '../modules/personal_information/personal_information_view.dart';
import '../modules/promotion/bindings/promotion_binding.dart';
import '../modules/promotion/views/promotion_view.dart';
import '../modules/promotion_ph/promotion_ph_binding.dart';
import '../modules/promotion_ph/promotion_ph_binding.dart';
import '../modules/promotion_ph/promotion_ph_view.dart';
import '../modules/promotion_ph/promotion_ph_view.dart';
import '../modules/recompensas/bindings/recompensas_binding.dart';
import '../modules/recompensas/views/recompensas_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/security_center/bindings/security_center_binding.dart';
import '../modules/security_center/views/security_center_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/transaction/bindings/transaction_binding.dart';
import '../modules/transaction/views/transaction_view.dart';
import '../modules/vip/bindings/vip_binding.dart';
import '../modules/vip/views/vip_view.dart';
import '../modules/vip_ph/vip_ph_binding.dart';
import '../modules/vip_ph/vip_ph_binding.dart';
import '../modules/vip_ph/vip_ph_view.dart';
import '../modules/vip_ph/vip_ph_view.dart';
import '../modules/webview/bindings/webview_binding.dart';
import '../modules/webview/views/webview_view.dart';
import '../modules/withdraw/bindings/withdraw_binding.dart';
import '../modules/withdraw/views/withdraw_view.dart';
import '../modules/withdraw_ph/withdraw_ph_binding.dart';
import '../modules/withdraw_ph/withdraw_ph_view.dart';
import '../modules/withdraw_pin/withdraw_pin_binding.dart';
import '../modules/withdraw_pin/withdraw_pin_view.dart';

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
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.MINE,
      page: () => const MineView(),
      binding: MineBinding(),
    ),
    GetPage(
      name: _Paths.MAIN,
      page: () => const MainView(),
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
      page: () => DepositView(),
      binding: DepositBinding(),
    ),
    GetPage(
      name: _Paths.VIP,
      page: () => VipView(),
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
      page: () => HomeMenuView(),
      binding: HomeMenuBinding(),
    ),
    GetPage(
      name: _Paths.SECURITY_CENTER,
      page: () => const SecurityCenterView(),
      binding: SecurityCenterBinding(),
    ),
    GetPage(
      name: _Paths.CENTER_USER_INFO,
      page: () => const CenterUserInfoView(),
      binding: CenterUserInfoBinding(),
    ),
    GetPage(
      name: _Paths.CENTER_UPDATE_LOGIN_PASSWORD,
      page: () => const CenterUpdateLoginPasswordView(),
      binding: CenterUpdateLoginPasswordBinding(),
    ),
    GetPage(
      name: _Paths.CENTER_PAY_PASSWORD,
      page: () => const CenterPayPasswordView(),
      binding: CenterPayPasswordBinding(),
    ),
    GetPage(
      name: _Paths.CENTER_BANK_LIST,
      page: () => const CenterBankListView(),
      binding: CenterBankListBinding(),
    ),
    GetPage(
      name: _Paths.CENTER_BANK_LIST_ADD,
      page: () => const CenterBankListAddView(),
      binding: CenterBankListAddBinding(),
    ),
    GetPage(
      name: _Paths.CENTER_PHONE,
      page: () => CenterPhoneView(),
      binding: CenterPhoneBinding(),
    ),
    GetPage(
      name: _Paths.CENTER_PAY_PASSWORD_SMS,
      page: () => const CenterPayPasswordSmsView(),
      binding: CenterPayPasswordSmsBinding(),
    ),
    GetPage(
      name: _Paths.PROMOTION_PH,
      page: () => const PromotionPHPage(),
      binding: PromotionPHBinding(),
    ),
    GetPage(
      name: _Paths.MY_PH,
      page: () => const My_PHPage(),
      binding: My_PHBinding(),
    ),
    GetPage(
      name: _Paths.MAIN_WALLET,
      page: () => const Main_walletPage(),
      binding: Main_walletBinding(),
    ),
    GetPage(
      name: _Paths.DEPOSIT_PH,
      page: () => const Deposit_PHPage(),
      binding: Deposit_PHBinding(),
    ),
    GetPage(
      name: _Paths.VIP_PH,
      page: () => const Vip_phPage(),
      binding: Vip_phBinding(),
    ),
    GetPage(
      name: _Paths.WITHDRAW_PH,
      page: () => const Withdraw_phPage(),
      binding: Withdraw_phBinding(),
    ),
    GetPage(
      name: _Paths.WITHDRAW_PIN,
      page: () => const Withdraw_pinPage(),
      binding: Withdraw_pinBinding(),
    ),
    GetPage(
      name: _Paths.GAME_LIST,
      page: () => const GameListView(),
      binding: GameListBinding(),
    ),
    GetPage(
      name: _Paths.INTEREST,
      page: () => const InterestPage(),
      binding: InterestBinding(),
    ),
    GetPage(
      name: _Paths.PERSONAL_INFORMATION,
      page: () => const Personal_informationPage(),
      binding: Personal_informationBinding(),
    ),
    GetPage(
      name: _Paths.AGENT,
      page: () => const AgentView(),
      binding: AgentBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_PROFILE,
      page: () => const Change_profilePage(),
      binding: Change_profileBinding(),
    ), GetPage(
      name: _Paths.MESSAGE_CENTER,
      page: () => const Message_centerPage(),
      binding: Message_centerBinding(),
    ),
  ];
}
