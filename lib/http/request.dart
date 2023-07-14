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

  Future requestBanner({Map<String, Object>? params}) async {
    return await httpUtil.get(banner, params ?? {});
  }

  Future requestMemberInfo() async {
    return await httpUtil.get(memberInfo, {});
  }

  Future requestBalance() async {
    return await httpUtil.get(balance, {});
  }

  Future requestMemberNav() async {
    return await httpUtil.get(memberNav, {});
  }

  Future requestGameList() async {
    return await httpUtil.get(gameList, {});
  }

  Future requestHotGameList() async {
    return await httpUtil.get(hotGameList, {});
  }

  Future requestForgetPsw() async {
    return await httpUtil.get(forgetPsw, {});
  }

}
