import 'api.dart';
import 'dio_util.dart';

ApiRequest apiRequest = ApiRequest();

class ApiRequest {
  DioUtil httpUtil = DioUtil(baseUrl);

  dynamic requestRegister(Map<String, Object> params) {
    return httpUtil.post(register, params);
  }

  dynamic requestLogin(Map<String, Object> params) {
    return httpUtil.post(login, params);
  }

  Future requestSms(Map<String, Object> params) async {
    return await httpUtil.post(sms, params);
  }
}
