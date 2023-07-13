import 'package:flutter/cupertino.dart';

import '../util/Log.dart';

class AutoScrollUtil {

  final ScrollController sc = ScrollController();

  AutoScrollUtil() {
    Future.delayed(const Duration(milliseconds: 1000), () async {
      while(true){
        if(!sc.hasClients){
          await Future.delayed(const Duration(milliseconds: 1000));
          continue;
        }
        if(sc.position.extentAfter == 0){
         // await Future.delayed(const Duration(milliseconds: 1000));
          sc.jumpTo(0);
        }
        await startScroll();
       // await Future.delayed(const Duration(milliseconds: 1000));
      }

    });
  }
  int exeTimes = 0;
  Future<void> startScroll() async {
    var extentAfter = sc.position.extentAfter;
    double scrollUnitDistance = 20;
    double unitDuring = 500;
    double scrollDistance = extentAfter >= scrollUnitDistance ? scrollUnitDistance : extentAfter;
    int scrollDuring = (scrollDistance / scrollUnitDistance * unitDuring).toInt();
    sc.position.animateTo(scrollDistance + sc.offset, duration: Duration(milliseconds: scrollDuring), curve: Curves.linear);
    // Log.d("===================AutoScrollUtil=====exeTimes:$exeTimes======scrollDistance:$scrollDistance===scrollDuring:$scrollDuring========");
    await Future.delayed(Duration(milliseconds: scrollDuring));
    exeTimes++;
  }

}
