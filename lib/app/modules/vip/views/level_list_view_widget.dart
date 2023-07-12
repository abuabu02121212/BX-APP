import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_style.dart';

class LevelListViewWidget extends StatelessWidget {
  const LevelListViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 30.w, bottom: 30.w),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.w),
        child: Container(
          width: 710.w,
          height: 660.w,
          decoration: BoxDecoration(
            gradient: headerLinearGradient3,
          ),
          child: Center(
            child: Container(
              width: 660.w,
              height: 600.w,
              padding: EdgeInsets.all(1.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.w),
                  border: Border.all(
                    width: 1.w,
                    color: const Color.fromRGBO(255, 255, 255, 0.25),
                  )),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const ListTitleWidget(),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 30,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          width: double.infinity,
                          height: 50.w,
                          color: index % 2 == 0 ? const Color.fromRGBO(4, 75, 154, 0.20) : Colors.transparent,
                          child: ListItemWidget(index: index),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

BoxDecoration borderDec = BoxDecoration(
    border: Border(
        right: BorderSide(
  width: 1.w,
  color: const Color.fromRGBO(255, 255, 255, 0.25),
)));

class ListTitleWidget extends StatelessWidget {
  const ListTitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50.w,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 158.w,
            alignment: Alignment.center,
            decoration: borderDec,
            child: Text(
              "Nivel",
              style: TextStyle(
                fontSize: 24.w,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Container(
            width: 154.w,
            alignment: Alignment.center,
            decoration: borderDec,
            child: Text(
              "Prêmios",
              style: TextStyle(
                fontSize: 24.w,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Container(
            width: 195.w,
            alignment: Alignment.center,
            decoration: borderDec,
            child: Text(
              "Recompensa",
              style: TextStyle(
                fontSize: 24.w,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                "Aderecos",
                style: TextStyle(
                  fontSize: 24.w,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ListItemWidget extends StatelessWidget {
  const ListItemWidget({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50.w,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 158.w,
            alignment: Alignment.center,
            decoration: borderDec,
            child: Text(
              "VIp 01",
              style: TextStyle(
                fontSize: 24.w,
                color: const Color(0xff0ED1F4),
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Container(
            width: 154.w,
            alignment: Alignment.center,
            decoration: borderDec,
            child: Text(
              "R\$3.00",
              style: TextStyle(
                fontSize: 24.w,
                color: const Color(0xff0ED1F4),
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Container(
            width: 195.w,
            alignment: Alignment.center,
            decoration: borderDec,
            child: Text(
              "0.00%",
              style: TextStyle(
                fontSize: 24.w,
                color: const Color(0xff0ED1F4),
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                "x1",
                style: TextStyle(
                  fontSize: 24.w,
                  color: const Color(0xff0ED1F4),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
