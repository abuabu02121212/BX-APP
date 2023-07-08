import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppEmpty extends StatelessWidget {
  const AppEmpty({super.key, this.height});
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.asset('assets/images/empty.webp', width: 192.w),
          Center(
            child: Text('Sem dados', style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 0.7),
              fontSize: 26.w
            )),
          )
        ],
      ),
    );
  }
}
