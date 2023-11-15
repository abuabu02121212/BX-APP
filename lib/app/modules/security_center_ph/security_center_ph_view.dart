import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_comm/util/size.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../generated/l10n.dart';
import '../../../util/base_appbar_ph.dart';
import '../../../util/base_scaffold_ph.dart';
import '../../app_style.dart';
import '../my_ph/user_list_w.dart';
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
    return BaseScaffoldPH(
      backgroundColor: blackBgColor_h,
      appBar: BaseAppbarPH(
        title: S.current.SecurityCenter,
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: 32.px,
            ),
            UserListW(
              list: logic.list[0],
              type: '1',
            ),
            UserListW(
              list: logic.list[1],
              type: '1',
            ),
            UserListW(
              list: logic.list[2],
              type: '1',
            ),
            SizedBox(
              width: 1.sw,
              height: MediaQuery.of(context).padding.bottom,
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<Security_center_phLogic>();
    super.dispose();
  }
}
