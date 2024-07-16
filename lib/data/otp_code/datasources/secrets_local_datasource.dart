import 'package:authenticator/core/storage/local_storage.dart';
import 'package:authenticator/domain/otp_code/entities/secret_partial_template.dart';

import '../model/secret_model.dart';

abstract class SecretsLocalDatasource {
  List<SecretModel> getSecrets();
  SecretModel getSecret(String id);
  void saveSecret(SecretModel secret);
  void updateSecret(String id, SecretPartialTemplate secret);
  void deleteSecret(String id);

  void reWriteSecrets(Iterable<SecretModel> secrets);
}

class SecretsLocalDatasourceImpl implements SecretsLocalDatasource {
  final LocalStorage _localStorage;

  SecretsLocalDatasourceImpl({required LocalStorage localStorage})
      : _localStorage = localStorage;

  @override
  void deleteSecret(String id) => _localStorage.deleteSecret(id);

  @override
  List<SecretModel> getSecrets() => _localStorage.getSecrets();

  @override
  void reWriteSecrets(Iterable<SecretModel> secrets) =>
      _localStorage.reWriteSecrets(secrets);

  @override
  void saveSecret(SecretModel secret) => _localStorage.saveSecret(secret);

  @override
  SecretModel getSecret(String id) => _localStorage.getSecret(id);

  @override
  void updateSecret(String id, SecretPartialTemplate secret) {
    final oldSecret = _localStorage.getSecret(id);
    final newSecret = SecretModel(
      value: secret.value ?? oldSecret.value,
      name: secret.name ?? oldSecret.name,
      id: id,
      interval: secret.interval ?? oldSecret.interval,
      isGoogle: secret.isGoogle ?? oldSecret.isGoogle,
      length: secret.length ?? oldSecret.length,
    );
    _localStorage.saveSecret(newSecret);
  }
}
