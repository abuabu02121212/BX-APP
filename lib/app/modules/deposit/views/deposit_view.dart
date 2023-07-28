import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_comm/app/component/app_cupertino_button.dart';
import 'package:flutter_comm/app/component/app_tab.dart';
import 'package:flutter_comm/util/app_util.dart';
import 'package:flutter_comm/util/toast_util.dart';
import 'package:flutter_comm/widget/input_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../../util/bottom_sheet_util.dart';
import '../../../component/app_button.dart';
import '../../../component/app_header.dart';
import '../controllers/deposit_controller.dart';

class DepositView extends GetView<DepositController> {
  DepositView({Key? key, this.isShowBack = true}) : super(key: key);

  bool? isShowBack;

  @override
  final DepositController controller = Get.put(DepositController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 10, 29, 1),
      appBar: AppBar(
        titleSpacing: 0,
        leadingWidth: 0,
        elevation: 1.0,
        title: AppHeader(
          title: "Promoção",
          isNeedLeftBackArrow: isShowBack == true ? true : false,
        ),
      ),
      resizeToAvoidBottomInset: true,
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
              children: [
                Obx(() {
                  return controller.depositControllerPage.isFetching.isFalse
                      ? _buildDeposit(controller, context)
                      : const Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 50.0),
                            child: CupertinoActivityIndicator(
                              radius: 14.0,
                              color: Colors.white,
                            ),
                          ),
                        );
                }),
              ],
            ),
            ListView(
              children: [
                Obx(() {
                  return controller.withdrawControllerPage.isFetching.isFalse
                      ? _buildWithdraw(controller, context)
                      : const Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 50.0),
                            child: CupertinoActivityIndicator(
                              radius: 14.0,
                              color: Colors.white,
                            ),
                          ),
                        );
                })
              ],
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
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
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
                      Obx(() {
                        return Text(
                          AppUtil.amountFormat(controller.balanceDetailInfo.value?.brl ?? '0'),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 42.w,
                            fontWeight: FontWeight.w700,
                          ),
                        );
                      }),
                      SizedBox(height: 17.w),
                      Text(
                        "Fundos totais",
                        style: TextStyle(
                          color: const Color.fromRGBO(255, 255, 255, 0.7),
                          fontSize: 24.w,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(() {
                        return Text(
                          AppUtil.amountFormat(
                              controller.balanceDetailInfo.value?.brl_amount ?? '0'),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 42.w,
                            fontWeight: FontWeight.w700,
                          ),
                        );
                      }),
                      SizedBox(height: 17.w),
                      Text(
                        "Retirável Total",
                        style: TextStyle(
                          color: const Color.fromRGBO(255, 255, 255, 0.7),
                          fontSize: 24.w,
                        ),
                      ),
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
                child: Text(
                  "Total Da Conta",
                  style: TextStyle(color: Colors.white, fontSize: 24.w),
                  textAlign: TextAlign.center,
                ),
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
                          Text(
                            "Depositar conta",
                            style: TextStyle(
                              color: const Color.fromRGBO(255, 255, 255, 0.3),
                              fontSize: 24.w,
                            ),
                          ),
                          SizedBox(width: 9.w),
                          PopupMenuButton(
                            color: const Color.fromRGBO(247, 186, 33, 1),
                            elevation: 0.0,
                            padding: const EdgeInsets.all(0),
                            itemBuilder: (BuildContext context) {
                              return <PopupMenuEntry<String>>[
                                PopupMenuItem(
                                  enabled: false,
                                  padding: EdgeInsets.zero,
                                  value: 'A',
                                  child: Container(
                                    constraints: BoxConstraints(minWidth: 350.w),
                                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                                    child: Text(
                                      'Uma conta que consiste no valor da recarga, recompensas pela participação em atividades, vitórias e derrotas no jogo, etc.',
                                      style: TextStyle(
                                        fontSize: 24.w,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ),
                              ];
                            },
                            initialValue: 'B',
                            child: Image.asset("assets/images/i-why.webp", width: 24.w),
                            onSelected: (String value) {
                              Toast.show(value);
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 16.w),
                      Obx(() {
                        return Text(
                          "Balanço: ${AppUtil.amountFormat(controller.balanceDetailInfo.value?.deposit_amount ?? '0')}",
                          style: TextStyle(color: Colors.white, fontSize: 24.w),
                        );
                      }),
                      SizedBox(height: 16.w),
                      Obx(() {
                        return Text(
                          "Retirável: ${AppUtil.amountFormat(controller.balanceDetailInfo.value?.deposit_balance ?? '0')}",
                          style: TextStyle(color: Colors.white, fontSize: 24.w),
                        );
                      }),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16.w),
                    Row(
                      children: [
                        Text(
                          "Conta Promovida",
                          style: TextStyle(
                            color: const Color.fromRGBO(255, 255, 255, 0.3),
                            fontSize: 24.w,
                          ),
                        ),
                        SizedBox(width: 9.w),
                        PopupMenuButton(
                          color: const Color.fromRGBO(247, 186, 33, 1),
                          elevation: 0.0,
                          padding: const EdgeInsets.all(0),
                          itemBuilder: (BuildContext context) {
                            return <PopupMenuEntry<String>>[
                              PopupMenuItem(
                                enabled: false,
                                padding: EdgeInsets.zero,
                                value: 'A',
                                child: Container(
                                  constraints: BoxConstraints(minWidth: 350.w),
                                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                                  child: Text(
                                    'Uma conta composta por recompensas por convidar amigos e retorno de comissões com base no valor da transação dos usuários convidados.',
                                    style: TextStyle(
                                      fontSize: 24.w,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ),
                            ];
                          },
                          initialValue: 'B',
                          child: Image.asset("assets/images/i-why.webp", width: 24.w),
                          onSelected: (String value) {
                            Toast.show(value);
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 16.w),
                    Obx(() {
                      return Text(
                        "Balanço: ${AppUtil.amountFormat(controller.balanceDetailInfo.value?.agencyAmount ?? '0')}",
                        style: TextStyle(color: Colors.white, fontSize: 24.w),
                      );
                    }),
                    SizedBox(height: 16.w),
                    Obx(() {
                      return Text(
                        "Retirável: ${AppUtil.amountFormat(controller.balanceDetailInfo.value?.agency_balance ?? '0')}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.w,
                        ),
                      );
                    })
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDeposit(DepositController controller, BuildContext context) {
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
              "Prezado usuário, quando o valor da primeira recarga for maior que 50 reais, você receberá no máximo 20% de recompensa de recarga, e quando o valor da recarga for maior que 50 reais, você receberá no máximo 10% de recompensa de recarga! 6 vezes ao dia, quanto maior o valor da recarga, maior a proporção de presentes!!",
              style: TextStyle(color: Color(0xffF7BA17), fontSize: 24.w, height: 1.5),
              textAlign: TextAlign.center,
            ),
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
                  borderRadius: BorderRadius.circular(8.w),
                ),
                child: Obx(() {
                  return MyInputFiled(
                    bgColor: Colors.transparent,
                    width: double.infinity,
                    height: 72.w,
                    hint: controller.depositControllerPage.getDepositInputPlaceholder(),
                    editNode: controller.depositControllerPage.amountNode,
                  );
                }),
              ),
              Obx(() {
                return Visibility(
                  visible: controller.depositControllerPage.isAmountInDepositData(),
                  child: Positioned(
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
                      child: Obx(() {
                        return Text(
                          controller.depositControllerPage.getDepositDiscountValue(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.w,
                          ),
                        );
                      }),
                    ),
                  ),
                );
              })
            ],
          ),
          Obx(() {
            return controller.depositControllerPage.isClickSubmit.isTrue
                ? VerifyError(
                    error: controller.depositControllerPage.validateAmount() ?? '',
                    mainAxis: MainAxisAlignment.start,
                  )
                : SizedBox(height: 30.w);
          }),
          _buildAmountWrap(controller),
          Container(
            margin: EdgeInsets.only(top: 36.w, bottom: 16.w),
            alignment: Alignment.centerLeft,
            child: Text(
              "Escolha o metodo de pagamento",
              style: TextStyle(color: const Color(0xff0ED1F4), fontSize: 32.w),
            ),
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
              borderRadius: BorderRadius.circular(8.w),
            ),
            child: AppCupertinoButton(
              onPressed: () {
                BottomSheetUtil.showBottomSheet(
                  context,
                  selectData: controller.depositControllerPage.depositSelectLabel.value,
                  data: controller.depositControllerPage.depositSelectData,
                  ok: (String value, String label) {
                    controller.depositControllerPage.setDepositSelectLabelValue(value, label);
                  },
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(() {
                    return Text(
                      controller.depositControllerPage.depositSelectLabel.value,
                      style: TextStyle(color: Colors.white, fontSize: 28.w),
                    );
                  }),
                  Image(image: const AssetImage("assets/images/i-radio-active.webp"), width: 32.w),
                ],
              ),
            ),
          ),
          SizedBox(height: 40.w),
          AppButton(
            width: 580.w,
            height: 90.w,
            radius: 100.w,
            text: 'Depósito',
            onClick: () {
              controller.depositControllerPage.submit();
            },
          ),
          SizedBox(height: 150.w),
        ],
      ),
    );
  }

  Widget _buildAmountWrap(DepositController controller) {
    return Obx(() {
      return Wrap(
        alignment: WrapAlignment.start,
        runAlignment: WrapAlignment.start,
        spacing: 18.w,
        runSpacing: 18.w,
        children: [
          for (var i = 0; i < controller.depositControllerPage.depositData.length; i++)
            Stack(
              children: [
                CupertinoButton(
                  onPressed: () {
                    controller.depositControllerPage.setInputValue(
                      controller.depositControllerPage.depositData[i]['amount'] as String,
                      controller.depositControllerPage.depositData[i]['discount'] as String,
                    );
                  },
                  padding: EdgeInsets.zero,
                  child: Obx(() {
                    return Container(
                      width: 224.w,
                      height: 100.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: const Color.fromRGBO(255, 255, 255, 0.1), width: 1.w),
                        borderRadius: BorderRadius.circular(8.w),
                        image: DecorationImage(
                          // 激活样式图片背景改为btn-bg-active
                          image: AssetImage(
                            controller.depositControllerPage.isSelectAmount(
                              controller.depositControllerPage.depositData[i]['amount']!,
                            )
                                ? "assets/images/btn-bg-active.webp"
                                : "assets/images/btn-bg-gray.webp",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Text(
                        "R\$ ${controller.depositControllerPage.depositData[i]['amount']}",
                        style: TextStyle(color: Colors.white, fontSize: 28.w),
                      ),
                    );
                  }),
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
                    child: Text(
                      "${controller.depositControllerPage.depositData[i]['discount']}",
                      style: TextStyle(color: Colors.white, fontSize: 24.w),
                    ),
                  ),
                )
              ],
            ),
        ],
      );
    });
  }

  Widget _buildWithdraw(DepositController controller, BuildContext context) {
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
              borderRadius: BorderRadius.circular(8.w),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Valor da retirada",
                  style: TextStyle(color: Colors.white, fontSize: 28.w),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Obx(() {
                        return Visibility(
                          visible: controller.withdrawControllerPage.minAmountNode.text.isEmpty,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "Retirada mínima R\$ ${controller.withdrawControllerPage.pageData.config?.fmin ?? ''}",
                              style: TextStyle(
                                color: const Color.fromRGBO(255, 255, 255, 0.4),
                                fontSize: 28.w,
                              ),
                            ),
                          ),
                        );
                      }),
                      MyInputFiled(
                        bgColor: Colors.transparent,
                        keyboardType: TextInputType.number,
                        width: double.infinity,
                        textDirection: TextDirection.rtl,
                        height: 72.w,
                        hint: '',
                        onTextChanged: (String value) {
                          print('vvv $value');
                        },
                        editNode: controller.withdrawControllerPage.minAmountNode,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Obx(() {
            return controller.withdrawControllerPage.isClickSubmit.isTrue
                ? VerifyError(error: controller.withdrawControllerPage.validateMinAmount() ?? '')
                : SizedBox(height: 34.w);
          }),
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/text-bg.webp"),
                fit: BoxFit.cover,
              ),
            ),
            margin: EdgeInsets.only(bottom: 24.w),
            padding: EdgeInsets.only(bottom: 10.w, left: 10.w, right: 10.w),
            child: Text(
              " Uma conta só pode ser vinculada a um número de CPF para saque, uma vez vinculada não pode ser alterada.",
              style: TextStyle(color: const Color(0xffF7BA17), fontSize: 24.w, height: 1.5),
              textAlign: TextAlign.center,
            ),
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
              borderRadius: BorderRadius.circular(8.w),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Nome do usuário:", style: TextStyle(color: Colors.white, fontSize: 28.w)),
                Expanded(
                  child: Stack(
                    children: [
                      Obx(() {
                        return Visibility(
                          visible: controller.withdrawControllerPage.usernameNode.text.isEmpty,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "Insira o nome do titular do cartão",
                              style: TextStyle(
                                color: const Color.fromRGBO(255, 255, 255, 0.4),
                                fontSize: 28.w,
                              ),
                            ),
                          ),
                        );
                      }),
                      MyInputFiled(
                        bgColor: Colors.transparent,
                        width: double.infinity,
                        textDirection: TextDirection.rtl,
                        height: 72.w,
                        hint: '',
                        editNode: controller.withdrawControllerPage.usernameNode,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Obx(() {
            return controller.withdrawControllerPage.isClickSubmit.isTrue
                ? VerifyError(error: controller.withdrawControllerPage.validateUsername() ?? '')
                : SizedBox(height: 34.w);
          }),
          Container(
            width: double.infinity,
            height: 72.w,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 24.w),
            decoration: BoxDecoration(
              border: Border.all(color: const Color.fromRGBO(255, 255, 255, 0.1), width: 1.w),
              image: const DecorationImage(
                image: AssetImage("assets/images/btn-bg-gray.webp"),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(8.w),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Código CPF:",
                  style: TextStyle(color: Colors.white, fontSize: 28.w),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Obx(() {
                        return Visibility(
                          visible: controller.withdrawControllerPage.idNode.text.isEmpty,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "Insira o seu código CPF",
                              style: TextStyle(
                                color: const Color.fromRGBO(255, 255, 255, 0.4),
                                fontSize: 28.w,
                              ),
                            ),
                          ),
                        );
                      }),
                      MyInputFiled(
                        bgColor: Colors.transparent,
                        width: double.infinity,
                        keyboardType: TextInputType.number,
                        textDirection: TextDirection.rtl,
                        height: 72.w,
                        hint: '',
                        editNode: controller.withdrawControllerPage.idNode,
                      ),
                    ],
                  ),
                ),
                AppCupertinoButton(
                  child: Padding(
                    padding: EdgeInsets.all(20.w),
                    child: Image.asset("assets/images/i-arrow-white-down.webp", width: 16.w),
                  ),
                  onPressed: () {
                    BottomSheetUtil.showBottomSheet(
                      context,
                      data: controller.withdrawControllerPage.withdrawSelectData,
                      ok: (String value, String label) {
                        controller.withdrawControllerPage.idNode.editController.text = value;
                        controller.withdrawControllerPage.idNode.editController.selection =
                            TextSelection.fromPosition(
                          TextPosition(
                              offset: controller
                                  .withdrawControllerPage.idNode.editController.text.length),
                        );
                      },
                    );
                  },
                )
              ],
            ),
          ),
          Obx(() {
            return controller.withdrawControllerPage.isClickSubmit.isTrue
                ? VerifyError(error: controller.withdrawControllerPage.validateId() ?? '')
                : SizedBox(height: 34.w);
          }),
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
                borderRadius: BorderRadius.circular(8.w),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Tipo Pix:", style: TextStyle(color: Colors.white, fontSize: 28.w)),
                  Expanded(
                    child: AppCupertinoButton(
                      onPressed: () {
                        BottomSheetUtil.showBottomSheet(
                          context,
                          selectData: controller.withdrawControllerPage.waysSelectLabel.value,
                          data: controller.withdrawControllerPage.ways,
                          ok: (String value, String label) {
                            controller.withdrawControllerPage.setWaysData(label, value);
                          },
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Obx(() {
                            return Text(
                              controller.withdrawControllerPage.waysSelectLabel.value,
                              style: TextStyle(
                                  color: const Color.fromRGBO(255, 255, 255, 1), fontSize: 28.w),
                            );
                          }),
                          SizedBox(width: 19.w),
                          Image.asset("assets/images/i-arrow-white-down.webp", width: 16.w)
                        ],
                      ),
                    ),
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
                borderRadius: BorderRadius.circular(8.w),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(() {
                    return Text(
                      controller.withdrawControllerPage.waysSelectLabel.value,
                      style: TextStyle(color: Colors.white, fontSize: 28.w),
                    );
                  }),
                  SizedBox(width: 10.w),
                  Expanded(
                      child: Stack(
                    children: [
                      Obx(() {
                        return Visibility(
                          visible: controller.withdrawControllerPage.accountNode.text.isEmpty,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Obx(
                              () {
                                return Text(
                                  controller.withdrawControllerPage.waysSelectLabel.value,
                                  style: TextStyle(
                                      color: const Color.fromRGBO(255, 255, 255, 0.4),
                                      fontSize: 28.w),
                                );
                              },
                            ),
                          ),
                        );
                      }),
                      Obx(() {
                        return MyInputFiled(
                          bgColor: Colors.transparent,
                          width: double.infinity,
                          keyboardType:
                              controller.withdrawControllerPage.waysSelectValue.value == '2'
                                  ? TextInputType.text
                                  : TextInputType.number,
                          textDirection: TextDirection.rtl,
                          height: 72.w,
                          hint: '',
                          editNode: controller.withdrawControllerPage.accountNode,
                        );
                      }),
                    ],
                  )),
                ],
              )),
          Obx(() {
            return controller.withdrawControllerPage.isClickSubmit.isTrue
                ? VerifyError(error: controller.withdrawControllerPage.validateAccount() ?? '')
                : SizedBox(height: 34.w);
          }),
          Container(
            margin: EdgeInsets.only(top: 36.w, bottom: 16.w),
            alignment: Alignment.centerLeft,
            child: Text(
              "Escolha o metodo de pagamento",
              style: TextStyle(color: const Color(0xff0ED1F4), fontSize: 32.w),
            ),
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
              borderRadius: BorderRadius.circular(8.w),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Canal de pagamento rápido 1",
                  style: TextStyle(color: Colors.white, fontSize: 28.w),
                ),
                Image(image: const AssetImage("assets/images/i-radio-active.webp"), width: 32.w),
              ],
            ),
          ),
          SizedBox(height: 40.w),
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
              borderRadius: BorderRadius.circular(8.w),
            ),
            child: Obx(() {
              return MyInputFiled(
                bgColor: Colors.transparent,
                width: double.infinity,
                height: 72.w,
                hint: 'Digite a senha do fundo111',
                keyboardType: TextInputType.number,
                editNode: controller.withdrawControllerPage.payPasswordNode,
                obscureText: controller.withdrawControllerPage.payPasswordObscureText.value,
                suffix: GestureDetector(
                  onTap: () {
                    controller.withdrawControllerPage.payPasswordObscureText.value =
                        !controller.withdrawControllerPage.payPasswordObscureText.value;
                  },
                  child: Image.asset(
                    !controller.withdrawControllerPage.payPasswordObscureText.value
                        ? "assets/images/eye-open.webp"
                        : "assets/images/eye-close.webp",
                    width: 28.w,
                  ),
                ),
              );
            }),
          ),
          Obx(() {
            return controller.withdrawControllerPage.isClickSubmit.isTrue
                ? VerifyError(error: controller.withdrawControllerPage.validatePayPassword() ?? '')
                : SizedBox(height: 34.w);
          }),
          AppButton(
            width: 580.w,
            height: 90.w,
            radius: 100.w,
            text: 'Retirar',
            onClick: () {
              controller.withdrawControllerPage.submit();
            },
          ),
          SizedBox(height: 54.w),
          Text(
            'Regras de retirada',
            style: TextStyle(
                color: const Color(0xffF7BA17), fontSize: 32.w, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20.w),
          Text(
            '1. O valor e a frequência do saque diário estão diretamente relacionados ao seu nível VIP.',
            style: TextStyle(color: Colors.white, fontSize: 26.w),
          ),
          SizedBox(height: 15.w),
          Text(
            '2. O valor da retirada deve ser em múltiplos de 10.Por exemplo: 10, 20, 80, 120, 990, 19820…',
            style: TextStyle(color: Colors.white, fontSize: 26.w),
          ),
          SizedBox(height: 15.w),
          Text(
            ' 3. As recompensas da promoção podem ser retiradas diretamente.',
            style: TextStyle(color: Colors.white, fontSize: 26.w),
          ),
          SizedBox(height: 15.w),
          Text(
            '4. O saldo não retirável na conta de recarga (Atividade) (incluindo, entre outros, o valor da recarga, recompensas por participar de atividades e valor de ganhos e perdas do jogo, etc.).',
            style: TextStyle(color: Colors.white, fontSize: 26.w),
          ),
          SizedBox(height: 85.w),
        ],
      ),
    );
  }
}

class VerifyError extends StatelessWidget {
  const VerifyError({Key? key, required this.error, this.mainAxis}) : super(key: key);
  final String error;
  final MainAxisAlignment? mainAxis;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxis ?? MainAxisAlignment.end,
      children: [
        Container(
          height: 44.w,
          padding: EdgeInsets.only(right: 20.w),
          child: Center(
            child: Text(
              error,
              style: TextStyle(
                color: const Color.fromRGBO(255, 105, 13, 1),
                fontSize: 22.w,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ),
      ],
    );
  }
}
