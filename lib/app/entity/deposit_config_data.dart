class DepositConfigData {
  int? id;
  String? name;
  double? bonus;
  double? flow;
  double? maxAmount;
  double? minAmount;
  int? ty;

  DepositConfigData(
      {this.id,
        this.name,
        this.bonus,
        this.flow,
        this.maxAmount,
        this.minAmount,
        this.ty});

  DepositConfigData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    bonus = json['bonus'];
    flow = json['flow'];
    maxAmount = json['max_amount'];
    minAmount = json['min_amount'];
    ty = json['ty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['bonus'] = this.bonus;
    data['flow'] = this.flow;
    data['max_amount'] = this.maxAmount;
    data['min_amount'] = this.minAmount;
    data['ty'] = this.ty;
    return data;
  }
}
