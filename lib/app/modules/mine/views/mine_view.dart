import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_comm/app/routes/app_pages.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../component/app_button.dart';
import '../../../component/app_progress.dart';
import '../../../routes/app_pages.dart';
import '../controllers/mine_controller.dart';

class MineView extends GetView<MineController> {
  const MineView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xff000A1D),
          image: DecorationImage(
            alignment: Alignment.topCenter,
            image: AssetImage("assets/images/user-center-bg.webp"),
          ),
        ),
        child: ListView(
          children: [
            Container(
              height: 110.w,
              alignment: Alignment.center,
              child: Text("Minha conta",style: TextStyle(color: Colors.white,fontSize: 32.w,fontWeight: FontWeight.bold)),
            ),
            Container(
              height: 360.w,
              width: 705.w,
              margin: EdgeInsets.only(left: 45.w),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  alignment: Alignment.topCenter,
                  image: AssetImage("assets/images/my-bg.webp"),
                  fit: BoxFit.contain
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 185.w,
                    width:double.infinity,
                    child: Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 55.w,left: 55.w),
                          width: 120.w,
                          height: 120.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60.w),
                              border: Border.all(color: Color(0xff0ED1F4),width: 4.w),
                              image: const DecorationImage(
                                  image: AssetImage("assets/images/avatar/avatar0.webp"),
                                  fit: BoxFit.cover
                              )
                          ),
                        ),
                        Positioned(
                          top: 153.w,
                          left: 48.w,
                          child: Image.asset("assets/images/vip/vip-0.webp",width: 128.w),
                        ),
                        Positioned(
                          left: 198.w,
                          top: 55.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text("我的昵称",style: TextStyle(color: Colors.white,fontSize: 28.w,fontWeight: FontWeight.bold)),
                                  SizedBox(width: 11.w),
                                  Image.asset("assets/images/i-edit-name.webp",width: 27.w),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Nome do usuário:",style: TextStyle(color: Colors.white,fontSize: 26.w)),
                                  SizedBox(width: 7.w),
                                  Container(
                                    width: 208.w,
                                    height: 46.w,
                                    decoration: BoxDecoration(
                                      color: const Color.fromRGBO(0, 0, 0, 0.25),
                                      borderRadius: BorderRadius.circular(50.w)
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("qiaofeng88",style: TextStyle(color: Colors.white,fontSize: 26.w)),
                                        SizedBox(width: 7.w),
                                        Image.asset("assets/images/i-copy.webp",width: 25.w),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text("RR 0.00",style: TextStyle(color: Colors.white,fontSize: 42.w,fontWeight: FontWeight.bold)),
                                  SizedBox(width: 10.w),
                                  Image.asset("assets/images/i-refresh-money.webp",width: 49.w),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 45.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Benefícios',style: TextStyle(color: Colors.white,fontSize: 24.w)),
                        SizedBox(width: 10.w),
                        Image.asset("assets/images/vip-more.webp",width: 27.w),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 55.w,top: 7.w),
                    child: Row(
                      children: [
                        AppProgress(
                          width: 535.w,
                          height: 30.w,
                          radius: 100.w,
                          progress: 50,
                        ),
                        SizedBox(width: 15.w),
                        Text('0 / 1',style: TextStyle(color: Colors.white,fontSize: 26.w)),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 55.w,top: 30.w),
                    child: Row(
                      children: [
                        AppButton(
                          width: 180.w,
                          height: 54.w,
                          radius: 100.w,
                          text: 'Depósito',
                          colorList: const [Color(0xffFFD500),Color(0xffFF9901)],
                          onClick: () {

                          },
                        ),
                        AppButton(
                          width: 150.w,
                          height: 54.w,
                          radius: 100.w,
                          text: 'Retirar',
                          onClick: () {
                            Get.toNamed(Routes.NOTICE_LIST);
                          },
                        ),
                      ],
                    ),
                  ),

                ],
              )
            ),
            Container(
              margin: EdgeInsets.only(left: 74.w,top:30.w,bottom: 30.w),
              child: Row(
                children: [
                  Image(image: AssetImage("assets/images/bonusgood.webp"),width: 152.w),
                  SizedBox(width: 44.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(' Recompensa total de check-in',style: TextStyle(color: Colors.white,fontSize: 26.w)),
                      RichText(text: TextSpan(
                        text: 'de 7 dias:',
                        style: TextStyle(color: Colors.white,fontSize: 26.w),
                        children: [
                          TextSpan(
                            text: ' RR 0.42',
                            style: TextStyle(color: Color(0xff0ED1F4),fontSize: 28.w,fontWeight: FontWeight.bold),
                          )
                        ]
                      ))
                    ],
                  )
                ],
              ),
            ),
            Container(
              width: 660.w,
              height: 272.w,
              margin: EdgeInsets.only(left: 45.w,right: 45.w,bottom: 30.w),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xff044B9A),Color(0xff011A51)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
                ),
                borderRadius: BorderRadius.circular(20.w)
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 90.w,
                    child: CupertinoButton(
                        padding: EdgeInsets.only(left: 26.w,right: 26.w),
                        child: Row(
                          children: [
                            Image(image: AssetImage("assets/images/i-finance-record.webp"),width: 40.w),
                            SizedBox(width: 26.w),
                            Text('Transação',style: TextStyle(color: Colors.white,fontSize: 28.w)),
                            Expanded(child: SizedBox()),
                            Image(image: AssetImage("assets/images/i-arrow-right-bold.webp"),width: 20.w),
                          ],
                        ),
                        onPressed: (){
                          Get.toNamed(Routes.TRANSACTION);
                        }
                    ),
                  ),
                  Divider(color: const Color.fromRGBO(255, 255, 255, 0.25),height: 1.w),
                  CupertinoButton(
                      padding: EdgeInsets.only(left: 26.w,right: 26.w),
                      child: SizedBox(
                        height: 90.w,
                        child: Row(
                          children: [
                            Image(image: AssetImage("assets/images/i-agent-record.webp"),width: 40.w),
                            SizedBox(width: 26.w),
                            Text('Histórico de Apostas',style: TextStyle(color: Colors.white,fontSize: 28.w)),
                            Expanded(child: SizedBox()),
                            Image(image: AssetImage("assets/images/i-arrow-right-bold.webp"),width: 20.w),
                          ],
                        ),
                      ),
                      onPressed: (){
                        Get.toNamed(Routes.APOSTAS);
                      }),
                  Divider(color: const Color.fromRGBO(255, 255, 255, 0.25),height: 1.w),
                  CupertinoButton(
                      padding: EdgeInsets.only(left: 26.w,right: 26.w),
                      child: SizedBox(
                        height: 90.w,
                        child: Row(
                          children: [
                            Image(image: AssetImage("assets/images/i-gift-record.webp"),width: 40.w),
                            SizedBox(width: 26.w),
                            Text('Histórico de Recompensas',style: TextStyle(color: Colors.white,fontSize: 28.w)),
                            Expanded(child: SizedBox()),
                            Image(image: AssetImage("assets/images/i-arrow-right-bold.webp"),width: 20.w),
                          ],
                        ),
                      ),
                      onPressed: (){
                        Get.toNamed(Routes.RECOMPENSAS);
                      }),
                ]
              ),
            ),
            AppButton(
              width: 580.w,
              height: 90.w,
              radius: 100.w,
              text: 'Sair',
              colorList: const [Color(0xffFFD500),Color(0xffFF9901)],
              onClick: () {

              },
            ),
          ],
        ),
      )
    );
  }
}
