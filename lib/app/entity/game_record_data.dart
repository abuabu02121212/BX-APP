class GameRecordData {
  int? t;
  List<GameRecordD>? d;
  int? s;

  GameRecordData({this.t, this.d, this.s});

  GameRecordData.fromJson(Map<String, dynamic> json) {
    t = json['t'];
    if (json['d'] != null) {
      d = <GameRecordD>[];
      json['d'].forEach((v) {
        d!.add(new GameRecordD.fromJson(v));
      });
    }
    s = json['s'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['t'] = this.t;
    if (this.d != null) {
      data['d'] = this.d!.map((v) => v.toJson()).toList();
    }
    data['s'] = this.s;
    return data;
  }
}

class GameRecordD {
  String? id;
  String? gameName;
  int? betTime;
  double? betAmount;
  double? netAmount;

  GameRecordD({this.id, this.gameName, this.betTime, this.betAmount, this.netAmount});

  GameRecordD.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    gameName = json['game_name'];
    betTime = json['bet_time'];
    betAmount = json['bet_amount'];
    netAmount = json['net_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['game_name'] = this.gameName;
    data['bet_time'] = this.betTime;
    data['bet_amount'] = this.betAmount;
    data['net_amount'] = this.netAmount;
    return data;
  }
}
