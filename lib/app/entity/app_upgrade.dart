class AppUpgradeData {
  String? platform;
  String? version;
  int? isForce;
  String? content;
  String? url;

  AppUpgradeData({this.platform, this.version, this.isForce, this.content, this.url});

  AppUpgradeData.fromJson(Map<String, dynamic> json) {
    platform = json['platform'];
    version = json['version'];
    isForce = json['is_force'];
    content = json['content'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['platform'] = this.platform;
    data['version'] = this.version;
    data['is_force'] = this.isForce;
    data['content'] = this.content;
    data['url'] = this.url;
    return data;
  }
}
