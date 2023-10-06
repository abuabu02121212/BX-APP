import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'my_ph_state.dart';

class My_PHLogic extends GetxController {
  final My_PHState state = My_PHState();

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

  String getItemName(int index){
    switch(index){
      case 0 : return'Agent';
      case 1 : return'Network Status';
      case 2 : return'Personal Information';
      case 3 : return'Security Center';
      case 4 : return'Language';
      case 5 : return'FAQ';
      case 6 : return'Feedback Rewards';
      case 7 : return'Log Out';
    }
    return '';
  }

  AssetImage getItemImg(int index){
    switch(index){
      case 0 : return AssetImage('assets/images/user/ic_agent.webp');
      case 1 : return AssetImage('assets/images/user/ic_network_status.webp');
      case 2 : return AssetImage('assets/images/user/ic_personal_information.webp');
      case 4 : return AssetImage('assets/images/user/ic_language.webp');
      case 5 : return AssetImage('assets/images/user/ic_faq.webp');
      case 6 : return AssetImage('assets/images/user/ic_feedback_rewards.webp');
      case 7 : return AssetImage('assets/images/user/ic_log_out.webp');
    }
    return AssetImage('assets/images/user/ic_agent.webp');
  }
}
