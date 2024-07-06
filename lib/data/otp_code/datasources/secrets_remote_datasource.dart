import 'package:authenticator/core/constants/functions.dart';
import 'package:authenticator/core/network/network_client.dart';
import 'package:authenticator/data/otp_code/model/secret_model.dart';

abstract class SecretsRemoteDatasource {
  Future<Iterable<SecretModel>> getSecrets();
  Future<void> saveSecret(SecretModel secret);
  Future<void> deleteSecret(SecretModel secret);
}

class SecretsRemoteDatasourceImpl implements SecretsRemoteDatasource {
  final NetworkClient _networkClient;

  const SecretsRemoteDatasourceImpl({required NetworkClient networkClient})
      : _networkClient = networkClient;

  @override
  Future<void> deleteSecret(SecretModel secret) => _networkClient.deleteUri(
        uri: uriWithPath('/'),
        body: {'name': secret.name},
      );

  @override
  Future<Iterable<SecretModel>> getSecrets() async {
    final res = await _networkClient.getUri(uri: uriWithPath('/'));
    return ((res.data as Map)["secrets"] as List)
        .cast<Map<String, dynamic>>()
        .map(
          (json) => SecretModel.fromJson(json),
        );
  }

  @override
  Future<void> saveSecret(SecretModel secret) => _networkClient.postUri(
        uri: uriWithPath('/'),
        body: {'secret': secret.toJson()},
      );
}
