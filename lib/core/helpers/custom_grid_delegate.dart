import 'dart:math' as math;

import 'package:flutter/rendering.dart';

class CustomGridDelegateWithFixedCrossExtent extends SliverGridDelegate {
  final double maxCrossAxisExtent;
  final double minCrossAxisExtent;
  final double childAspectRatio;
  final double mainAxisPadding;
  final double crossAxisPadding;

  const CustomGridDelegateWithFixedCrossExtent({
    required this.maxCrossAxisExtent,
    required this.minCrossAxisExtent,
    this.childAspectRatio = 1,
    this.mainAxisPadding = 0.0,
    this.crossAxisPadding = 0.0,
  })  : assert(
          mainAxisPadding >= 0 && crossAxisPadding >= 0,
          "Padding must be non-negative.",
        ),
        assert(
          childAspectRatio > 0,
          "Aspect ratio must be postive and non zero.",
        ),
        assert(
          maxCrossAxisExtent > 0 && minCrossAxisExtent > 0,
          "Cross axis min an max extents must be postive and non-zero.",
        ),
        assert(
          minCrossAxisExtent <= maxCrossAxisExtent,
          "Cross axis min extent must be les than or equal to max extent.",
        );

  @override
  SliverGridLayout getLayout(SliverConstraints constraints) {
    final double maxExtentCount =
        (constraints.crossAxisExtent / (maxCrossAxisExtent + crossAxisPadding));
    final double minExtentCount =
        (constraints.crossAxisExtent / (minCrossAxisExtent + crossAxisPadding));
    int crossAxisCount;
    if (maxExtentCount.floor() == minExtentCount.floor() &&
        maxExtentCount.floor() > 0) {
      crossAxisCount = maxExtentCount.floor();
    } else {
      // TODO: make this configurable based on display compactness or an input variable.
      crossAxisCount = math.max(
        maxExtentCount.ceil(),
        minExtentCount.floor(),
      );
      crossAxisCount = math.max(1, crossAxisCount);
    }
    final double usableCrossAxisExtent = math.max(
      0.0,
      constraints.crossAxisExtent - crossAxisPadding * (crossAxisCount - 1),
    );
    final double crossAxisExtent = usableCrossAxisExtent / crossAxisCount;
    final double childMainAxisExtent = crossAxisExtent / childAspectRatio;

    return SliverGridRegularTileLayout(
      crossAxisCount: crossAxisCount,
      mainAxisStride: childMainAxisExtent + mainAxisPadding,
      crossAxisStride: crossAxisExtent + crossAxisPadding,
      childMainAxisExtent: childMainAxisExtent,
      childCrossAxisExtent: crossAxisExtent,
      reverseCrossAxis: axisDirectionIsReversed(constraints.crossAxisDirection),
    );
  }

  @override
  bool shouldRelayout(CustomGridDelegateWithFixedCrossExtent oldDelegate) =>
      maxCrossAxisExtent != oldDelegate.maxCrossAxisExtent ||
      minCrossAxisExtent != oldDelegate.minCrossAxisExtent ||
      childAspectRatio != oldDelegate.childAspectRatio ||
      mainAxisPadding != oldDelegate.mainAxisPadding ||
      crossAxisPadding != oldDelegate.crossAxisPadding;
}
