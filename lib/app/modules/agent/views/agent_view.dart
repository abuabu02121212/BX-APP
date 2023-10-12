import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../component/app_header.dart';
import '../controllers/agent_controller.dart';

class AgentView extends GetView<AgentController> {
  const AgentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppHeader(
          titleWidget: Text(
            "Agent",
            style: TextStyle(
              fontSize: 32.w,
              color: const Color(0xffffffff),
              fontWeight: FontWeight.w400,
            ),
          ),
          isNeedLeftBackArrow: true,
        ),
        centerTitle: true,
        titleSpacing: 0,
        leadingWidth: 0,
        toolbarHeight: 90.w,
      ),
      body: const Center(
        child: Text(
          'AgentView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
