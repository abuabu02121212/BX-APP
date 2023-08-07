import 'package:flutter/cupertino.dart';

import '../util/Log.dart';

class AutoScrollUtil {
  final ScrollController sc = ScrollController();
  double scrollSpeed;
  AutoScrollUtil({this.scrollSpeed = 20}) {
    Future.delayed(const Duration(milliseconds: 1000), () async {
      while (true) {
        if (!sc.hasClients || sc.position.maxScrollExtent == 0) {
          await Future.delayed(const Duration(milliseconds: 1000));
          continue;
        }
        if (sc.position.extentAfter == 0) {
          sc.jumpTo(0);
        }
        await startScroll();
      }
    });
  }

  int exeTimes = 0;
  bool isPauseScroll = false;

  Future<void> startScroll() async {
    try {
      var extentAfter = sc.position.extentAfter;
      double scrollUnitDistance = scrollSpeed;
      double unitDuring = 250;
      double scrollDistance = extentAfter >= scrollUnitDistance ? scrollUnitDistance : extentAfter;
      int scrollDuring = (scrollDistance / scrollUnitDistance * unitDuring).toInt();
      await sc.position.animateTo(scrollDistance + sc.offset, duration: Duration(milliseconds: scrollDuring), curve: Curves.linear);
      exeTimes++;
    } catch (e, stack) {
      Log.e("$e, \n$stack");
    }
  }
}
