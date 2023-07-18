import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpArrowSwitcher extends StatelessWidget {
  UpArrowSwitcher({
    super.key,
    this.size = 20,
    required this.color,
    required this.onClick,
  });

  final turns = 0.0.obs;
  final double size;
  final Color color;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return CupertinoButton(
          onPressed: () {
            turns.value = turns.value == 0 ? 0.5 : 0;
            onClick();
          },
          minSize: 0,
          padding: EdgeInsets.zero,
          child: AnimatedRotation(
            turns: turns.value,
            duration: const Duration(milliseconds: 250),
            child: Icon(
              Icons.keyboard_arrow_up_outlined,
              color: color,
              size: size,
            ),
          ),
        );
      },
    );
  }
}
