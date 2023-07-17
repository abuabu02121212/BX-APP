class GameTypeEntity {
  final String name;
  final String gameType;

  GameTypeEntity({
    required this.name,
    required this.gameType,
  });

  static GameTypeEntity gameType3 = GameTypeEntity(name: "Slot", gameType: "3");
  static GameTypeEntity gameType2 = GameTypeEntity(name: "Pesca", gameType: "2");
  static GameTypeEntity gameType5 = GameTypeEntity(name: "Pôquer", gameType: "5");
  static GameTypeEntity gameType4 = GameTypeEntity(name: "Esporte", gameType: "4");
  static GameTypeEntity gameType1 = GameTypeEntity(name: "Ao Vivo", gameType: "1");
  static GameTypeEntity gameType6 = GameTypeEntity(name: "Esports", gameType: "6");

  static List<GameTypeEntity> preList = [gameType3, gameType2, gameType5, gameType4, gameType1, gameType6];

  static List<GameTypeEntity> getList() {
    List<GameTypeEntity> ls = [];
    ls.add(GameTypeEntity(name: "Quente", gameType: ""));
    ls.add(GameTypeEntity(name: "Dentro \nDe Casa", gameType: "")); // 6 未定义
    return ls;
  }
}
