class CsEntity {
  final String telegram;
  final String facebook;
  final String onlinecs;

  CsEntity({
    required this.telegram,
    required this.facebook,
    required this.onlinecs,
  });

  factory CsEntity.fromJson(dynamic json) {
    return CsEntity(
      telegram: json['telegram'] ?? '',
      facebook: json['facebook'] ?? '',
      onlinecs: json['onlinecs'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'telegram': telegram,
      'facebook': facebook,
      'onlinecs': onlinecs,
    };
  }
}
