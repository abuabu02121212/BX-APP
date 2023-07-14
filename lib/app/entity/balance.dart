class BalanceEntity {
  final String? uid;
  final String? brl;
  final String? brl_amount;
  final String? lockAmount;
  final String? agencyAmount;
  final String? deposit_amount;
  final String? deposit_balance;
  final String? depositLockAmount;
  final String? agency_balance;
  final String? agencyLockAmount;

  BalanceEntity({
    this.uid,
    this.brl,
    this.brl_amount,
    this.lockAmount,
    this.agencyAmount,
    this.deposit_amount,
    this.deposit_balance,
    this.depositLockAmount,
    this.agency_balance,
    this.agencyLockAmount,
  });

  factory BalanceEntity.fromJson(Map<String, dynamic> json) {
    return BalanceEntity(
      uid: json['uid']?.toString(),
      brl: json['brl']?.toString(),
      brl_amount: json['brl_amount']?.toString(),
      lockAmount: json['lockAmount']?.toString(),
      agencyAmount: json['agencyAmount']?.toString(),
      deposit_amount: json['deposit_amount']?.toString(),
      deposit_balance: json['deposit_balance']?.toString(),
      depositLockAmount: json['depositLockAmount']?.toString(),
      agency_balance: json['agency_balance']?.toString(),
      agencyLockAmount: json['agencyLockAmount']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'brl': brl,
      'brl_amount': brl_amount,
      'lockAmount': lockAmount,
      'agencyAmount': agencyAmount,
      'deposit_amount': deposit_amount,
      'deposit_balance': deposit_balance,
      'depositLockAmount': depositLockAmount,
      'agency_balance': agency_balance,
      'agencyLockAmount': agencyLockAmount,
    };
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
