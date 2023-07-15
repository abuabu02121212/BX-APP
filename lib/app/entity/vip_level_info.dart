class VipInfoEntity {
  String? vip;
  String? name;
  String? depositAmount;
  String? flow;
  String? amount;
  String? freeWithdrawNum;
  String? withdrawLimit;
  String? rebateRate;
  String? props;
  String? updatedAt;
  String? createdAt;

  VipInfoEntity({
    this.vip,
    this.name,
    this.depositAmount,
    this.flow,
    this.amount,
    this.freeWithdrawNum,
    this.withdrawLimit,
    this.rebateRate,
    this.props,
    this.updatedAt,
    this.createdAt,
  });

  VipInfoEntity.fromJson(Map<String, dynamic> json) {
    vip = "${json['vip']}";
    name = "${json['name']}";
    depositAmount = "${json['deposit_amount']}";
    flow = "${json['flow']}";
    amount = "${json['amount']}";
    freeWithdrawNum = "${json['free_withdraw_num']}";
    withdrawLimit = "${json['withdraw_limit']}";
    rebateRate = "${json['rebate_rate']}";
    props = "${json['props']}";
    updatedAt = "${json['updated_at']}";
    createdAt = "${json['created_at']}";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['vip'] = vip;
    data['name'] = name;
    data['deposit_amount'] = depositAmount;
    data['flow'] = flow;
    data['amount'] = amount;
    data['free_withdraw_num'] = freeWithdrawNum;
    data['withdraw_limit'] = withdrawLimit;
    data['rebate_rate'] = rebateRate;
    data['props'] = props;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    return data;
  }
}
