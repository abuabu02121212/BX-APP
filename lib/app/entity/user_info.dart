class UserInfoEntity {
  final String? uid;
  final String? username;
  final String? topId;
  final String? topName;
  final String? greatGrandId;
  final String? greatGrandName;
  final String? grandId;
  final String? grandName;
  final String? parentId;
  final String? parentName;
  final String? createdAt;
  final String? createdIp;
  // 累计充值
  final String? depositAmount;
  final String? score;
  final String? vip;
  final String? phone;
  final String? email;
  final String? inviteNum;
  final String? lastTreasure;
  final String? tester;
  final String? avatar;
  final String? inviteCode;
  final String? payPassword;
  final String? phoneVerify;
  final String? emailVerify;

  //下一级充值
  final String? nextDeposit;

  // 当前充值
  final String? nowDeposit;
  final String? nextValidAmount;
  final String? nowValidAmount;
  final String? rate;
  final String? nextLevel;
  final String? contate;
  final String? telegram;

  UserInfoEntity({
    this.uid,
    this.username,
    this.topId,
    this.topName,
    this.greatGrandId,
    this.greatGrandName,
    this.grandId,
    this.grandName,
    this.parentId,
    this.parentName,
    this.createdAt,
    this.createdIp,
    this.depositAmount,
    this.score,
    this.vip,
    this.phone,
    this.email,
    this.inviteNum,
    this.lastTreasure,
    this.tester,
    this.avatar,
    this.inviteCode,
    this.nextDeposit,
    this.nowDeposit,
    this.nextValidAmount,
    this.nowValidAmount,
    this.rate,
    this.nextLevel,
    this.contate,
    this.payPassword,
    this.phoneVerify,
    this.emailVerify,
    this.telegram,
  });

  /// 获取当前充值额度等级进度
  double getCurrentDepositLevelProgress() {
    double v1 = double.tryParse("$nowDeposit") ?? 0;
    double v2 = double.tryParse("$nextDeposit") ?? 9999999999;
    if (v2 == 0) {
      v2 = 999999999;
      v1 = 0;
    }
    return v1 / v2;
  }

  /// 获取当前投注额度等级进度：nowValidAmount / nextValidAmount
  double getCurrentBetLevelProgress() {
    double v1 = double.tryParse("$nowValidAmount") ?? 0;
    double v2 = double.tryParse("$nextValidAmount") ?? 9999999999;
    if (v2 == 0) {
      v2 = 999999999;
      v1 = 0;
    }
    return v1 / v2;
  }

  factory UserInfoEntity.fromJson(Map<String, dynamic> json) {
    return UserInfoEntity(
      uid: json['uid']?.toString(),
      username: json['username']?.toString(),
      topId: json['top_id']?.toString(),
      topName: json['top_name']?.toString(),
      greatGrandId: json['great_grand_id']?.toString(),
      greatGrandName: json['great_grand_name']?.toString(),
      grandId: json['grand_id']?.toString(),
      grandName: json['grand_name']?.toString(),
      parentId: json['parent_id']?.toString(),
      parentName: json['parent_name']?.toString(),
      createdAt: json['created_at']?.toString(),
      createdIp: json['created_ip']?.toString(),
      depositAmount: json['deposit_amount']?.toString(),
      score: json['score']?.toString(),
      vip: json['vip']?.toString(),
      phone: json['phone']?.toString(),
      email: json['email']?.toString(),
      inviteNum: json['invite_num']?.toString(),
      lastTreasure: json['last_treasure']?.toString(),
      tester: json['tester']?.toString(),
      avatar: json['avatar']?.toString(),
      inviteCode: json['invite_code']?.toString(),
      nextDeposit: json['next_deposit']?.toString(),
      nowDeposit: json['now_deposit']?.toString(),
      nextValidAmount: json['next_valid_amount']?.toString(),
      nowValidAmount: json['now_valid_amount']?.toString(),
      rate: json['rate']?.toString(),
      nextLevel: json['next_level']?.toString(),
      contate: json['contate']?.toString(),
      payPassword: json['pay_password']?.toString(),
      phoneVerify: json['phone_verify']?.toString(),
      emailVerify: json['email_verify']?.toString(),
      telegram: json['telegram']?.toString(),
    );
  }
}
