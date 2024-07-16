import 'package:flutter/material.dart';

const kCodeCardAnimationDuration = Duration(milliseconds: 700);
const kBackgroundAnimationDuration = Duration(milliseconds: 400);
const kDefaultShimmerGradient = LinearGradient(
  colors: [
    Color(0xFF8B8B84),
    Color(0xFFA4A4A4),
    Color(0xFF8B8B84),
  ],
  stops: [
    0.1,
    0.3,
    0.4,
  ],
  begin: Alignment(-1.0, -0.3),
  end: Alignment(1.0, 0.3),
  tileMode: TileMode.clamp,
);
