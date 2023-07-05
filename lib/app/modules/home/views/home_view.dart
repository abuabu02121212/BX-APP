import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_comm/util/toast_util.dart';
import 'package:flutter_comm/widget/input_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../../widget/horizontal_indicator_tab.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/search_icon.webp", width: 36.w),
            SizedBox(width: 8.w),
            Expanded(
                child: Stack(
              children: [
                MyInputFiled(
                  width: double.infinity,
                  height: 36.w,
                  hint: '请输入你想搜索的关键字',
                  icon: 'assets/images/search_g.webp',
                  editNode: EditNode(),
                ),
                CupertinoButton(
                  onPressed: () {
                    Toast.show("msg");
                  },
                  minSize: 0,
                  padding: const EdgeInsets.all(0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 36.w,
                  ),
                ),
              ],
            ))
          ],
        ),
        backgroundColor: Colors.black,
        centerTitle: false,
      ),
      body: SafeArea(
        child: Container(
          color: Colors.black,
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.topLeft,
          child: Column(
            children: [
              HorizontalIndicatorTab(
                size: controller.tabNames.length,
                itemBuilder: _buildIndicatorTabItemBuilder,
                width: 1.sw,
                height: 36.w,
                itemWidthList: List.generate(controller.tabNames.length, (index) => getTabItemWidth(index)),
                onSelectChanged: (pos) {},
                bgColor: Colors.transparent,
                alignment: Alignment.center,
                indicatorAttr: IndicatorAttr(color: const Color(0xffd54f7d), height: 3.w, width: 20.w),
                controller: IndicatorTabController(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  double getTabItemWidth(int pos) {
    return controller.tabNames[pos].length * 20.w;
  }

  Widget _buildIndicatorTabItemBuilder(BuildContext context, int index, int selectedPos) {
    bool selected = index == selectedPos;
    Color color = selected ? const Color(0xffd54f7d) : const Color(0xffc0c2c6);
    return Container(
      width: getTabItemWidth(index),
      alignment: Alignment.center,
      child: Center(
        child: Text(
          controller.tabNames[index],
          style: TextStyle(color: color, fontSize: 17.w),
        ),
      ),
    );
  }
}
