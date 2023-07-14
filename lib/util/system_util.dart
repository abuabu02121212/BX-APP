import 'package:platform_device_id/platform_device_id.dart';

class SysUtil {
  static String deviceId = "";

  static Future<void> init() async {
    deviceId = await getDeviceId();
  }

  static Future<String> getDeviceId() async {
    String? deviceId = await PlatformDeviceId.getDeviceId;
    deviceId ??= "${DateTime.now().millisecondsSinceEpoch}-test";
    return deviceId;
  }
}
