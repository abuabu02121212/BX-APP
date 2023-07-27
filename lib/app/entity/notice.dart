import '../../util/text_util.dart';

class NoticeEntity {
  String id;
  String title;
  String content;
  String redirect;
  String redirectUrl;
  String state;
  String createdAt;
  String createdUid;
  String createdName;

  NoticeEntity({
    required this.id,
    required this.title,
    required this.content,
    required this.redirect,
    required this.redirectUrl,
    required this.state,
    required this.createdAt,
    required this.createdUid,
    required this.createdName,
  });

  factory NoticeEntity.fromJson(Map<String, dynamic> json) {
    return NoticeEntity(
      id: json['id'].toString(),
      title: getUrlDoubleDecodeStr(json['title'].toString()),
      content: getUrlDoubleDecodeStr(json['content'].toString()),
      redirect: json['redirect'].toString(),
      redirectUrl: json['redirect_url'].toString(),
      state: json['state'].toString(),
      createdAt: json['created_at'].toString(),
      createdUid: json['created_uid'].toString(),
      createdName: json['created_name'].toString(),
    );
  }

  static List<NoticeEntity> getList(List? jsonArr) {
    List<NoticeEntity> ls = [];
    if (jsonArr == null) {
      return ls;
    }
    for (int i = 0; i < jsonArr.length; i++) {
      var item = jsonArr[i];
      var hotGameEntity = NoticeEntity.fromJson(item);
      ls.add(hotGameEntity);
    }
    return ls;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'redirect': redirect,
      'redirect_url': redirectUrl,
      'state': state,
      'created_at': createdAt,
      'created_uid': createdUid,
      'created_name': createdName,
    };
  }
}
