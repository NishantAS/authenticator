import 'package:flutter/material.dart';

class NeonProgressBar extends StatelessWidget {
  const NeonProgressBar({
    super.key,
    required this.animation,
    this.begin,
    this.end,
  });

  final Animation<double> animation;
  final Color? begin;
  final Color? end;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        final color = Color.lerp(begin, end, animation.value);
        return CustomPaint(
          willChange: true,
          painter: TestWidget(
            value: animation.value,
            color: color ??
                Theme.of(context).progressIndicatorTheme.circularTrackColor ??
                Theme.of(context).primaryColor,
          ),
          child: LinearProgressIndicator(
            color: color,
            value: animation.value,
            borderRadius: BorderRadius.circular(10),
            minHeight: 2,
          ),
        );
      },
    );
  }
}

class TestWidget extends CustomPainter {
  final double value;
  final Color color;

  const TestWidget({
    super.repaint,
    required this.value,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    Size size_ = Size(value * size.width, size.height) + const Offset(20, 20);
    path.addRRect(RRect.fromRectXY(const Offset(-10, -20) & size_, 10, 0));
    canvas.drawShadow(path, color, 10, true);
  }

  @override
  bool shouldRepaint(covariant TestWidget oldDelegate) {
    return oldDelegate.value != value;
  }
}
