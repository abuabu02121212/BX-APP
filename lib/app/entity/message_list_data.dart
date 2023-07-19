class MessageListData {
  int? t;
  int? s;
  List<MessageListD>? d;

  MessageListData({this.t, this.s, this.d});

  MessageListData.fromJson(Map<String, dynamic> json) {
    t = json['t'];
    s = json['s'];
    if (json['d'] != null) {
      d = <MessageListD>[];
      json['d'].forEach((v) {
        d!.add(new MessageListD.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['t'] = this.t;
    data['s'] = this.s;
    if (this.d != null) {
      data['d'] = this.d!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MessageListD {
  String? id;
  String? ts;
  String? msgId;
  String? username;
  String? title;
  String? content;
  int? isTop;
  int? isVip;
  int? ty;
  int? isRead;
  String? sendName;
  int? sendAt;
  bool isExpand = false;

  MessageListD(
      {this.id,
        this.ts,
        this.msgId,
        this.username,
        this.title,
        this.content,
        this.isTop,
        this.isVip,
        this.ty,
        this.isRead,
        this.sendName,
        this.sendAt});

  MessageListD.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ts = json['ts'];
    msgId = json['msg_id'];
    username = json['username'];
    title = json['title'];
    content = json['content'];
    isTop = json['is_top'];
    isVip = json['is_vip'];
    ty = json['ty'];
    isRead = json['is_read'];
    sendName = json['send_name'];
    sendAt = json['send_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ts'] = this.ts;
    data['msg_id'] = this.msgId;
    data['username'] = this.username;
    data['title'] = this.title;
    data['content'] = this.content;
    data['is_top'] = this.isTop;
    data['is_vip'] = this.isVip;
    data['ty'] = this.ty;
    data['is_read'] = this.isRead;
    data['send_name'] = this.sendName;
    data['send_at'] = this.sendAt;
    return data;
  }
}
