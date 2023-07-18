class GameTagEntity {
  final String tid;
  final String name;
  final String state;
  final String createdAt;
  final String gameType;
  final String platformId;

  GameTagEntity({
    required this.tid,
    required this.name,
    required this.state,
    required this.createdAt,
    required this.gameType,
    required this.platformId,
  });

  static GameTagEntity def = GameTagEntity(tid: '0', name: 'Nova', state: '', createdAt: '', gameType: '', platformId: '0');
  static List<GameTagEntity> getList(dynamic jsonArr) {
    List<GameTagEntity> ls = [];
    if (jsonArr == null) {
      return ls;
    }
    for (int i = 0; i < jsonArr.length; i++) {
      var item = jsonArr[i];
      var hotGameEntity = GameTagEntity.fromJson(item);
      ls.add(hotGameEntity);
    }
    return ls;
  }

  factory GameTagEntity.fromJson(Map<String, dynamic> json) {
    return GameTagEntity(
      tid: json['tid'].toString(),
      name: json['name'].toString(),
      state: json['state'].toString(),
      createdAt: json['created_at'].toString(),
      gameType: json['game_type'].toString(),
      platformId: json['platform_id'].toString(),
    );
  }
}
