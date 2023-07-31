class GameNavEntity {
  String id;
  String name;
  String gameType;
  String state;
  String maintained;
  String seq;
  String logo;

  GameNavEntity({
    required this.id,
    required this.name,
    required this.gameType,
    required this.state,
    required this.maintained,
    required this.seq,
    required this.logo,
  });

  static GameNavEntity def = GameNavEntity(id: '0', name: 'All', gameType: '', state: '', maintained: '', seq: '', logo: '');
  factory GameNavEntity.fromJson(Map<String, dynamic> json) {
    return GameNavEntity(
      id: json['id'].toString(),
      name: json['name'].toString(),
      gameType: json['game_type'].toString(),
      state: json['state'].toString(),
      maintained: json['maintained'].toString(),
      seq: json['seq'].toString(),
      logo: json['logo'].toString(),
    );
  }
}
