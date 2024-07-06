import 'dart:io';

import 'package:authenticator/core/constants/strings.dart';
import 'package:authenticator/data/otp_code/model/secret_model.dart';
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

  List<SecretModel> getSecrets() {
    final secretsBox = Hive.box<SecretModel>(
      name: kSecretsBoxName,
      encryptionKey: kSecretsEncryptionKey,
    );
    return secretsBox.getAll(secretsBox.keys).cast<SecretModel>();
  }

  void saveSecret(SecretModel secret) {
    final secretsBox = Hive.box<SecretModel>(
      name: kSecretsBoxName,
      encryptionKey: kSecretsEncryptionKey,
    );
    secretsBox[secret.name] = secret;
  }

  void reWriteSecrets(Iterable<SecretModel> secrets) {
    final secretsBox = Hive.box<SecretModel>(
      name: kSecretsBoxName,
      encryptionKey: kSecretsEncryptionKey,
    );
    secretsBox.deleteAll(secretsBox.keys);
    secretsBox.putAll(Map.fromEntries(secrets.map(
      (secret) => MapEntry(secret.name, secret),
    )));
  }

  void deleteSecret(SecretModel secret) {
    final secretsBox = Hive.box<SecretModel>(
      name: kSecretsBoxName,
      encryptionKey: kSecretsEncryptionKey,
    );
    secretsBox.delete(secret.name);
  }

  List<SecretModel> getDeletedSecrets() {
    final secretsBox = Hive.box<SecretModel>(
      name: kDeletedSecretsBoxName,
      encryptionKey: kSecretsEncryptionKey,
    );
    return secretsBox.getAll(secretsBox.keys).cast<SecretModel>();
  }

  void saveDeletedSecret(SecretModel secret) {
    final secretsBox = Hive.box<SecretModel>(
      name: kDeletedSecretsBoxName,
      encryptionKey: kSecretsEncryptionKey,
    );
    secretsBox[secret.name] = secret;
  }

  void clearDeletedSecrets() {
    final secretsBox = Hive.box<SecretModel>(
      name: kSecretsBoxName,
      encryptionKey: kSecretsEncryptionKey,
    );
    secretsBox.deleteFromDisk();
  }

  bool get syncStat {
    final configBox = Hive.box<String>(name: kConfigBoxName);
    return bool.parse(configBox[kConfigBoxPropSyncStat]!);
  }

  set syncStat(bool val) {
    final configBox = Hive.box<String>(name: kConfigBoxName);
    configBox[kConfigBoxPropSyncStat] = val.toString();
  }
}
