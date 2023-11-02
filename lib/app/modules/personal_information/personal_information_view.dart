import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_comm/util/size.dart';
import 'package:flutter_comm/util/toast_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../generated/l10n.dart';
import '../../../util/base_appbar_ph.dart';
import '../../../util/base_scaffold_ph.dart';
import '../../app_style.dart';
import '../change_profile/change_profile_view.dart';
import 'personal_information_logic.dart';

class Personal_informationPage extends StatefulWidget {
  const Personal_informationPage({Key? key}) : super(key: key);

  @override
  State<Personal_informationPage> createState() =>
      _Personal_informationPageState();
}

class _Personal_informationPageState extends State<Personal_informationPage> {
  final logic = Get.put(Personal_informationLogic());
  final state = Get.find<Personal_informationLogic>().state;

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldPH(
      backgroundColor: blackBgColor_h,
      appBar: BaseAppbarPH(
        title: S.current.PersonalInformation,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(20.px, 30.px, 20.px, 0),
              child: Column(children: [
                Container(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 172.px,
                    width: 160.px,
                    child: Stack(
                      children: [
                        Image(
                          image: const AssetImage(
                              'assets/images/user/ic_profile_picture.webp'),
                          height: 160.px,
                        ),

                        // Stack(
                        //   children: [
                        Positioned(
                          bottom: 0.px,
                          right: 13.px,
                          left: 13.px,
                          child: Image(
                            image: const AssetImage(
                                'assets/images/vip/bg_num.webp'),
                            width: 134.px,
                          ),
                        ),
                        Positioned(
                          bottom: 5.px,
                          right: 0.px,
                          left: 0.px,
                          child: Text(
                            '${S.current.VIP}1',
                            textAlign: TextAlign.center,
                            style: pubTextStyle(const Color(0xffffffff), 21.sp,
                                FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: Container(
                      height: 60.px,
                      width: 240.px,
                      alignment: Alignment.center,
                      decoration: pubBoxDecoration_r(
                          rs: 30.px, color: const Color(0xff3EA1F8)),
                      margin: EdgeInsets.only(top: 24.px),
                      child: Text(
                        S.current.Modify_avatar,
                        style: pubTextStyle_default(
                            type: 1, fontWeight: FontWeight.w700, size: 26.sp),
                      ),
                    ),
                    onPressed: () => {
                          // Get.toNamed(Routes.CHANGE_PROFILE),
                          showLoginRegisterDialog(),
                        }),
                SizedBox(
                  height: 30.px,
                ),
                _getInformationV(index: 0, name: 'Yumikocclemo', hiname: ''),
                _getInformationV(index: 1, name: '498916685', hiname: ''),
                _getInformationV(
                    index: 2,
                    name: '',
                    hiname: S.current.please_enter + S.current.Whatsapp),
                _getInformationV(
                    index: 3,
                    name: '',
                    hiname: S.current.please_enter + S.current.Facebook),
                _getInformationV(
                    index: 4,
                    name: '',
                    hiname: S.current.please_enter + S.current.Telegram),
                _getInformationV(
                    index: 5,
                    name: '',
                    hiname: S.current.please_first_bind_cashout_account),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    S.current.Date_Of_Birth,
                    style: pubTextStyle_default(type: 1, size: 26.sp),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 16.px),
                  height: 70.px,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _getDateV(
                          name: S.current.Day,
                          Function: () => {Toast.show('msg')}),
                      _getDateV(
                          name: S.current.Month,
                          Function: () => {Toast.show('msg')}),
                      _getDateV(
                          name: S.current.Year,
                          Function: () => {Toast.show('msg')}),
                    ],
                  ),
                ),
              ]),
            ),
          ),
          Container(
            color: const Color(0xff1A1C1F),
            // width: double.infinity,
            height: 128.px,
            padding: EdgeInsets.fromLTRB(18.px, 24.px, 18.px, 24.px),
            child: Row(
              children: [
                Expanded(
                    child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () => {
                    Get.back(),
                  },
                  child: Container(
                    height: 80.px,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.px),
                      border: Border.all(
                          color: const Color(0xff3EA1F8), width: 1.w),
                    ),
                    child: Text(
                      S.current.Back,
                      style: pubTextStyle(
                          const Color(0xff3EA1F8), 26.sp, FontWeight.w700),
                    ),
                  ),
                )),
                SizedBox(
                  width: 17.px,
                ),
                Expanded(
                    child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () => {
                    Toast.show('msg'),
                  },
                  child: Container(
                    height: 80.px,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.px),
                        color: const Color(0xff3EA1F8)
                        // border: Border.all(
                        //     color: const Color(0xff3EA1F8), width: 1.w),
                        ),
                    child: Text(
                      S.current.Save,
                      style: pubTextStyle(
                          const Color(0xffffffff), 26.sp, FontWeight.w700),
                    ),
                  ),
                )),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).padding.bottom,
            color: const Color(0xff1A1C1F),
          )
        ],
      ),
    );
  }

  Widget _getDateV({var name, var Function}) {
    return CupertinoButton(
        padding: EdgeInsets.zero,
        child: Container(
          height: 70.px,
          width: 226.px,
          decoration: pubBoxDecoration(
            rs: 8.px,
            color: const Color(0xff1A1C1F),
          ),
          padding: EdgeInsets.only(left: 25.px, right: 25.px),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: pubTextStyle_default(type: 4),
              ),
              Image(
                image: const AssetImage(
                    'assets/images/promotion/ic_arrow_down_gray.webp'),
                height: 12.px,
              ),
            ],
          ),
        ),
        onPressed: () => {
              Function(),
            });
  }

  Widget _getInformationV({var index = 0, var name, var hiname}) {
    return Container(
      margin: EdgeInsets.only(bottom: 24.px),
      padding: EdgeInsets.only(left: 18.px, right: 25.px),
      height: 70.px,
      decoration: pubBoxDecoration(
          color: name.isNotEmpty ? blackBgColor_h : const Color(0xff1A1C1F),
          rs: 8.px),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(logic.imgList[index]),
            width: 36.px,
          ),
          SizedBox(
            width: 23.px,
          ),
          name.isNotEmpty
              ? Expanded(
                  child: Text(
                  name,
                  style: pubTextStyle(
                      const Color(0xffffffff), 24.sp, FontWeight.w400),
                ))
              : Expanded(
                  child: TextField(
                  controller: TextEditingController(),
                  maxLines: 1,
                  cursorColor: const Color(0xffffffff),
                  style: pubTextStyle(
                      const Color(0xFFffffff), 24.sp, FontWeight.w400),
                  onChanged: (text) async {},
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                        left: 0.px, right: 20.px, top: 0.px, bottom: 25.px),
                    hintText: hiname,
                    hintStyle: pubTextStyle(
                        const Color(0xFF5D656F), 24.sp, FontWeight.w400),
                  ),
                )),
          if (index == 5)
            CupertinoButton(
                padding: EdgeInsets.zero,
                child: Text(
                  S.current.go_to_bind,
                  style: pubTextStyle_default(type: 2),
                ),
                onPressed: () => {
                      // Get.toNamed(Routes.WITHDRAW_PIN),
                      Toast.show('msg')
                    }),
        ],
      ),
    );
  }

  // CupertinoPopupSurface _getp(){
  //
  // }

  @override
  void dispose() {
    Get.delete<Personal_informationLogic>();
    super.dispose();
  }
}

void showLoginRegisterDialog() {
  showLoginDialog();
}
