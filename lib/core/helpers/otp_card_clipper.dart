import 'package:flutter/material.dart';

class OtpCardClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) => Path()
    ..addRRect(
      RRect.fromRectAndCorners(
        Offset.zero & size,
        bottomLeft: const Radius.circular(10),
        bottomRight: const Radius.circular(10),
        topLeft: const Radius.circular(10),
      ),
    )
    ..moveTo(size.width * 0.5, 0)
    ..cubicTo(
      size.width * .5 + 20,
      -1,
      size.width * .65 - 10,
      14 + 12,
      size.width * .65,
      14 + 12,
    )
    ..lineTo(size.width, 14 + 12)
    ..lineTo(size.width, 0);

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
