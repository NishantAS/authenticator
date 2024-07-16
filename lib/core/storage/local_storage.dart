import 'package:authenticator/core/constants/strings.dart';
import 'package:authenticator/data/otp_code/model/secret_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class LocalStorage {
  const LocalStorage();

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
    final res = secretsBox.getAll(secretsBox.keys);
    return res.nonNulls.cast<SecretModel>().toList();
  }

  SecretModel getSecret(String id) {
    final secretsBox = Hive.box<SecretModel>(
      name: kSecretsBoxName,
      encryptionKey: kSecretsEncryptionKey,
    );
    return secretsBox.get(id)!;
  }

  void saveSecret(SecretModel secret) {
    final secretsBox = Hive.box<SecretModel>(
      name: kSecretsBoxName,
      encryptionKey: kSecretsEncryptionKey,
    );
    secretsBox[secret.id] = secret;
  }

  void reWriteSecrets(Iterable<SecretModel> secrets) {
    final secretsBox = Hive.box<SecretModel>(
      name: kSecretsBoxName,
      encryptionKey: kSecretsEncryptionKey,
    );
    secretsBox.deleteAll(secretsBox.keys);
    secretsBox.putAll(
      Map.fromEntries(
        secrets.map(
          (secret) => MapEntry(secret.id, secret),
        ),
      ),
    );
  }

  void deleteSecret(String id) {
    final secretsBox = Hive.box<SecretModel>(
      name: kSecretsBoxName,
      encryptionKey: kSecretsEncryptionKey,
    );
    secretsBox.delete(id);
  }
}
