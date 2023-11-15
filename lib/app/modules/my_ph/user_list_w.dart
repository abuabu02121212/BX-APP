import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_comm/util/size.dart';
import 'item_bean.dart';
import 'item_v.dart';

///用启功能通用组件（列表）
class UserListW extends StatelessWidget {
  List<ItemBean>? list;
  var type;

  UserListW({
    Key? key,
    this.list,
    this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: (100 * list!.length).px,
      margin: EdgeInsets.only(
          left: 30.px, right: 30.px, bottom: type == "1" ? 24.px : 150.px),
      padding: EdgeInsets.only(left: 25.px, right: 25.px),
      decoration: BoxDecoration(
        color: const Color(0xff1A1C1F),
        border: Border.all(
            color: const Color.fromRGBO(93, 101, 111, 0.40), width: 1.px),
        borderRadius: BorderRadius.circular(16.px),
      ),
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              color: const Color.fromRGBO(93, 101, 111, 0.40),
              height: 1.px,
            );
          },
          physics: const NeverScrollableScrollPhysics(),
          itemCount: list!.length,
          itemBuilder: (BuildContext context, int index) {
            return ItemView(
              itemBean: list![index],
            );
          },
        ),
      ),
    );
  }
}
