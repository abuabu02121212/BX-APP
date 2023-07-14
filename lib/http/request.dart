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
    return await httpUtil.post(forgetPsw, {});
  }

  Future requestLastWin() async {
    return await httpUtil.get(lastwin, {});
  }

  Future requestNotice() async {
    return await httpUtil.get(notice, {});
  }

  Future requestVips() async {
    return await httpUtil.get(vips, {});
  }

  Future requestSignConfig() async {
    return await httpUtil.get(signConfig, {});
  }

  Future requestSignRewardRecord() async {
    return await httpUtil.get(signRewardRecord, {});
  }

  Future requestSign() async {
    return await httpUtil.get(sign, {});
  }

  Future requestMessageList() async {
    return await httpUtil.get(messageList, {});
  }

  Future requestMessageRead() async {
    return await httpUtil.post(messageRead, {});
  }

  Future requestMessageNum() async {
    return await httpUtil.get(messageNum, {});
  }

  Future requestMessageDelete() async {
    return await httpUtil.post(messageDelete, {});
  }

  Future requestPayChannel() async {
    return await httpUtil.get(payChannel, {});
  }

  Future requestWithdrawConfig() async {
    return await httpUtil.get(withdrawConfig, {});
  }

  Future requestPayDeposit() async {
    return await httpUtil.post(payDeposit, {});
  }

  Future requestMemberRecord() async {
    return await httpUtil.get(memberRecord, {});
  }

  Future requestPayWithdraw() async {
    return await httpUtil.get(payWithdraw, {});
  }

  Future requestTreasureConfig() async {
    return await httpUtil.get(treasureConfig, {});
  }

  Future requestTreasureApply() async {
    return await httpUtil.get(treasureApply, {});
  }

  Future requestPromoDepositConfig() async {
    return await httpUtil.get(promoDepositConfig, {});
  }

  Future requestUpdateAvatar({Map<String, Object>? params}) async {
    return await httpUtil.get(updateAvatar, params ?? {});
  }
}
