import 'dart:math';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_comm/app/component/app_tab.dart';
import 'package:flutter_comm/widget/input_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../component/app_button.dart';
import '../../../component/app_header.dart';
import '../controllers/deposit_controller.dart';

class DepositView extends GetView<DepositController> {
  const DepositView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 10, 29, 1),
      appBar: AppBar(
        titleSpacing: 0,
        leadingWidth: 0,
        elevation: 1.0,
        title: const AppHeader(
          title: "Promoção",
        ),
      ),
      body: NestedScrollView(
        controller: controller.scrollViewController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: const Color.fromRGBO(0, 10, 29, 1),
              pinned: true,
              floating: true,
              automaticallyImplyLeading: false,
              expandedHeight: 390.w + 110.w,
              flexibleSpace: Container(
                child: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: SizedBox(
                    //头部整个背景颜色
                    child: Column(
                      children: <Widget>[
                        _buildTop(),
                      ],
                    ),
                  ),
                ),
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(110.w),
                child: Container(
                  height: 110.w,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromRGBO(1, 26, 81, 0.00),
                        Color.fromRGBO(1, 26, 81, 1.00),
                      ],
                      stops: [0.0, 1.0],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 100.w,
                        child: AppTab(
                          controller: controller.tabController,
                          indicatorWidth: 80.w,
                          tabs: const [
                            {'label': 'Depósito', 'value': 0},
                            {'label': 'Retirar', 'value': 1}
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ];
        },
        body: TabBarView(
          controller: controller.tabController,
          children: [
            ListView(
              children: [_buildDeposit(controller)],
            ),
            ListView(
              children: [_buildWithdraw(controller)],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTop() {
    return Container(
      decoration: BoxDecoration(
          gradient: const LinearGradient(
              begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
            Color.fromRGBO(4, 75, 154, 0.3),
            Color.fromRGBO(1, 26, 81, 0.3),
          ]),
          borderRadius: BorderRadius.circular(20.w)),
      margin: EdgeInsets.only(top: 30.w, left: 20.w, right: 20.w),
      child: Column(
        children: [
          Stack(children: [
            Container(
              width: double.infinity,
              height: 192.w,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/d-bg.webp"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("R\$0.06", style: TextStyle(
                          color: Colors.white, fontSize: 42.w, fontWeight: FontWeight.w700)),
                      SizedBox(height: 17.w),
                      Text("Fundos totais", style: TextStyle(color: Color.fromRGBO(255, 255, 255,
                          0.7), fontSize: 24.w)),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("R\$0.06", style: TextStyle(
                          color: Colors.white, fontSize: 42.w, fontWeight: FontWeight.w700)),
                      SizedBox(height: 17.w),
                      Text("Retirável Total", style: TextStyle(color: Color.fromRGBO(255, 255, 255,
                          0.7), fontSize: 24.w)),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                width: 200.w,
                height: 42.w,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/d-label.webp"),
                    fit: BoxFit.cover,
                  ),
                ),
                alignment: Alignment.center,
                child: Text("Total Da Conta", style: TextStyle(color: Colors.white, fontSize: 24.w),
                    textAlign: TextAlign.center),
              ),
            ),
          ]),
          Container(
            padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 4.w, bottom: 28.w),
            child: Row(
              children: [
                SizedBox(
                  width: 352.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 16.w),
                      Row(
                        children: [
                          Text("Depositar conta", style: TextStyle(color: Color.fromRGBO(
                              255, 255, 255, 0.3), fontSize: 24.w)),
                          SizedBox(width: 9.w),
                          Image.asset("assets/images/i-why.webp", width: 24.w),
                        ],
                      ),
                      SizedBox(height: 16.w),
                      Text("Balanço: 0.06", style: TextStyle(color: Colors.white, fontSize: 24.w)),
                      SizedBox(height: 16.w),
                      Text(
                          "Retirável: 0.06", style: TextStyle(color: Colors.white, fontSize: 24.w)),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16.w),
                    Row(
                      children: [
                        Text("Conta Promovida", style: TextStyle(color: Color.fromRGBO(255, 255,
                            255, 0.3), fontSize: 24.w)),
                        SizedBox(width: 9.w),
                        Image.asset("assets/images/i-why.webp", width: 24.w),
                      ],
                    ),
                    SizedBox(height: 16.w),
                    Text("Balanço: 0.00", style: TextStyle(color: Colors.white, fontSize: 24.w)),
                    SizedBox(height: 16.w),
                    Text("Retirável: 0.06", style: TextStyle(color: Colors.white, fontSize: 24.w)),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDeposit(DepositController controller) {
    return Container(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/text-bg.webp"),
                fit: BoxFit.cover,
              ),
            ),
            margin: EdgeInsets.only(bottom: 16.w, top: 36.w),
            padding: EdgeInsets.only(bottom: 10.w, left: 10.w, right: 10.w),
            child: Text(
                " Prezado usuário, quando o valor da primeira recarga for maior que 50 reais, você receberá no máximo 20% de recompensa de recarga, e quando o valor da recarga for maior que 50 reais, você receberá no máximo 10% de recompensa de recarga! 6 vezes ao dia, quanto maior o valor da recarga, maior a proporção de presentes!!",
                style: TextStyle(color: Color(0xffF7BA17), fontSize: 24.w, height: 1.5),
                textAlign: TextAlign.center),
          ),
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 72.w,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 24.w, right: 24.w),
                decoration: BoxDecoration(
                    border: Border.all(color: const Color.fromRGBO(255, 255, 255, 0.1), width: 1.w),
                    image: const DecorationImage(
                      image: AssetImage("assets/images/btn-bg-gray.webp"),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(8.w)),
                child: MyInputFiled(
                  bgColor: Colors.transparent,
                  width: double.infinity,
                  height: 72.w,
                  hint: '(50.00-9999999.00)',
                  editNode: controller.amountNode,
                ),
                // child: Text("201", style: TextStyle(color: Colors.white, fontSize: 28.w)),
              ),
              Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    alignment: Alignment.center,
                    width: 108.w,
                    height: 30.w,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/i-label-bg.webp"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Text('+20.00', style: TextStyle(color: Colors.white, fontSize: 24.w)),
                  ))
            ],
          ),
          Obx(() {
            return Text(controller.amountNode.text.value, style: TextStyle(color: Colors.white));
          }),
          SizedBox(height: 24.w),
          _buildAmountWrap(),
          Container(
              margin: EdgeInsets.only(top: 36.w, bottom: 16.w),
              alignment: Alignment.centerLeft,
              child: Text("Escolha o metodo de pagamento",
                  style: TextStyle(color: const Color(0xff0ED1F4), fontSize: 32.w))),
          Container(
            width: double.infinity,
            height: 72.w,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 24.w, right: 20.w),
            decoration: BoxDecoration(
                border: Border.all(color: const Color.fromRGBO(255, 255, 255, 0.1), width: 1.w),
                image: const DecorationImage(
                  image: AssetImage("assets/images/btn-bg-gray.webp"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(8.w)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Canal de pagamento rápido 1",
                    style: TextStyle(color: Colors.white, fontSize: 28.w)),
                Image(image: const AssetImage("assets/images/i-radio-active.webp"), width: 32.w),
              ],
            ),
          ),
          SizedBox(height: 40.w),
          AppButton(
            width: 580.w,
            height: 90.w,
            radius: 100.w,
            text: 'Depósito',
            onClick: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildAmountWrap() {
    return Wrap(
      alignment: WrapAlignment.start,
      runAlignment: WrapAlignment.start,
      spacing: 18.w,
      runSpacing: 18.w,
      children: [
        for (var i = 0; i < 10; i++)
          Stack(
            children: [
              CupertinoButton(
                onPressed: () {
                  controller.setAmountValue(i.toString());
                },
                padding: EdgeInsets.zero,
                child: Container(
                  width: 224.w,
                  height: 100.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color.fromRGBO(255, 255, 255, 0.1), width: 1.w),
                    borderRadius: BorderRadius.circular(8.w),
                    image: const DecorationImage(
                      // 激活样式图片背景改为btn-bg-active
                      image: AssetImage("assets/images/btn-bg-gray.webp"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Text("R\$ 50", style: TextStyle(color: Colors.white, fontSize: 28.w)),
                ),
              ),
              Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    alignment: Alignment.center,
                    width: 108.w,
                    height: 30.w,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/i-label-bg.webp"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Text('+20.00', style: TextStyle(color: Colors.white, fontSize: 24.w)),
                  )
              )
            ],
          ),
      ],
    );
  }

  Widget _buildWithdraw(DepositController controller) {
    return Container(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 36.w),
      child: Column(
        children: [
          Container(
              width: double.infinity,
              height: 72.w,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 24.w, right: 20.w),
              decoration: BoxDecoration(
                  border: Border.all(color: const Color.fromRGBO(255, 255, 255, 0.1), width: 1.w),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/btn-bg-gray.webp"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(8.w)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Valor da retirada", style: TextStyle(color: Colors.white, fontSize: 28.w)),
                  Text("Retirada mínima R\$0", style: TextStyle(
                      color: const Color.fromRGBO(255, 255, 255, 0.4), fontSize: 28.w)),
                ],
              )),
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/text-bg.webp"),
                fit: BoxFit.cover,
              ),
            ),
            margin: EdgeInsets.only(bottom: 24.w, top: 36.w),
            padding: EdgeInsets.only(bottom: 10.w, left: 10.w, right: 10.w),
            child: Text(
                " Uma conta só pode ser vinculada a um número de CPF para saque, uma vez vinculada não pode ser alterada.",
                style: TextStyle(color: Color(0xffF7BA17), fontSize: 24.w, height: 1.5),
                textAlign: TextAlign.center),
          ),
          Container(
              width: double.infinity,
              height: 72.w,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 24.w, right: 20.w),
              decoration: BoxDecoration(
                  border: Border.all(color: const Color.fromRGBO(255, 255, 255, 0.1), width: 1.w),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/btn-bg-gray.webp"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(8.w)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Nome do usuário:", style: TextStyle(color: Colors.white, fontSize: 28.w)),
                  Text("Insira o nome do titular do cartão", style: TextStyle(
                      color: const Color.fromRGBO(255, 255, 255, 0.4), fontSize: 26.w)),
                ],
              )),
          SizedBox(height: 34.w),
          Container(
              width: double.infinity,
              height: 72.w,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 24.w, right: 20.w),
              decoration: BoxDecoration(
                  border: Border.all(color: const Color.fromRGBO(255, 255, 255, 0.1), width: 1.w),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/btn-bg-gray.webp"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(8.w)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Código CPF:", style: TextStyle(color: Colors.white, fontSize: 28.w)),
                  Text("Insira o seu código CPF", style: TextStyle(
                      color: const Color.fromRGBO(255, 255, 255, 0.4), fontSize: 28.w)),
                ],
              )),
          SizedBox(height: 34.w),
          Container(
              width: double.infinity,
              height: 72.w,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 24.w, right: 20.w),
              decoration: BoxDecoration(
                  border: Border.all(color: const Color.fromRGBO(255, 255, 255, 0.1), width: 1.w),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/btn-bg-gray.webp"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(8.w)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Tipo Pix:", style: TextStyle(color: Colors.white, fontSize: 28.w)),
                  Row(
                    children: [
                      Text("CPF", style: TextStyle(
                          color: const Color.fromRGBO(255, 255, 255, 0.4), fontSize: 28.w)),
                      SizedBox(width: 19.w),
                      Image.asset("assets/images/i-arrow-white-down.webp", width: 16.w)
                    ],
                  )
                ],
              )),
          SizedBox(height: 34.w),
          Container(
              width: double.infinity,
              height: 72.w,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 24.w, right: 20.w),
              decoration: BoxDecoration(
                  border: Border.all(color: const Color.fromRGBO(255, 255, 255, 0.1), width: 1.w),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/btn-bg-gray.webp"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(8.w)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("CPF:", style: TextStyle(color: Colors.white, fontSize: 28.w)),
                  SizedBox(width: 10.w),
                  Text("CPF", style: TextStyle(
                      color: const Color.fromRGBO(255, 255, 255, 0.4), fontSize: 28.w)),
                ],
              )),
          SizedBox(height: 34.w),
          Container(
              margin: EdgeInsets.only(top: 36.w, bottom: 16.w),
              alignment: Alignment.centerLeft,
              child: Text("Escolha o metodo de pagamento",
                  style: TextStyle(color: const Color(0xff0ED1F4), fontSize: 32.w))),
          Container(
            width: double.infinity,
            height: 72.w,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 24.w, right: 20.w),
            decoration: BoxDecoration(
                border: Border.all(color: const Color.fromRGBO(255, 255, 255, 0.1), width: 1.w),
                image: const DecorationImage(
                  image: AssetImage("assets/images/btn-bg-gray.webp"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(8.w)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Canal de pagamento rápido 1",
                    style: TextStyle(color: Colors.white, fontSize: 28.w)),
                Image(image: const AssetImage("assets/images/i-radio-active.webp"), width: 32.w),
              ],
            ),
          ),
          SizedBox(height: 40.w),
          AppButton(
            width: 580.w,
            height: 90.w,
            radius: 100.w,
            text: 'Retirar',
            onClick: () {},
          ),
          SizedBox(height: 54.w),
          Text('Regras de retirada', style: TextStyle(
              color: Color(0xffF7BA17), fontSize: 32.w, fontWeight: FontWeight.bold)),
          SizedBox(height: 20.w),
          Text(
              '1. O valor e a frequência do saque diário estão diretamente relacionados ao seu nível VIP.',
              style: TextStyle(color: Colors.white, fontSize: 26.w)),
          SizedBox(height: 15.w),
          Text(
              '2. O valor da retirada deve ser em múltiplos de 10.Por exemplo: 10, 20, 80, 120, 990, 19820…',
              style: TextStyle(color: Colors.white, fontSize: 26.w)),
          SizedBox(height: 15.w),
          Text(' 3. As recompensas da promoção podem ser retiradas diretamente.',
              style: TextStyle(color: Colors.white, fontSize: 26.w)),
          SizedBox(height: 15.w),
          Text(
              '4. O saldo não retirável na conta de recarga (Atividade) (incluindo, entre outros, o valor da recarga, recompensas por participar de atividades e valor de ganhos e perdas do jogo, etc.).',
              style: TextStyle(color: Colors.white, fontSize: 26.w)),
          SizedBox(height: 85.w),
        ],
      ),
    );
  }
}
