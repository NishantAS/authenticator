import 'dart:io';

import 'package:authenticator/core/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class LocalStorage {
  LocalStorage(Directory dir) {
    Hive.defaultDirectory = dir.path;
  }

  ThemeMode getTheme() {
    final config = Hive.box<String>(name: kConfigBoxName);
    final theme = config.get(kConfigBoxPropTheme);
    if (theme == null) {
      setTheme(ThemeMode.system);
      return ThemeMode.system;
    }

    return ThemeMode.values.elementAt(int.parse(theme));
  }

  void setTheme(ThemeMode theme) {
    final config = Hive.box<String>(name: kConfigBoxName);
    config.put(kConfigBoxPropTheme, theme.index.toString());
  }
}
