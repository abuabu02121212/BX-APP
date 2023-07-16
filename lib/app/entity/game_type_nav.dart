class GameTypeNav {
  String id;
  String name;
  String gameType;
  String state;
  String maintained;
  String seq;

  GameTypeNav({
    required this.id,
    required this.name,
    required this.gameType,
    required this.state,
    required this.maintained,
    required this.seq,
  });

  factory GameTypeNav.fromJson(Map<String, dynamic> json) {
    return GameTypeNav(
      id: json['id'].toString(),
      name: json['name'].toString(),
      gameType: json['game_type'].toString(),
      state: json['state'].toString(),
      maintained: json['maintained'].toString(),
      seq: json['seq'].toString(),
    );
  }

  static List<GameTypeNav> getList(List jsonArr) {
    List<GameTypeNav> ls = [];
    for (int i = 0; i < jsonArr.length; i++) {
      var item = jsonArr[i];
      var hotGameEntity = GameTypeNav.fromJson(item);
      ls.add(hotGameEntity);
    }
    return ls;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['game_type'] = gameType;
    data['state'] = state;
    data['maintained'] = maintained;
    data['seq'] = seq;
    return data;
  }
}
