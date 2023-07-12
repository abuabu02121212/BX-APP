import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../app_style.dart';

class VipWithdrawCardWidget extends StatelessWidget {
  const VipWithdrawCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 30.w),
        padding: EdgeInsets.only(left: 20.w, right: 20.w),
        width: 710.w,
        height: 248.w,
        decoration: BoxDecoration(
          gradient: headerLinearGradient3,
          borderRadius: BorderRadius.circular(20.w),
        ),
        child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(3, (index) => ItemWidget(index: index))),
      ),
    );
  }
}

class ItemWidget extends StatelessWidget {
  ItemWidget({
    super.key,
    required this.index,
  });

  final List<String> names = ["Número de saques \npor dia", "Limite diário \nde retirada", "Bônus de \natualização"];
  final List<String> imgList = ["i-withdarw", "i-bet-record", "i-vip2"];
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset("assets/images/${imgList[index]}.webp", width: 51.w),
        SizedBox(height: 20.w),
        Text(
          "0",
          style: TextStyle(fontSize: 36.w, color: Colors.white, fontWeight: FontWeight.w700),
        ),
        SizedBox(height: 6.w),
        Text(
          names[index],
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24.w,
            color: const Color.fromRGBO(255, 255, 255, 0.70),
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
