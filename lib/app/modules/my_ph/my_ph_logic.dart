import 'package:get/get.dart';

import '../../../generated/l10n.dart';
import 'item_bean.dart';
import 'my_ph_state.dart';

class My_PHLogic extends GetxController {
  final My_PHState state = My_PHState();

  late List<ItemBean> leftList;

  @override
  void onInit() {
    leftList = [
      ItemBean(
          img: 'assets/images/user/ic_agent.webp',
          name: S.current.Agent,
          nameR: 'Million Monthly',
          nameR1: '',
          type: '2',
          isBack: true),
      ItemBean(
          img: 'assets/images/user/ic_network_status.webp',
          name: S.current.NetworkStatus,
          nameR: '83MS',
          nameR1: 'Server 21 ',
          type: '3',
          isBack: true),
      ItemBean(
          img: 'assets/images/user/ic_personal_information.webp',
          name: S.current.PersonalInformation,
          nameR: '',
          nameR1: '',
          type: '2',
          isBack: true),
      ItemBean(
          img: 'assets/images/user/ic_security_center.webp',
          name: S.current.SecurityCenter,
          nameR: '',
          nameR1: '',
          type: '2',
          isBack: true),
      ItemBean(
          img: 'assets/images/user/ic_language.webp',
          name: S.current.Language,
          nameR: S.current.English,
          nameR1: '',
          type: '1',
          isBack: true),
      ItemBean(
          img: 'assets/images/user/ic_faq.webp',
          name: S.current.FAQ,
          nameR: '',
          nameR1: '',
          type: '2',
          isBack: true),
      ItemBean(
          img: 'assets/images/user/ic_feedback_rewards.webp',
          name: S.current.FeedbackContent,
          nameR: '',
          nameR1: '',
          type: '2',
          isBack: true),
      ItemBean(
          img: 'assets/images/user/ic_log_out.webp',
          name: S.current.LogOut,
          nameR: '',
          nameR1: '',
          type: '2',
          isBack: true),
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

  bool isc(String name) {
    bool isk = false;
    if (name.contains('\n')) {
      isk = true;
    }
    return isk;
  }
}
