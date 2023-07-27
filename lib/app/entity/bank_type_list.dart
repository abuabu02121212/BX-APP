class BankTypeData {
  String? bankcode;
  String? bankname;
  String? id;

  BankTypeData({this.bankcode, this.bankname, this.id});

  BankTypeData.fromJson(Map<String, dynamic> json) {
    bankcode = json['bankcode'];
    bankname = json['bankname'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bankcode'] = this.bankcode;
    data['bankname'] = this.bankname;
    data['id'] = this.id;
    return data;
  }
}
