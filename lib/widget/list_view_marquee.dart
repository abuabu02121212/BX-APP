import 'package:flutter/cupertino.dart';

import 'package:flutter_comm/widget/scroller_marquee_helper.dart';

class ListViewMarquee extends StatefulWidget {
  const ListViewMarquee({super.key, required this.child});

  final Widget child;

  @override
  State<StatefulWidget> createState() {
    return MyState();
  }
}

class MyState extends State<ListViewMarquee> with TickerProviderStateMixin {
  late MarqueeHelper marqueeHelper = MarqueeHelper(vsync: this);

  @override
  void initState() {
    marqueeHelper.setUpMarquee();

    /// 设置滚动到结尾的接听 滚动到结尾才能进行数据置换更新
    // marqueeHelper.setOnScrollToEndListener(() {});
    super.initState();
  }

  @override
  void dispose() {
    marqueeHelper.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 1,
        scrollDirection: Axis.horizontal,
        controller: marqueeHelper.sc,
        itemBuilder: (BuildContext context, int index) {
          return Center(
            child: widget.child,
          );
        });
  }
}
