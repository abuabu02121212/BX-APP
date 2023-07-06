import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppProgress extends StatelessWidget {
  const AppProgress({
    super.key,
    required this.width,
    required this.height,
    required this.progress,
    this.colorList = colorList1,
    required this.radius,
  });

  final double width;
  final double height;
  final double progress;
  final List<Color> colorList;
  final double radius;

  static const colorList1 = [Color(0xff1373EF), Color(0xff0ED1F4)];

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(0, 0, 0, 0.25),
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Align(
          alignment: Alignment.topLeft,
          child: Container(
            width: width * progress / 100,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: colorList1),
              borderRadius: BorderRadius.circular(radius),
            ),
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 20.w),
            child: Text(
              "$progress%",
              style: TextStyle(
                fontSize: 24.w,
                color: const Color(0xffffffff),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
