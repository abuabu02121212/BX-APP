class SignConfigData {
  int? vip;
  String? sign1Amount;
  String? sign2Amount;
  String? sign3Amount;
  String? sign4Amount;
  String? sign5Amount;
  String? sign6Amount;
  String? sign7Amount;

  SignConfigData(
      {this.vip,
        this.sign1Amount,
        this.sign2Amount,
        this.sign3Amount,
        this.sign4Amount,
        this.sign5Amount,
        this.sign6Amount,
        this.sign7Amount});

  SignConfigData.fromJson(Map<String, dynamic> json) {
    vip = json['vip'];
    sign1Amount = json['sign1_amount'];
    sign2Amount = json['sign2_amount'];
    sign3Amount = json['sign3_amount'];
    sign4Amount = json['sign4_amount'];
    sign5Amount = json['sign5_amount'];
    sign6Amount = json['sign6_amount'];
    sign7Amount = json['sign7_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vip'] = this.vip;
    data['sign1_amount'] = this.sign1Amount;
    data['sign2_amount'] = this.sign2Amount;
    data['sign3_amount'] = this.sign3Amount;
    data['sign4_amount'] = this.sign4Amount;
    data['sign5_amount'] = this.sign5Amount;
    data['sign6_amount'] = this.sign6Amount;
    data['sign7_amount'] = this.sign7Amount;
    return data;
  }
}
