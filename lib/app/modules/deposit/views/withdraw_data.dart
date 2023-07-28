class WithdrawData {
  Config? config;
  List<MemberBankList>? memberBankList;
  int? memberBankT;

  WithdrawData({this.config, this.memberBankList, this.memberBankT});

  WithdrawData.fromJson(Map<String, dynamic> json) {
    config =
    json['config'] != null ? new Config.fromJson(json['config']) : null;
    if (json['member_bank_list'] != null) {
      memberBankList = <MemberBankList>[];
      json['member_bank_list'].forEach((v) {
        memberBankList!.add(new MemberBankList.fromJson(v));
      });
    }
    memberBankT = json['member_bank_t'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.config != null) {
      data['config'] = this.config!.toJson();
    }
    if (this.memberBankList != null) {
      data['member_bank_list'] =
          this.memberBankList!.map((v) => v.toJson()).toList();
    }
    data['member_bank_t'] = this.memberBankT;
    return data;
  }
}

class Config {
  String? fid;
  String? name;
  String? fmax;
  String? fmin;
  String? amountList;
  String? showName;
  Null? amountArray;

  Config(
      {this.fid,
        this.name,
        this.fmax,
        this.fmin,
        this.amountList,
        this.showName,
        this.amountArray});

  Config.fromJson(Map<String, dynamic> json) {
    fid = json['fid'];
    name = json['name'];
    fmax = json['fmax'];
    fmin = json['fmin'];
    amountList = json['amount_list'];
    showName = json['show_name'];
    amountArray = json['amount_array'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fid'] = this.fid;
    data['name'] = this.name;
    data['fmax'] = this.fmax;
    data['fmin'] = this.fmin;
    data['amount_list'] = this.amountList;
    data['show_name'] = this.showName;
    data['amount_array'] = this.amountArray;
    return data;
  }
}

class MemberBankList {
  String? id;
  String? uid;
  String? username;
  int? createdAt;
  int? state;
  String? pixAccount;
  int? flag;
  String? realName;
  String? pixId;

  MemberBankList(
      {this.id,
        this.uid,
        this.username,
        this.createdAt,
        this.state,
        this.pixAccount,
        this.flag,
        this.realName,
        this.pixId});

  MemberBankList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    username = json['username'];
    createdAt = json['created_at'];
    state = json['state'];
    pixAccount = json['pix_account'];
    flag = json['flag'];
    realName = json['real_name'];
    pixId = json['pix_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uid'] = this.uid;
    data['username'] = this.username;
    data['created_at'] = this.createdAt;
    data['state'] = this.state;
    data['pix_account'] = this.pixAccount;
    data['flag'] = this.flag;
    data['real_name'] = this.realName;
    data['pix_id'] = this.pixId;
    return data;
  }
}
