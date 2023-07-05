import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_comm/widget/input_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

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
                child: MyInputFiled(
              width: double.infinity,
              height: 30.w,
              hint: '请输入你想搜索的关键字',
              icon: 'assets/images/search_g.webp',
              editNode: EditNode(),
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
          child: Text(
            'HomeView is working',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
