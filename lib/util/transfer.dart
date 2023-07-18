import 'package:intl/intl.dart';

class AppTransfer {

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
}