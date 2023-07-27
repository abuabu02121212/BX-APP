import 'package:flutter_comm/http/phone_code_send_helper.dart';
import 'package:flutter_comm/http/request.dart';
import 'package:flutter_comm/util/loading_util.dart';
import 'package:flutter_comm/widget/input_field.dart';
import 'package:get/get.dart';

import '../../../../globe_controller.dart';
import '../../../../http/comm_request.dart';
import '../../../../http/ret_code.dart';
import '../../../../util/Log.dart';
import '../../../../util/toast_util.dart';
import '../../../entity/user_info.dart';

class CenterPayPasswordSmsController extends GetxController {
  EditNode codeEditNode = EditNode();

  final GlobeController globeController = Get.find<GlobeController>();
  late UserInfoEntity? userInfoEntity = globeController.userInfoEntity.value;
  late var isEmailNotExit = userInfoEntity != null && (userInfoEntity?.email ?? "").isEmpty;
  late var isPhoneNotExit = userInfoEntity != null && (userInfoEntity?.phone ?? "").isEmpty;

  late var isShowBindPhone = isPhoneNotExit || !isEmailNotExit; // 手机不存在，或者邮箱存在

  void submit() {

  }

}
