import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../component/app_progress.dart';

class VipLevelCard extends StatelessWidget {
  const VipLevelCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 330.w,
      margin: EdgeInsets.only(top: 30.w),
      child: PageView.builder(
        itemCount: 5,
        controller: PageController(initialPage: 0, viewportFraction: 0.93),
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 120.w,
            //  width: double.infinity,
            child: Stack(
              children: [
                Image.asset("assets/images/vip/card.webp", width: double.infinity),
                Padding(
                  padding: EdgeInsets.only(left: 50.w, right: 50.w, top: 34.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/vip/medal-$index.webp", width: 142.w),
                          AppProgress(
                            width: 348.w,
                            height: 30.w,
                            radius: 10.w,
                            progress: 50,
                          ),
                          Text(
                            "0 / 1",
                            style: TextStyle(fontSize: 26.w, color: const Color(0xffffffff), fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 12.w, left: 20.w, right: 20.w),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: List.generate(3, (index) => ItemWidget(index: index)),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ItemWidget extends StatelessWidget {
  ItemWidget({
    super.key,
    required this.index,
  });

  final int index;

  final List<String> names = ["Depósito \ncumulativo", "Requisitos \nde fluxo", "Valor da \nexperiência"];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "R\$0.00",
          style: TextStyle(
            fontSize: 42.w,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          names[index],
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24.w,
            color: const Color.fromRGBO(255, 255, 255, 0.70),
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
