class RecompensasData {
  int? t;
  List<RecompensasD>? d;
  int? s;

  RecompensasData({this.t, this.d, this.s});

  RecompensasData.fromJson(Map<String, dynamic> json) {
    t = json['t'];
    if (json['d'] != null) {
      d = <RecompensasD>[];
      json['d'].forEach((v) {
        d!.add(new RecompensasD.fromJson(v));
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

class RecompensasD {
  String? id;
  int? createdAt;
  String? ty;
  String? amount;
  String? remark;

  RecompensasD({this.id, this.createdAt, this.ty, this.amount, this.remark});

  RecompensasD.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    ty = json['ty'];
    amount = json['amount'];
    remark = json['remark'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['ty'] = this.ty;
    data['amount'] = this.amount;
    data['remark'] = this.remark;
    return data;
  }
}
