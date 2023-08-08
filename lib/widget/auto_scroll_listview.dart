import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'auto_scroll.dart';

typedef ItemBuilder = Widget? Function(BuildContext context, int index);

class AutoScrollListView extends StatefulWidget {
  const AutoScrollListView({
    super.key,
    required this.rxList,
    required this.itemBuilder,
  });

  final RxList rxList;
  final ItemBuilder itemBuilder;

  @override
  State<StatefulWidget> createState() {
    return MyState();
  }
}

class MyState extends State<AutoScrollListView> {
  final AutoScrollUtil autoScrollUtil = AutoScrollUtil(scrollSpeed: 16);
  final isPressed = false.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      var length = widget.rxList.length;
      return Listener(
        onPointerDown: (e) {
          isPressed.value = true;
        },
        onPointerUp: (e) async {
          await Future.delayed(const Duration(microseconds: 250));
          isPressed.value = false;
        },
        child: Obx(() {
          var scrollController = isPressed.value ? ScrollController(initialScrollOffset: autoScrollUtil.sc.offset) : autoScrollUtil.sc;
          return ListView.builder(
            itemCount: length * 3,
            controller: scrollController,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              final itemIndex = index % length;
              return widget.itemBuilder(context, itemIndex);
            },
          );
        }),
      );
    });
  }
}
