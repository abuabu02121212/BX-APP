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
import '../../../app_style.dart';
import '../../../component/app_button.dart';
import '../../../component/app_header.dart';
import '../../../routes/app_pages.dart';
import '../controllers/deposit_controller.dart';

/// 存款背景
LinearGradient depositBg = const LinearGradient(
  colors: [Color(0xFF011A51), Color(0xFF011A51)],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

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
        backgroundColor: headerBgColor,
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
                          AppUtil.amountFormat(
                            controller.balanceDetailInfo.value?.brl ?? '0',
                          ),
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
                              controller.balanceDetailInfo.value?.brl_amount ??
                                  '0'),
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
            padding: EdgeInsets.only(
                left: 20.w, right: 20.w, top: 4.w, bottom: 28.w),
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
                                    constraints:
                                        BoxConstraints(minWidth: 350.w),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20.w),
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
                            child: Image.asset("assets/images/i-why.webp",
                                width: 24.w),
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
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
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
                          child: Image.asset("assets/images/i-why.webp",
                              width: 24.w),
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

  /// 提款UI
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
              controller.depositControllerPage.depositTip.value,
              style: TextStyle(
                color: const Color(0xffF7BA17),
                fontSize: 24.w,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          _buildPayType(controller),
          SizedBox(height: 14.w),
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 72.w,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 24.w, right: 24.w),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromRGBO(255, 255, 255, 0.1),
                      width: 1.w),
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
                    hint: controller.depositControllerPage
                        .getDepositInputPlaceholder(),
                    editNode: controller.depositControllerPage.amountNode,
                  );
                }),
              ),
              Obx(() {
                return Visibility(
                  visible: controller.depositControllerPage
                          .getDepositDiscountValue() >
                      0,
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
                          controller.depositControllerPage
                              .getDepositDiscountValue()
                              .toString(),
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
                    error:
                        controller.depositControllerPage.validateAmount() ?? '',
                    mainAxis: MainAxisAlignment.start,
                  )
                : SizedBox(height: 30.w);
          }),
          _buildAmountWrap(controller),
          _buildDiscount(controller),
          Visibility(
            visible: controller.depositControllerPage.payRate.value > 0,
            child: Column(
              children: [
                SizedBox(height: 36.w),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    'Bônus de depósito',
                    style: TextStyle(color: Colors.white, fontSize: 28.w),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(height: 10.w),
                SizedBox(
                  width: double.infinity,
                  child: RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      text:
                          'Taxa de cambio de referencia 1 USDT=${controller.depositControllerPage.payRate.value.toString()}BRL\nIr para Minhas chavesR',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.6),
                        fontSize: 24.w,
                        height: 1.5,
                      ),
                      children: [
                        TextSpan(
                          text: '\n${AppUtil.amountFormat(
                            controller.balanceDetailInfo.value?.brl ?? '0',
                          )}',
                          style: TextStyle(
                            color: const Color(0xff0ED1F4),
                            fontSize: 28.w,
                            height: 1.5,
                            fontWeight: FontWeight.bold,
                          ),
                          children: [
                            TextSpan(
                              text: 'em sua conta particular',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.6),
                                fontSize: 24.w,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
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

  Widget _buildPayType(DepositController controller) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 30.w, bottom: 16.w),
          alignment: Alignment.centerLeft,
          child: Text(
            "Escolha o metodo de pagamento",
            style: TextStyle(color: const Color(0xff0ED1F4), fontSize: 32.w),
          ),
        ),
        ...List.generate(
          controller.depositControllerPage.depositSelectData.length,
          (index) => Padding(
            padding: EdgeInsets.only(bottom: 16.w),
            child: AppCupertinoButton(
              onPressed: () {
                controller.depositControllerPage.setDepositSelectLabelValue(
                  controller.depositControllerPage.depositSelectData[index]
                          ['value'] ??
                      '',
                  controller.depositControllerPage.depositSelectData[index]
                          ['label'] ??
                      '',
                );
              },
              child: Container(
                width: double.infinity,
                height: 88.w,
                padding: EdgeInsets.only(left: 24.w, right: 24.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.w),
                  border: Border.all(
                    color: const Color.fromRGBO(255, 255, 255, 0.2),
                    width: 1.w,
                  ),
                  gradient: depositBg,
                ),
                child: Row(
                  children: [
                    _buildRadio(controller.depositControllerPage
                            .depositSelectData[index]['label'] ==
                        controller
                            .depositControllerPage.depositSelectLabel.value),
                    SizedBox(width: 20.w),
                    Text(
                      controller.depositControllerPage.depositSelectData[index]
                          ['label'] as String,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.w,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  /// 单选框
  Widget _buildRadio(bool isSelect) {
    return Container(
      width: 32.w,
      height: 32.w,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromRGBO(185, 185, 185, 1),
          width: 1.w,
        ),
        borderRadius: BorderRadius.circular(16.w),
        image: isSelect
            ? const DecorationImage(
                image: AssetImage(
                  "assets/images/i-radio-active.webp",
                ),
                fit: BoxFit.cover,
              )
            : null,
      ),
    );
  }

  /// 存款优惠选择
  Widget _buildDiscount(DepositController controller) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 30.w, bottom: 16.w),
          alignment: Alignment.centerLeft,
          child: Text(
            "Atividade",
            style: TextStyle(color: const Color(0xff0ED1F4), fontSize: 32.w),
          ),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.only(left: 24.w, right: 24.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.w),
            border: Border.all(
              color: const Color.fromRGBO(255, 255, 255, 0.1),
              width: 1.w,
            ),
            gradient: depositBg,
          ),
          child: Obx(() {
            return Column(
              children: controller.depositControllerPage.configList.isNotEmpty ? List.generate(
                controller.depositControllerPage.getDepositAtividade().length,
                (index) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 27.w),
                  child: AppCupertinoButton(
                    onPressed: () {
                      controller.depositControllerPage.setAtividadeValue(
                        controller.depositControllerPage
                            .getDepositAtividade()[index]['value']!,
                      );
                    },
                    child: Row(
                      children: [
                        _buildRadio(
                          controller.depositControllerPage
                                  .getDepositAtividade()[index]['value'] ==
                              controller.depositControllerPage
                                  .depositAtividadeValue.value,
                        ),
                        SizedBox(width: 20.w),
                        Text(
                          controller.depositControllerPage
                              .getDepositAtividade()[index]['label'] as String,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28.w,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ) : [],
            );
          }),
        )
      ],
    );
  }

  /// 存款金额列表
  Widget _buildAmountWrap(DepositController controller) {
    return Obx(() {
      return Wrap(
        alignment: WrapAlignment.start,
        runAlignment: WrapAlignment.start,
        spacing: 11.w,
        runSpacing: 11.w,
        children: [
          for (var i = 0;
              i < controller.depositControllerPage.depositData.length;
              i++)
            Stack(
              children: [
                AppCupertinoButton(
                  onPressed: () {
                    controller.depositControllerPage.setInputValue(
                      controller.depositControllerPage.depositData[i]['amount']
                          as String,
                      controller.depositControllerPage.depositData[i]
                          ['discount'] as String,
                    );
                  },
                  child: Obx(() {
                    return Container(
                      width: 168.w,
                      height: 74.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromRGBO(255, 255, 255, 0.1),
                          width: 1.w,
                        ),
                        borderRadius: BorderRadius.circular(8.w),
                        image: DecorationImage(
                          // 激活样式图片背景改为btn-bg-active
                          image: AssetImage(
                            controller.depositControllerPage.isSelectAmount(
                              controller.depositControllerPage.depositData[i]
                                  ['amount']!,
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
                Visibility(
                  visible: controller.depositControllerPage.depositData[i]
                          ['discount']!.isNotEmpty,
                  child: Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      alignment: Alignment.center,
                      width: 67.w,
                      height: 22.w,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/i-label-bg.webp"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Text(
                        "+${controller.depositControllerPage.depositData[i]['discount']}",
                        style: TextStyle(color: Colors.white, fontSize: 18.w),
                      ),
                    ),
                  ),
                )
              ],
            ),
        ],
      );
    });
  }

  /// 银行卡列表，如果没有银行卡，显示添加银行卡按钮
  Widget _buildWithdrawBankList(DepositController controller) {
    int bankListLength = controller.withdrawControllerPage.bankList.length;
    if (bankListLength == 0) {
      return Row(
        children: [
          Expanded(
            child: Text(
              'Cartão bancário não consolidado',
              style: TextStyle(
                color: Color.fromRGBO(14, 209, 244, 1),
                fontSize: 32.w,
              ),
            ),
          ),
          AppButton(
            width: 132.w,
            height: 48.w,
            text: 'ligar',
            onClick: () {
              Get.toNamed(Routes.CENTER_BANK_LIST_ADD)?.then((value) {
                if (controller.withdrawControllerPage.bankList.isEmpty) {
                  controller.withdrawControllerPage.getBankList();
                }
              });
            },
            radius: 100.w,
          )
        ],
      );
    }
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 16.w),
          alignment: Alignment.centerLeft,
          child: Text(
            "Escolha o metodo de pagamento",
            style: TextStyle(color: const Color(0xff0ED1F4), fontSize: 32.w),
          ),
        ),
        ...List.generate(
          controller.withdrawControllerPage.bankList.length,
          (index) => Padding(
            padding: EdgeInsets.only(bottom: 16.w),
            child: AppCupertinoButton(
              onPressed: () {
                controller.withdrawControllerPage.setBankId(
                  controller.withdrawControllerPage.bankList[index].id!,
                );
              },
              child: Container(
                width: double.infinity,
                height: 88.w,
                padding: EdgeInsets.only(left: 24.w, right: 24.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.w),
                  border: Border.all(
                    color: const Color.fromRGBO(255, 255, 255, 0.2),
                    width: 1.w,
                  ),
                  gradient: depositBg,
                ),
                child: Row(
                  children: [
                    _buildRadio(
                      controller.withdrawControllerPage.bankList[index].id ==
                          controller.withdrawControllerPage.selectBankId.value,
                    ),
                    SizedBox(width: 20.w),
                    Text(
                      controller.withdrawControllerPage.bankList[index].pixId ??
                          '',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.6),
                        fontSize: 28.w,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  /// 提款UI
  Widget _buildWithdraw(DepositController controller, BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 36.w),
      child: Column(
        children: [
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
              style: TextStyle(
                  color: const Color(0xffF7BA17), fontSize: 24.w, height: 1.5),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            width: double.infinity,
            height: 72.w,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 6.w, right: 20.w),
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color.fromRGBO(255, 255, 255, 0.1),
                width: 1.w,
              ),
              image: const DecorationImage(
                image: AssetImage("assets/images/btn-bg-gray.webp"),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(8.w),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: MyInputFiled(
                    bgColor: Colors.transparent,
                    keyboardType: TextInputType.number,
                    width: double.infinity,
                    height: 72.w,
                    hint:
                        "Retirada mínima R\$ ${controller.withdrawControllerPage.pageData.config?.fmin ?? ''}",
                    onTextChanged: (String value) {
                      print('vvv $value');
                    },
                    editNode: controller.withdrawControllerPage.minAmountNode,
                  ),
                ),
                Text(
                  "Valor da retirada",
                  style: TextStyle(color: Colors.white, fontSize: 28.w),
                ),
              ],
            ),
          ),
          Obx(() {
            return controller.withdrawControllerPage.isClickSubmit.isTrue
                ? VerifyError(
                    error:
                        controller.withdrawControllerPage.validateMinAmount() ??
                            '')
                : SizedBox(height: 34.w);
          }),
          Obx(() {
            return _buildWithdrawBankList(controller);
          }),
          SizedBox(
            height: 30.w,
          ),
          Container(
            width: double.infinity,
            height: 72.w,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 6.w, right: 20.w),
            decoration: BoxDecoration(
              border: Border.all(
                  color: const Color.fromRGBO(255, 255, 255, 0.1), width: 1.w),
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
                hint: 'Digite a senha do fundo',
                keyboardType: TextInputType.number,
                editNode: controller.withdrawControllerPage.payPasswordNode,
                obscureText: controller
                    .withdrawControllerPage.payPasswordObscureText.value,
                suffix: GestureDetector(
                  onTap: () {
                    controller.withdrawControllerPage.payPasswordObscureText
                            .value =
                        !controller.withdrawControllerPage
                            .payPasswordObscureText.value;
                  },
                  child: Image.asset(
                    !controller
                            .withdrawControllerPage.payPasswordObscureText.value
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
                ? VerifyError(
                    error: controller.withdrawControllerPage
                            .validatePayPassword() ??
                        '')
                : SizedBox(height: 34.w);
          }),
          Obx(() {
            return AppButton(
              width: 580.w,
              height: 90.w,
              radius: 100.w,
              disable: controller.withdrawControllerPage.bankList.isEmpty,
              text: 'Retirar',
              onClick: () {
                controller.withdrawControllerPage.submit();
              },
            );
          }),
          SizedBox(height: 54.w),
          Text(
            'Regras de retirada',
            style: TextStyle(
                color: const Color(0xffF7BA17),
                fontSize: 32.w,
                fontWeight: FontWeight.bold),
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
  const VerifyError({Key? key, required this.error, this.mainAxis})
      : super(key: key);
  final String error;
  final MainAxisAlignment? mainAxis;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxis ?? MainAxisAlignment.start,
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
