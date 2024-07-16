import 'dart:io';

import 'package:authenticator/core/services/service_locator.dart';
import 'package:hive/hive.dart';

void initHive() {
  Hive.defaultDirectory =
      sl<Directory>(instanceName: 'Hive.defaultDirectory').path;
}
