import 'package:get/get.dart';

import '../../../../globe_controller.dart';

class SecurityCenterController extends GetxController {

  final GlobeController globeController = Get.find<GlobeController>();

  late var isShowBindPhone = globeController.isShowingBindPhone();


}
