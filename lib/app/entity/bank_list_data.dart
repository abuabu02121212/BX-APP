class BankListData {
  int? t;
  List<BankListDataD>? d;

  BankListData({this.t, this.d});

  BankListData.fromJson(Map<String, dynamic> json) {
    t = json['t'];
    if (json['d'] != null) {
      d = <BankListDataD>[];
      json['d'].forEach((v) {
        d!.add(new BankListDataD.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['t'] = this.t;
    if (this.d != null) {
      data['d'] = this.d!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BankListDataD {
  String? id;
  String? uid;
  String? username;
  int? createdAt;
  int? state;
  String? pixAccount;
  int? flag;
  String? realName;
  String? pixId;

  BankListDataD(
      {this.id,
        this.uid,
        this.username,
        this.createdAt,
        this.state,
        this.pixAccount,
        this.flag,
        this.realName,
        this.pixId});

  BankListDataD.fromJson(Map<String, dynamic> json) {
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
