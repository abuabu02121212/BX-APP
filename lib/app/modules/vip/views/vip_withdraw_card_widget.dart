import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../util/app_util.dart';
import '../../../app_style.dart';
import '../../../entity/vip_level_info.dart';
import '../controllers/vip_controller.dart';

class VipWithdrawCardWidget extends StatelessWidget {
  VipWithdrawCardWidget({
    super.key,
  });

  final VipController controller = Get.put(VipController());

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
        child: Obx(() {
          List dataList = controller.dataList;
          VipInfoEntity? item = dataList.isNotEmpty ? dataList[controller.selectedCardIndex.value] : null;
          return Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(3, (index) {
                String amount = '0';
                switch (index) {
                  case 0:
                    amount = "${item?.freeWithdrawNum}";
                    break;
                  case 1:
                    amount = AppUtil.amountFormat(item?.withdrawLimit ?? '0');
                    break;
                  case 2:
                    amount = AppUtil.amountFormat(item?.amount ?? '0');
                    break;
                }
                return ItemWidget(
                  index: index,
                  text: amount,
                );
              }));
        }),
      ),
    );
  }
}

class ItemWidget extends StatelessWidget {
  ItemWidget({
    super.key,
    required this.index,
    required this.text,
  });

  final List<String> names = ["Número de saques \npor dia", "Limite diário \nde retirada", "Bônus de \natualização"];
  final List<String> imgList = ["i-withdarw", "i-bet-record", "i-vip2"];
  final int index;
  final String text;

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
          text,
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
