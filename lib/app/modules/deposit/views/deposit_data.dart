class DepositData {
  int? t;
  List<D>? d;
  double? r;
  String? c;

  DepositData({this.t, this.d, this.r, this.c});

  DepositData.fromJson(Map<String, dynamic> json) {
    t = json['t'];
    if (json['d'] != null) {
      d = <D>[];
      json['d'].forEach((v) {
        d!.add(new D.fromJson(v));
      });
    }
    r = json['r'];
    c = json['c'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['t'] = this.t;
    if (this.d != null) {
      data['d'] = this.d!.map((v) => v.toJson()).toList();
    }
    data['r'] = this.r;
    data['c'] = this.c;
    return data;
  }
}

class D {
  String? fid;
  String? name;
  String? fmax;
  String? fmin;
  String? amountList;
  String? showName;
  List<AmountArray>? amountArray;
  double? payRate;
  int? ty;

  D(
      {this.fid,
        this.name,
        this.fmax,
        this.fmin,
        this.amountList,
        this.showName,
        this.amountArray,
        this.payRate,
        this.ty});

  D.fromJson(Map<String, dynamic> json) {
    fid = json['fid'];
    name = json['name'];
    fmax = json['fmax'];
    fmin = json['fmin'];
    amountList = json['amount_list'];
    showName = json['show_name'];
    if (json['amount_array'] != null) {
      amountArray = <AmountArray>[];
      json['amount_array'].forEach((v) {
        amountArray!.add(new AmountArray.fromJson(v));
      });
    }
    payRate = json['pay_rate'];
    ty = json['ty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fid'] = this.fid;
    data['name'] = this.name;
    data['fmax'] = this.fmax;
    data['fmin'] = this.fmin;
    data['amount_list'] = this.amountList;
    data['show_name'] = this.showName;
    if (this.amountArray != null) {
      data['amount_array'] = this.amountArray!.map((v) => v.toJson()).toList();
    }
    data['pay_rate'] = this.payRate;
    data['ty'] = this.ty;
    return data;
  }
}

class AmountArray {
  String? amount;
  String? discount;

  AmountArray({this.amount, this.discount});

  AmountArray.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    discount = json['discount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['discount'] = this.discount;
    return data;
  }
}
