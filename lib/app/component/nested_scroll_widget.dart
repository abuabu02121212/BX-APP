import 'package:flutter/material.dart';

import '../app_style.dart';

class MyNestedScrollWidget extends StatefulWidget {
  const MyNestedScrollWidget({
    Key? key,
    this.topTitle,
    this.bottomTitle,
    required this.background,
    required this.sliverWidgetList,
    this.expandedHeight = 180,
    this.collapsedHeight = 30,
    this.toolbarHeight =  60,
    this.controller,
  }) : super(key: key);

  final Widget? topTitle;
  final Widget? bottomTitle;
  final Widget background;
  final List<Widget> sliverWidgetList;
  final double expandedHeight;
  final double collapsedHeight;
  final double toolbarHeight;
  final ScrollController? controller;

  @override
  State<StatefulWidget> createState() {
    return MyState();
  }
}

class MyState extends State<MyNestedScrollWidget> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: widget.controller,
      slivers: [
        SliverAppBar(
          // 收起的过渡颜色
          backgroundColor: headerBgColor,
          shadowColor: Colors.transparent,
          foregroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          elevation: 0.0,
          primary: true,
          shape: null,
          scrolledUnderElevation: 10,
          title: widget.topTitle,
          // 去掉主标题栏左右间距
          titleSpacing: 0,
          leading: const SizedBox(),
          pinned: true,
          floating: true,
          bottom: const PreferredSize(preferredSize: Size(0, 0), child: SizedBox()),
          expandedHeight: widget.expandedHeight,
          collapsedHeight: widget.collapsedHeight,
          toolbarHeight: widget.toolbarHeight,
          leadingWidth: 0,
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: const EdgeInsets.all(0),
            expandedTitleScale: 1,
            collapseMode: CollapseMode.pin,
            title: widget.bottomTitle,
            background: widget.background,
          ),
        ),
        // const SliverPadding(padding: EdgeInsets.only(top: 10)),
        ...widget.sliverWidgetList,
      ],
    );
  }
}
