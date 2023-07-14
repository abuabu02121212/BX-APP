class PayDepositData {
  String? addr;
  String? qrCode;
  String? orderId;
  String? oid;

  PayDepositData({this.addr, this.qrCode, this.orderId, this.oid});

  PayDepositData.fromJson(Map<String, dynamic> json) {
    addr = json['addr'];
    qrCode = json['qr_code'];
    orderId = json['order_id'];
    oid = json['oid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['addr'] = this.addr;
    data['qr_code'] = this.qrCode;
    data['order_id'] = this.orderId;
    data['oid'] = this.oid;
    return data;
  }
}
