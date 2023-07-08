import 'package:flutter/cupertino.dart';
import 'package:flutter_comm/util/bottom_sheet_util.dart';
import 'package:flutter_comm/util/toast_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSelect extends StatefulWidget {
  const AppSelect({
    super.key,
    this.height,
    this.value,
    required this.selectDataList
  });

  final List<Map<String, dynamic>> selectDataList;
  final double? height;
  final String? value;

  @override
  State<AppSelect> createState() => _AppSelectState();
}

class _AppSelectState extends State<AppSelect> {

  get _value => widget.value ?? widget.selectDataList[0]['value'];

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: const EdgeInsets.all(0),
      minSize: 0,
      onPressed: () {
        BottomSheetUtil.showBottomSheet(
            context, data: ['Aa', 'Bb'],
            selectData: 'Bb',
            ok: (String value) {
              Toast.show(value.toString() + '1');
            }
        );
      },
      child: Container(
        height: widget.height ?? 80.w,
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        constraints: BoxConstraints(minWidth: 200.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.w),
          border: Border.all(color: const Color.fromRGBO(14, 209, 244, 1), width: 1.w),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(_value, style: TextStyle(color: const Color.fromRGBO(14, 209, 244, 1), fontSize: 24.w)),
            SizedBox(width: 10.w),
            Image.asset('assets/images/down.webp', width: 25.w)
          ],
        )
      ),
    );
  }
}
