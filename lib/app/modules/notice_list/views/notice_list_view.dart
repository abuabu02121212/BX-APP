import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_comm/app/component/app_cupertino_button.dart';
import 'package:flutter_comm/app/entity/message_list_data.dart';
import 'package:flutter_comm/http/request.dart';
import 'package:flutter_comm/util/app_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../app_style.dart';
import '../../../component/app_header.dart';
import '../../../component/app_list.dart';
import '../../../component/app_tab.dart';
import '../controllers/notice_list_controller.dart';

class NoticeListView extends GetView<NoticeListController> {
  const NoticeListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leadingWidth: 0,
        backgroundColor: headerBgColor,
        title: const AppHeader(title: "Centro de Notificação"),
      ),
      backgroundColor: const Color.fromRGBO(0, 10, 29, 1),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(1, 26, 81, 0.0),
                    Color(0xFF011A51),
                  ],
                  stops: [0.3594, 1.0],
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, -1),
                    blurRadius: 0,
                    spreadRadius: 0,
                    color: Color.fromRGBO(255, 255, 255, 0.10),
                  ),
                  BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 5,
                    spreadRadius: 0,
                    color: Color.fromRGBO(0, 0, 0, 0.30),
                  ),
                ],
              ),
              child: AppTab(
                controller: controller.tabController,
                tabs: const [
                  {'label': 'Todas', 'value': ''},
                  {'label': 'Nao Lido', 'value': '0'}
                ],
                onTap: (int index, String value) {
                  controller.setIsRead(value);
                },
                height: 100.w,
              ),
            ),
            Flexible(
              child: Container(
                width: 710.w,
                margin: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 30.w),
                child: Obx(() {
                  return AppList(
                    getList: apiRequest.requestMessageList,
                    params: {'is_read': controller.is_read.value},
                    builder: (dynamic el, int index) {
                      MessageListD item = MessageListD.fromJson(el);
                      return BuildItem(item: item);
                    },
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BuildItem extends StatefulWidget {
  const BuildItem({Key? key, required this.item}) : super(key: key);

  final MessageListD item;

  @override
  State<BuildItem> createState() => _BuildItemState();
}

class _BuildItemState extends State<BuildItem> {

  late MessageListD item;
  NoticeListController get controller => Get.find();

  clickHan() {
    if (item.id != null) {
      controller.readNotice(item.id!);
    }
    setState(() {
      item.isExpand = !item.isExpand;
      item.isRead = 1;
    });
  }

  @override
  void initState() {
    super.initState();
    item = widget.item;
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(item.id),
      background: Container(
        padding: EdgeInsets.only(top: 30.w),
        child: Container(
          color: Colors.red,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.only(right: 30.w),
                child: Text(
                  'Excluir',
                  style: TextStyle(color: Colors.white, fontSize: 28.w),
                ),
              )
            ],
          ),
        ),
      ),
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart) {
          controller.deleteNotice(item.id!);
        }
      },
      child: Container(
        margin: EdgeInsets.only(top: 30.w),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(4, 75, 154, 0.7),
              Color(0xFF011A51),
            ],
          ),
          borderRadius: BorderRadius.circular(20.w),
          border: Border.all(color: const Color.fromRGBO(14, 209, 244, 0.25), width: 1.w),
        ),
        child: Container(
          padding: EdgeInsets.only(left: 25.w, right: 25.w, bottom: 22.w),
          child: Column(
            children: [
              AppCupertinoButton(
                child: Column(
                  children: [
                    SizedBox(height: 20.w),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                constraints: BoxConstraints(maxWidth: 515.w),
                                child: Text(
                                  "${item.title ?? '-'} ${item.isExpand.toString()}",
                                  style: TextStyle(color: Colors.white, fontSize: 28.w),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(width: 10.w),
                              // 红色未读
                              Visibility(
                                visible: item.isRead == 0,
                                child: Image(
                                  image: const AssetImage('assets/images/i-red.webp'),
                                  width: 18.w,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // 展开更多
                        Container(
                          margin: EdgeInsets.only(left: 23.w),
                          child: CupertinoButton(
                            padding: EdgeInsets.zero,
                            minSize: 0,
                            child: Image(
                              image: AssetImage('assets/images/i-arrow-white-down.webp'),
                              width: 26.w,
                            ),
                            onPressed: () {},
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10.w),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppUtil.timestamp2Date('${item.sendAt ?? ''}'),
                        style: TextStyle(color: Colors.white, fontSize: 24.w),
                      ),
                    ),
                  ],
                ),
                onPressed: () {
                  clickHan();
                },
              ),
              // 展开内容
              Visibility(
                visible: item.isExpand,
                child: Container(
                  margin: EdgeInsets.only(top: 17.w),
                  padding: EdgeInsets.only(top: 13.w),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: const Color.fromRGBO(255, 255, 255, 0.25),
                        width: 1.w,
                      ),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start, // 主轴对齐方式调整
                    crossAxisAlignment: CrossAxisAlignment.start, // 交叉轴对齐方式调整
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(bottom: 0),
                        child: Text(
                          item.content ?? '-',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28.w,
                            height: 1.3,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
