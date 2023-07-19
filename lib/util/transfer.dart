import 'package:flutter/services.dart';
import 'package:flutter_comm/util/toast_util.dart';
import 'package:intl/intl.dart';

class AppUtil {

  static String timestamp2Date(String value) {
    if (value.isEmpty) {
      return '-';
    }
    int timestamp = int.parse(value);
    if (timestamp < 10000000000) {
      timestamp *= 1000;
    }
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp);
    return DateFormat('yyyy-MM-dd HH:mm:ss').format(date);
  }

  static String amountFormat(String value) {
    if (value.isEmpty) {
      return '-';
    }
    double amount = double.parse(value);
    NumberFormat currencyFormat = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
    String result = currencyFormat.format(amount);
    return result;
  }

  static void copy(String value) async {
    try {
      await Clipboard.setData(ClipboardData(text: value));
      Toast.show('Copied!');
    } catch (e) {
      Toast.show('replicação falhou');
      print(e);
    }
  }
}