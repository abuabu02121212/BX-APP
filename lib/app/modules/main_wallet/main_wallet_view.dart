import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_comm/app/app_style.dart';
import 'package:flutter_comm/util/base_appbar_ph.dart';
import 'package:flutter_comm/util/base_scaffold_ph.dart';
import 'package:flutter_comm/util/size.dart';
import 'package:flutter_comm/util/toast_util.dart';
import 'package:flutter_comm/widget/box_shadow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../generated/l10n.dart';
import 'main_wallet_logic.dart';

class Main_walletPage extends StatefulWidget {
  const Main_walletPage({Key? key}) : super(key: key);

  @override
  State<Main_walletPage> createState() => _Main_walletPageState();
}

class _Main_walletPageState extends State<Main_walletPage> {
  final logic = Get.put(Main_walletLogic());
  final state = Get.find<Main_walletLogic>().state;

  var list_name = [0, 1, 2, 3, 4, 5];
  var list = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16];

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldPH(
      backgroundColor: blackBgColor_h,
      appBar: BaseAppbarPH(
        title: S.current.MainWallet,
      ),
      body: SizedBox(
        // padding: EdgeInsets.only(bottom: 150.h),
        height: double.infinity,
        child: Column(
          children: [
            _totalAccountBalance(),
            _gameList(context),
          ],
        ),
      ),
    );
  }

  Widget _totalAccountBalance() {
    return Container(
      height: 210.px,
      margin: EdgeInsets.fromLTRB(20.px, 26.px, 20.px, 0),
      padding: EdgeInsets.all(30.px),
      decoration: BoxDecoration(
        color: const Color(0xFF252527),
        border: Border.all(
            color: const Color.fromRGBO(93, 101, 111, 0.40), width: 1.px),
        borderRadius: BorderRadius.circular(16.px),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                S.current.TotalAccountBalance,
                style: pubTextStyle(
                    const Color(0xFFffffff), 28.sp, FontWeight.w400),
              ),
              const Expanded(child: SizedBox()),
              Text(
                '0.20',
                style: pubTextStyle(
                    const Color(0xFFF09B1B), 28.sp, FontWeight.w700),
              ),
              SizedBox(
                width: 13.px,
              ),
              CupertinoButton(
                  padding: EdgeInsets.zero,
                  minSize: 0,
                  child: Image(
                    image: const AssetImage(
                        'assets/images/user/ic_refreshed_w.webp'),
                    width: 26.px,
                  ),
                  onPressed: () => {
                        Toast.show('msg'),
                      }),
            ],
          ),
          Text(
            S.current.Only_integer_balance_will_pulled,
            style:
                pubTextStyle(const Color(0xff5D656F), 22.sp, FontWeight.w400),
          ),
          CupertinoButton(
              padding: EdgeInsets.zero,
              minSize: 0,
              child: Container(
                width: 280.px,
                height: 60.px,
                decoration: BoxDecoration(
                    color: const Color(0xff3EA1F8),
                    borderRadius: BorderRadius.circular(30.px)),
                child: Center(
                  child: Text(
                    S.current.OneClickTransfer,
                    style: pubTextStyle(
                        const Color(0xffffffff), 26.sp, FontWeight.w700),
                  ),
                ),
              ),
              onPressed: () => {
                    Toast.show('msg'),
                  }),
        ],
      ),
    );
  }

  Widget _gameList(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20.px, 24.px, 20.px, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100.px,
            height: (6 * 116).px,
            child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (BuildContext contet, int index) {
                  return SizedBox(
                    height: 16.px,
                  );
                },
                itemCount: list_name.length,
                itemBuilder: (BuildContext contet, int index) {
                  return _gameName(index);
                }),
          ),
          SizedBox(
            width: 22.px,
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.zero,
                  // alignment: Alignment.center,
                  height: 60.px,
                  width: 590.px,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.px),
                    border:
                        Border.all(color: const Color(0xff5D656F), width: 1.px),
                    // boxShadow: BoxShadow(color: ['#212227'.color,'#212227'.color],) ,
                    boxShadow: const [
                      BoxShadows(
                          color: Color.fromRGBO(255, 255, 255, 0.25),
                          offset: Offset(0, -1),
                          inset: true,
                          // blurStyle: BlurStyle.inner,
                          blurStyle: BlurStyle.inner,
                          blurRadius: 1)
                    ],
                    gradient: const LinearGradient(
                        colors: [Color(0xff212227), Color(0xff212227)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight),
                  ),
                  child: TextField(
                    controller: TextEditingController(),
                    maxLines: 1,
                    cursorColor: const Color(0xffffffff),
                    style: pubTextStyle(
                      const Color(0xffffffff),
                      26.sp,
                      FontWeight.w400,
                    ),
                    onChanged: (text) async {},
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(
                            left: 24.px, right: 0.px, top: 7.px, bottom: 0.px),
                        hintText: S.current.PlatformSearch,
                        hintStyle: pubTextStyle(
                            const Color(0xff5D656F), 26.sp, FontWeight.w400),
                        suffixIcon: IconButton(
                            onPressed: () => {
                                  Toast.show('msg00'),
                                },
                            icon: Image(
                              image: const AssetImage(
                                  'assets/images/user/ic_vector.webp'),
                              width: 28.px,
                            ))),
                  ),
                ),
                Container(
                  width: 590.px,
                  height: 1020.px,
                  // height: double.infinity,
                  margin: EdgeInsets.only(top: 24.px),
                  child: GridView.builder(
                      itemCount: list.length,
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 18.px,
                          crossAxisSpacing: 16.px,
                          childAspectRatio: 285 / 140),
                      itemBuilder: (BuildContext context, int index) {
                        return _getGridItem(index);
                      }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _getGridItem(int i) {
    return CupertinoButton(
        padding: EdgeInsets.zero,
        child: Container(
          width: 285.px,
          height: 140.px,
          decoration: BoxDecoration(
            color: const Color(0xff1A1C1F),
            borderRadius: BorderRadius.circular(16.px),
            border: Border.all(
                color: const Color.fromRGBO(93, 101, 111, 0.40), width: 1.px),
          ),
          child: Column(
            children: [
              Expanded(
                  child: Center(
                child: Text(
                  '${list[i]}',
                  style: pubTextStyle(
                      const Color(0xff8F9DAB), 24.sp, FontWeight.w400),
                ),
              )),
              Divider(
                color: const Color.fromRGBO(93, 101, 111, 0.40),
                height: 1.px,
              ),
              Expanded(
                  child: Center(
                child: Text(
                  '0.00',
                  style: pubTextStyle(
                      const Color(0xffffffff), 26.sp, FontWeight.w700),
                ),
              )),
            ],
          ),
        ),
        onPressed: () => {Toast.show('msg')});
  }

  BoxDecoration getBoxDecoration() {
    return BoxDecoration(
      gradient: const LinearGradient(colors: [
        Color(0xff61CEFF),
        Color(0xff1B75F0),
      ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
      border: Border.all(
          color: const Color.fromRGBO(121, 121, 121, 0.30), width: 1.px),
      borderRadius: BorderRadius.circular(24.px),
    );
  }

  BoxDecoration getBoxDecoration2() {
    return BoxDecoration(
      color: const Color(0xff1A1C1F),
      boxShadow: const [
        BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.25),
          offset: Offset(0, -1),
          spreadRadius: 2,
        ),
      ],
      borderRadius: BorderRadius.circular(24.px),
    );
  }

  Widget _gameName(int index) {
    return Obx(() => Container(
          height: 100.px,
          decoration: logic.indexs.value == index
              ? getBoxDecoration()
              : getBoxDecoration2(),
          child: CupertinoButton(
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  SizedBox(
                    height: 10.px,
                  ),
                  Image(
                    image: AssetImage(
                        "assets/images/${logic.indexs.value == index ? "game-tab${logic.imgListY[index]}" : "game-tab-un${logic.imgListY[index]}"}.webp"),
                    width: 52.px,
                  ),
                  Text(
                    logic.nameList[index],
                    style: pubTextStyle(
                        const Color(0xffffffff), 20.sp, FontWeight.w700),
                  ),
                ],
              ),
              onPressed: () => {
                    Toast.show('msg'),
                    logic.indexs.value = index,
                    logic.indexs.refresh(),
                  }),
        ));
  }

  @override
  void dispose() {
    Get.delete<Main_walletLogic>();
    super.dispose();
  }
}
