import 'package:get/get.dart';

import '../../util/Log.dart';

class GameEntity {
  String id;
  String platformId;
  String name;
  String enName;
  String brAlias;
  String clientType;
  String gameType;
  String gameId;
  String img;
  String online;
  String isHot;
  String isFav;
  String isNew;
  String sorting;
  String createdAt;

  /// 方便数据传递使用
  int listItemIndex = 0;

  final isRxFav = false.obs;

  GameEntity({
    required this.id,
    required this.platformId,
    required this.name,
    required this.enName,
    required this.brAlias,
    required this.clientType,
    required this.gameType,
    required this.gameId,
    required this.img,
    required this.online,
    required this.isHot,
    required this.isFav,
    required this.isNew,
    required this.sorting,
    required this.createdAt,
  });

  factory GameEntity.fromJson(Map<String, dynamic> json) {
    GameEntity entity = GameEntity(
      id: json['id'].toString(),
      platformId: json['platform_id'].toString(),
      name: json['name'].toString(),
      enName: json['en_name'].toString(),
      brAlias: json['br_alias'].toString(),
      clientType: json['client_type'].toString(),
      gameType: json['game_type'].toString(),
      gameId: json['game_id'].toString(),
      img: json['img'].toString(),
      online: json['online'].toString(),
      isHot: json['is_hot'].toString(),
      isFav: json['is_fav'].toString(),
      isNew: json['is_new'].toString(),
      sorting: json['sorting'].toString(),
      createdAt: json['created_at'].toString(),
    );
    entity.isRxFav.value = entity.isFav == '1';
    return entity;
  }

  void switchFavState(bool isFavorite) {
    if (isFavorite) {
      isFav = '1';
    } else {
      isFav = '0';
    }
    isRxFav.value = isFav == '1';
    Log.d("isRxFav:${isRxFav.value}  isFavorite:$isFavorite");
  }

  static List<GameEntity> getList(dynamic jsonArr) {
    List<GameEntity> ls = [];
    if (jsonArr == null) {
      return ls;
    }
    for (int i = 0; i < jsonArr.length; i++) {
      var item = jsonArr[i];
      GameEntity hotGameEntity = GameEntity.fromJson(item);
      ls.add(hotGameEntity);
    }
    return ls;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['platform_id'] = platformId;
    data['name'] = name;
    data['en_name'] = enName;
    data['br_alias'] = brAlias;
    data['client_type'] = clientType;
    data['game_type'] = gameType;
    data['game_id'] = gameId;
    data['img'] = img;
    data['online'] = online;
    data['is_hot'] = isHot;
    data['is_fav'] = isFav;
    data['is_new'] = isNew;
    data['sorting'] = sorting;
    data['created_at'] = createdAt;
    return data;
  }
}
