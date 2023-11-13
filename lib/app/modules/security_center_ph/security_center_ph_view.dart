import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'security_center_ph_logic.dart';

class Security_center_phPage extends StatefulWidget {
  const Security_center_phPage({Key? key}) : super(key: key);

  @override
  State<Security_center_phPage> createState() => _Security_center_phPageState();
}

class _Security_center_phPageState extends State<Security_center_phPage> {
  final logic = Get.find<Security_center_phLogic>();
  final state = Get.find<Security_center_phLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  void dispose() {
    Get.delete<Security_center_phLogic>();
    super.dispose();
  }
}