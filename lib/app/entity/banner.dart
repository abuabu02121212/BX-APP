class BannerEntity {
  String id;
  String title;
  String redirectUrl;
  String images;
  String seq;
  String urlType;
  String updatedName;
  String updatedUid;
  String updatedAt;
  String state;
  String createdAt;

  BannerEntity({
    required this.id,
    required this.title,
    required this.redirectUrl,
    required this.images,
    required this.seq,
    required this.urlType,
    required this.updatedName,
    required this.updatedUid,
    required this.updatedAt,
    required this.state,
    required this.createdAt,
  });

  factory BannerEntity.fromJson(Map<String, dynamic> json) {
    return BannerEntity(
      id: json['id'].toString(),
      title: json['title'].toString(),
      redirectUrl: json['redirect_url'].toString(),
      images: json['images'].toString(),
      seq: json['seq'].toString(),
      urlType: json['url_type'].toString(),
      updatedName: json['updated_name'].toString(),
      updatedUid: json['updated_uid'].toString(),
      updatedAt: json['updated_at'].toString(),
      state: json['state'].toString(),
      createdAt: json['created_at'].toString(),
    );
  }

  static List<BannerEntity> getList(List jsonArr) {
    List<BannerEntity> ls = [];
    for (int i = 0; i < jsonArr.length; i++) {
      var item = jsonArr[i];
      var hotGameEntity = BannerEntity.fromJson(item);
      ls.add(hotGameEntity);
    }
    return ls;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['redirect_url'] = redirectUrl;
    data['images'] = images;
    data['seq'] = seq;
    data['url_type'] = urlType;
    data['updated_name'] = updatedName;
    data['updated_uid'] = updatedUid;
    data['updated_at'] = updatedAt;
    data['state'] = state;
    data['created_at'] = createdAt;
    return data;
  }
}
