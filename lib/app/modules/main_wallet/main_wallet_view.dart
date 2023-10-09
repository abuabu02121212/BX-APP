import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_comm/app/app_style.dart';
import 'package:flutter_comm/util/base_appbar_ph.dart';
import 'package:flutter_comm/util/base_scaffold_ph.dart';
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

  var list_name = [0, 1, 2, 3, 4, 5, 6];
  var list = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16];

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldPH(
      backgroundColor: blackBgColor_h,
      appBar: BaseAppbarPH(
        title: S.current.MainWallet,
      ),
      body: Container(
        padding: EdgeInsets.only(bottom: 115.h),
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
      height: 210.h,
      margin: EdgeInsets.fromLTRB(20.w, 26.h, 20.w, 0),
      padding: EdgeInsets.all(30.h),
      decoration: BoxDecoration(
        color: const Color(0xFF252527),
        border: Border.all(
            color: const Color.fromRGBO(93, 101, 111, 0.40), width: 1.w),
        borderRadius: BorderRadius.circular(16.r),
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
                width: 13.w,
              ),
              CupertinoButton(
                  padding: EdgeInsets.zero,
                  minSize: 0,
                  child: Image(
                    image: const AssetImage(
                        'assets/images/user/ic_refreshed_w.webp'),
                    width: 26.w,
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
                width: 280.w,
                height: 60.h,
                decoration: BoxDecoration(
                    color: const Color(0xff3EA1F8),
                    borderRadius: BorderRadius.circular(30.r)),
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
      margin: EdgeInsets.fromLTRB(20.w, 24.h, 20.w, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100.w,
            height: 1000.h,
            child: ListView.separated(
                separatorBuilder: (BuildContext contet, int index) {
                  return SizedBox(
                    height: 16.h,
                  );
                },
                itemCount: list_name.length,
                itemBuilder: (BuildContext contet, int index) {
                  return _gameName(index);
                }),
          ),
          SizedBox(
            width: 22.w,
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.zero,
                  alignment: Alignment.topLeft,
                  height: 60.h,
                  width: 590.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.r),
                    border:
                        Border.all(color: const Color(0xff5D656F), width: 1.w),
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
                    style: pubTextStyle(
                        const Color(0xffffffff), 26.sp, FontWeight.w400),
                    onChanged: (text) async {
                      // Toast.show('msg');
                      // _searchResults = await EmojiPickerUtils()
                      //     .searchEmoji(text, defaultEmojiSet);
                      // setState(() {});
                    },
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 24.w, right: 0.w),
                        hintText: S.current.PlatformSearch,
                        hintStyle: pubTextStyle(
                            const Color(0xff5D656F), 26.sp, FontWeight.w400),
                        suffixIcon: IconButton(
                            onPressed: () => {
                                  Toast.show('msg'),
                                },
                            icon: Image(
                              image: const AssetImage(
                                  'assets/images/user/ic_vector.webp'),
                              width: 28.w,
                            ))),
                  ),
                ),
                Container(
                  width: 590.w,
                  height: 1000.h,
                  margin: EdgeInsets.only(top: 24.w),
                  child: GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 18.w,
                        crossAxisSpacing: 16.h,
                        // double itemRatio = itemW / (imgItemH + textH);
                        childAspectRatio: 285 / 140),
                    children: list.map((e) => _getGridItem(e)).toList(),
                    // children: list.map((e) =>Text('data')).toList(),
                  ),
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
          width: 285.w,
          height: 140.h,
          decoration: BoxDecoration(
            color: const Color(0xff1A1C1F),
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
                color: const Color.fromRGBO(93, 101, 111, 0.40), width: 1.w),
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
                height: 1.h,
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
      // color: indexs ==index? : ,
      // gradient: LinearGradient(
      //     colors: [Color(0xffDEEEFB), Color(0xffBEDCEF)], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      gradient: const LinearGradient(colors: [
        Color(0xff61CEFF),
        Color(0xff1B75F0),
      ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
      border: Border.all(
          color: const Color.fromRGBO(121, 121, 121, 0.30), width: 1.w),
      borderRadius: BorderRadius.circular(24.r),
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
      borderRadius: BorderRadius.circular(24.r),
    );
  }

  Widget _gameName(int index) {
    return Obx(() => Container(
          width: 100.w,
          height: 100.h,
          decoration: logic.indexs.value == index
              ? getBoxDecoration()
              : getBoxDecoration2(),
          child: CupertinoButton(
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Image(
                    image: const AssetImage('assets/images/user/ic_all2.webp'),
                    width: 52.w,
                    height: 52.h,
                  ),
                  Text(
                    S.current.All,
                    style: pubTextStyle(
                        const Color(0xffffffff), 22.sp, FontWeight.w700),
                  ),
                ],
              ),
              onPressed: () => {
                    Toast.show('msg'),
                    logic.indexs.value = index,
                    // Update(),
                  }),
        ));
  }

  @override
  void dispose() {
    Get.delete<Main_walletLogic>();
    super.dispose();
  }
}
