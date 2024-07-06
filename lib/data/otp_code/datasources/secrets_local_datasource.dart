import 'package:authenticator/core/storage/local_storage.dart';
import 'package:authenticator/data/otp_code/model/secret_model.dart';

abstract class SecretsLocalDatasource {
  List<SecretModel> getSecrets();
  void saveSecret(SecretModel secret);
  void deleteSecret(SecretModel secret);

  void reWriteSecrets(Iterable<SecretModel> secrets);

  Iterable<SecretModel> deletedSecrets();
  Iterable<SecretModel> getUnsynced();

  void onSync();
  bool get hasUnsyncedChanges;
}

class SecretsLocalDatasourceImpl implements SecretsLocalDatasource {
  final LocalStorage _localStorage;

  SecretsLocalDatasourceImpl({required LocalStorage localStorage})
      : _localStorage = localStorage;

  @override
  void deleteSecret(SecretModel secret) {
    _localStorage.deleteSecret(secret);
    if (!secret.isSynced) {
      _localStorage.saveDeletedSecret(secret);
      _localStorage.syncStat ? _localStorage.syncStat = false : null;
    }
  }

  @override
  Iterable<SecretModel> deletedSecrets() => _localStorage.getDeletedSecrets();

  @override
  List<SecretModel> getSecrets() => _localStorage.getSecrets();

  @override
  Iterable<SecretModel> getUnsynced() =>
      _localStorage.getSecrets().where((element) => !element.isSynced);

  @override
  bool get hasUnsyncedChanges => _localStorage.syncStat;

  @override
  void onSync() {
    _localStorage.syncStat = true;
    _localStorage.clearDeletedSecrets();
  }

  @override
  void reWriteSecrets(Iterable<SecretModel> secrets) =>
      _localStorage.reWriteSecrets(secrets);

  @override
  void saveSecret(SecretModel secret) {
    _localStorage.saveSecret(secret);
    if (!secret.isSynced) {
      _localStorage.syncStat ? _localStorage.syncStat = false : null;
    }
  }
}
