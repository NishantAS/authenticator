import 'package:authenticator/core/constants/enums.dart';
import 'package:flutter/material.dart';

ScreenSize getScreenSize(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  if (width < 600) {
    return ScreenSize.compact;
  } else if (width < 840) {
    return ScreenSize.medium;
  } else if (width < 1200) {
    return ScreenSize.expanded;
  } else if (width < 1600) {
    return ScreenSize.large;
  } else {
    return ScreenSize.xLarge;
  }
}
