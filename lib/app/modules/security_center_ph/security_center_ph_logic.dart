import 'package:get/get.dart';

import '../../../generated/l10n.dart';
import '../my_ph/item_bean.dart';
import 'security_center_ph_state.dart';

class Security_center_phLogic extends GetxController {
  final Security_center_phState state = Security_center_phState();

  late List<List<ItemBean>> list;

  @override
  void onInit() {
    list = [
      [
        ItemBean(
            img: 'assets/images/user/ic_player_id.webp',
            name: S.current.PlayerID,
            nameR: 'yumikocclemo',
            nameR1: '',
            type: '1',
            isBack: true),
        ItemBean(
            img: 'assets/images/user/ic_mobile_phone.webp',
            name: S.current.MobilePhone,
            nameR: 'Unbind',
            nameR1: '',
            type: '1',
            isBack: true),
        ItemBean(
            img: 'assets/images/user/ic_email_address.webp',
            name: S.current.EmailAddress,
            nameR: 'Unbind',
            nameR1: '',
            type: '1',
            isBack: true),
        ItemBean(
            img: 'assets/images/user/ic_google_authenticator.webp',
            name: S.current.GoogleAuthenticator,
            nameR: 'Unbind',
            nameR1: '',
            type: '1',
            isBack: true),
      ],
      [
        ItemBean(
            img: 'assets/images/user/ic_login_password.webp',
            name: S.current.LoginPassword,
            nameR: '',
            nameR1: '',
            type: '1',
            isBack: true),
        ItemBean(
            img: 'assets/images/user/ic_withdraw_pin.webp',
            name: S.current.WithdrawPIN,
            nameR: 'Has Been Set',
            nameR1: '',
            type: '1',
            isBack: true),
        ItemBean(
            img: 'assets/images/user/ic_security_question.webp',
            name: S.current.SecurityQuestion,
            nameR: 'Unbind',
            nameR1: '',
            type: '1',
            isBack: true),
      ],
      [
        ItemBean(
            img: 'assets/images/user/ic_third_party.webp',
            name: S.current.ThirdPartyBinding,
            nameR: 'Unbind',
            nameR1: '',
            type: '1',
            isBack: true),
      ]
    ];
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
