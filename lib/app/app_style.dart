import 'package:flutter/cupertino.dart';

Color statusBarColor = const Color(0xff044B9A);

LinearGradient headerLinearGradient = const LinearGradient(
  colors: [Color(0xff044B9A), Color(0xff011A51)],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

LinearGradient yellowLinearGradient = const LinearGradient(
  colors: [Color.fromRGBO(255, 163, 5, 1), Color.fromRGBO(255, 204, 90, 1)],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);

LinearGradient activeBtnLinearGradient = const LinearGradient(
  colors: [Color.fromRGBO(19, 115, 239, 1), Color.fromRGBO(14, 209, 244, 1)],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);
