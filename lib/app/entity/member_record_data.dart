class MeberRecordData {
  int? t;
  List<MemberRecordD>? d;
  int? s;

  MeberRecordData({this.t, this.d, this.s});

  MeberRecordData.fromJson(Map<String, dynamic> json) {
    t = json['t'];
    if (json['d'] != null) {
      d = <MemberRecordD>[];
      json['d'].forEach((v) {
        d!.add(new MemberRecordD.fromJson(v));
      });
    }
    s = json['s'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['t'] = this.t;
    if (this.d != null) {
      data['d'] = this.d!.map((v) => v.toJson()).toList();
    }
    data['s'] = this.s;
    return data;
  }
}

class MemberRecordD {
  int? flag;
  String? id;
  String? billNo;
  String? amount;
  String? createdAt;
  int? state;
  String? fname;
  String? discount;

  MemberRecordD(
      {this.flag,
        this.id,
        this.billNo,
        this.amount,
        this.createdAt,
        this.state,
        this.fname,
        this.discount});

  MemberRecordD.fromJson(Map<String, dynamic> json) {
    flag = json['flag'];
    id = json['id'];
    billNo = json['bill_no'];
    amount = json['amount'];
    createdAt = json['created_at'];
    state = json['state'];
    fname = json['fname'];
    discount = json['discount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['flag'] = this.flag;
    data['id'] = this.id;
    data['bill_no'] = this.billNo;
    data['amount'] = this.amount;
    data['created_at'] = this.createdAt;
    data['state'] = this.state;
    data['fname'] = this.fname;
    data['discount'] = this.discount;
    return data;
  }
}
