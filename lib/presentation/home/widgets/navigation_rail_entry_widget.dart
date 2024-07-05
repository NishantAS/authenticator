import 'dart:ui';

import 'package:flutter/material.dart';

class NavigationRailEntryWidget extends StatelessWidget {
  const NavigationRailEntryWidget({
    super.key,
    required this.child,
    required this.label,
  });

  final Widget child;
  final Widget label;

  @override
  Widget build(BuildContext context) {
    final animation = NavigationRail.extendedAnimation(context);
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) => Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: child!,
          ),
          if (animation.value != 0)
            Align(
              widthFactor: lerpDouble(0, 1, animation.value)!,
              child: label,
            ),
        ],
      ),
      child: child,
    );
  }
}
