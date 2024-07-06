import 'package:authenticator/core/constants/enums.dart';
import 'package:authenticator/core/constants/strings.dart';
import 'package:flutter/material.dart';

String emptyFieldValidationMessage(String fieldName) =>
    "$fieldName cannot be empty.";

String requriedFieldValidationMessage(String fieldName) =>
    "$fieldName is requried.";

String invalidFieldValidationMessage(String filedName, String value) =>
    "$value is not valid $filedName";

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

Uri uriWithPath(String path, [Map<String, dynamic>? params]) => Uri(
      scheme: kScheme,
      host: kDomain,
      path: path,
      queryParameters: params,
    );
