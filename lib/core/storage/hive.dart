import 'dart:io';

import 'package:authenticator/core/services/service_locator.dart';
import 'package:authenticator/data/otp_code/model/secret_model.dart';
import 'package:hive/hive.dart';

void initHive() {
  Hive.defaultDirectory =
      sl<Directory>(instanceName: 'Hive.defaultDirectory').path;

  Hive.registerAdapter<SecretModel>(
    'SecretModel',
    (json) => SecretModel.fromJson(json as Map<String, dynamic>),
  );
}
