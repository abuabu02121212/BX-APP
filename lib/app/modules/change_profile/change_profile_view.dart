import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_comm/app/app_style.dart';
import 'package:flutter_comm/util/size.dart';
import 'package:flutter_comm/util/toast_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../generated/l10n.dart';
import 'change_profile_logic.dart';

class Change_profilePage extends StatefulWidget {
  const Change_profilePage({Key? key}) : super(key: key);

  @override
  State<Change_profilePage> createState() => _Change_profilePageState();
}

class _Change_profilePageState extends State<Change_profilePage> {
  final logic = Get.put(Change_profileLogic());
  final state = Get.find<Change_profileLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // padding: EdgeInsets.fromLTRB(45.px, 40.px, 45.px, 40.px),
        padding: EdgeInsets.all(40.px),
        width: 660.px,
        height: 970.px,
        decoration: BoxDecoration(
          color: const Color(0xff252527),
          borderRadius: BorderRadius.circular(24.px),
        ),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Text(
                        S.current.ChangeProfile,
                        textAlign: TextAlign.center,
                        style: pubTextStyle_default(
                            type: 1, size: 34.sp, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    bottom: 0,
                    right: 0,
                    child: CupertinoButton(
                        minSize: 0,
                        padding: EdgeInsets.zero,
                        child: Image(
                            image: const AssetImage("assets/images/close.webp"),
                            width: 24.px),
                        onPressed: () => {
                              Get.back(),
                            }),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _getTabV(S.current.Male, 1, true),
                _getTabV(S.current.Female, 2, false),
              ],
            ),
            Expanded(
              child: Container(
                  margin: EdgeInsets.only(top: 30.px),
                  width: double.infinity,
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 30.px,
                          crossAxisCount: 4,
                          crossAxisSpacing: 30.px,
                          childAspectRatio: 130 / 130),
                      itemCount: logic.list.length,
                      // itemCount: 16,
                      itemBuilder: (BuildContext context, int index) {
                        return Center(
                          child: Container(
                            decoration: pubBoxDecoration_r(
                                color: const Color(0xffD9D9D9),
                                colorBorder: const Color(0xff3EA1F8),
                                rs: 65.px,
                                withs: 5.px),
                            // child: ClipOval(child: Image(image: AssetImage("assets/images/close.webp"),width: 120.px,height: 120.px,),),
                          ),
                        );
                      })),
            ),
            CupertinoButton(
                padding: EdgeInsets.zero,
                child: Container(
                  margin: EdgeInsets.only(top: 40.px),
                  height: 80.px,
                  width: double.infinity,
                  decoration:
                      pubBoxDecoration_r(color: const Color(0xff3EA1F8)),
                  alignment: Alignment.center,
                  child: Text(
                    S.current.Save,
                    style: pubTextStyle_default(
                        type: 1, size: 26.sp, fontWeight: FontWeight.w700),
                  ),
                ),
                onPressed: () => {
                      Toast.show('msg'),
                      Get.back(),
                    }),
          ],
        ),
      ),
    );
  }

  Widget _getTabV(var name, var type, var isSele) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () => {Toast.show('msg')},
      // child: Expanded(
      child: Container(
        alignment: Alignment.center,
        height: 60.px,
        width: 280.px,
        margin: EdgeInsets.only(top: 55.px),
        decoration: pubBoxDecoration_r(
            color: isSele ? const Color(0xff3EA1F8) : Colors.transparent,
            rs: 30.px,
            colorBorder: !isSele
                ? const Color.fromRGBO(93, 101, 111, 0.40)
                : Colors.transparent),
        child: Row(
          children: [
            const Expanded(child: SizedBox()),
            Image(
              image: const AssetImage('assets/images/user/ic_male.webp'),
              width: 30.px,
            ),
            SizedBox(
              width: 8.px,
            ),
            Text(
              name,
              style: pubTextStyle_default(
                  type: 1, size: 26.sp, fontWeight: FontWeight.w700),
            ),
            const Expanded(child: SizedBox()),
          ],
        ),
      ),
      // ),
    );
  }

  @override
  void dispose() {
    Get.delete<Change_profileLogic>();
    super.dispose();
  }
}

void showLoginDialog() {
  String routerName = 'profile-dialog';
  // if (appNavigatorObserver.curRouterName == routerName) {
  //   return;
  // }
  Get.dialog(
    const Change_profilePage(),
    name: routerName,
    barrierDismissible: false,
    barrierColor: const Color.fromRGBO(0, 0, 0, 0.7),
  );
}
