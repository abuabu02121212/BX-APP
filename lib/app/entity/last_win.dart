class LastWinEntity {
  String uid;
  String game_name;
  String game_id;
  String platform_id;
  String amount;

  LastWinEntity({
    required this.uid,
    required this.game_name,
    required this.game_id,
    required this.platform_id,
    required this.amount,
  });

  factory LastWinEntity.fromJson(Map<String, dynamic> json) {
    return LastWinEntity(
      uid: json['uid'].toString(),
      game_name: json['game_name'].toString(),
      game_id: json['game_id'].toString(),
      platform_id: json['platform_id'].toString(),
      amount: json['amount'].toString(),
    );
  }

  static List<LastWinEntity> getList(List jsonArr) {
    List<LastWinEntity> ls = [];
    for (int i = 0; i < jsonArr.length; i++) {
      var item = jsonArr[i];
      var hotGameEntity = LastWinEntity.fromJson(item);
      ls.add(hotGameEntity);
    }
    return ls;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = uid;
    data['game_name'] = game_name;
    data['game_id'] = game_id;
    data['platform_id'] = platform_id;
    data['amount'] = amount;
    return data;
  }
}
