import 'package:flutter/material.dart';
import 'package:flutter_comm/util/size.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../generated/l10n.dart';
import '../../../util/base_appbar_ph.dart';
import '../../../util/base_scaffold_ph.dart';
import '../../../util/toast_util.dart';
import '../../../widget/pin_code_text.dart';
import '../../../widget/pub_bot.dart';
import '../../app_style.dart';
import 'withdraw_pin_logic.dart';

class Withdraw_pinPage extends StatefulWidget {
  const Withdraw_pinPage({Key? key}) : super(key: key);

  @override
  State<Withdraw_pinPage> createState() => _Withdraw_pinPageState();
}

class _Withdraw_pinPageState extends State<Withdraw_pinPage> {
  final logic = Get.put(Withdraw_pinLogic());
  final state = Get.find<Withdraw_pinLogic>().state;

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldPH(
      backgroundColor: blackBgColor_h,
      appBar: BaseAppbarPH(
        title: S.current.WithdrawPIN,
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(20.px, 26.px, 20.px, 26.px),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.current.Set_Up_Withdrawal_PIN,
              style:
                  pubTextStyle(const Color(0xffffffff), 26.sp, FontWeight.w700),
            ),
            SizedBox(
              height: 30.px,
            ),
            Obx(
              () => PinCodeText(
                isNum: logic.hasError.value,
                name: S.current.NewWithdrawalPassword,
                textEditingController: logic.controller,
                changed: (e) => {
                  Toast.show('$e'),
                },
                onDone: (e) => {
                  Toast.show('${e}aaaa'),
                },
                canDisplayed: () => {
                  Toast.show('aaaa'),
                  logic.hasError.value = !logic.hasError.value,
                  logic.hasError.refresh()
                },
              ),
            ),
            SizedBox(
              height: 30.px,
            ),
            Obx(
              () => PinCodeText(
                isNum: logic.hasError.value,
                name: S.current.NewWithdrawalPassword,
                textEditingController: logic.controller,
                changed: (e) => {
                  Toast.show('$e'),
                },
                onDone: (e) => {
                  Toast.show('${e}aaaa'),
                },
                canDisplayed: () => {
                  Toast.show('aaaa'),
                  logic.hasError.value = !logic.hasError.value,
                  logic.hasError.refresh()
                },
              ),
            ),
            SizedBox(
              height: 30.px,
            ),
            Text(
              S.current.Tips,
              style:
                  pubTextStyle(const Color(0xffD94F39), 22.sp, FontWeight.w400),
            ),
            SizedBox(
              height: 10.px,
            ),
            Text(
              S.current.Tips_D,
              style:
                  pubTextStyle(const Color(0xffD94F39), 22.sp, FontWeight.w400),
            ),
            const Expanded(child: SizedBox()),
            PubBot(
              name: S.current.Confirm,
              isSele: true,
              click: () => {
                Toast.show('msg'),
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<Withdraw_pinLogic>();
    super.dispose();
  }
}
