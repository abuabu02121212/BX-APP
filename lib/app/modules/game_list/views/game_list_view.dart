import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../app_style.dart';
import '../../../component/app_header.dart';
import '../controllers/game_list_controller.dart';

class GameListView extends GetView<GameListController> {
  const GameListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppHeader(
          titleWidget: Text(
            "SLOT",
            style: TextStyle(
              fontSize: 32.w,
              color: const Color(0xffffffff),
              fontWeight: FontWeight.w400,
            ),
          ),
          isNeedLeftBackArrow: true,
        ),
        centerTitle: true,
        titleSpacing: 0,
        leadingWidth: 0,
      ),
      body: const SafeArea(
        child: Center(
          child: Text(
            'GameListView is working',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
