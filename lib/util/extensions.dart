import 'package:flutter_comm/util/sp_util.dart';
import 'package:flutter_comm/util/sp_util_key.dart';

extension StringExtension on String {
  /// 获取Token，拼接到url后面
  String addToken() {
    String token = spUtil.getString(keyLoginToken) ?? "";
    if (token.isNotEmpty) {
      if (contains("?")) {
        return "$this&t=$token";
      } else {
        return "$this?t=$token";
      }
    }
    return this;
  }
}