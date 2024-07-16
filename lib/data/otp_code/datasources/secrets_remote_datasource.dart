import 'package:authenticator/core/constants/enums.dart';
import 'package:authenticator/core/constants/functions.dart';
import 'package:authenticator/core/network/network_client.dart';
import 'package:authenticator/domain/otp_code/entities/secret_partial_template.dart';
import 'package:authenticator/domain/otp_code/entities/secret_template.dart';

import '../model/secret_model.dart';

abstract class SecretsRemoteDatasource {
  Future<Iterable<SecretModel>> getSecrets();
  Future<SecretModel> getSecret(String id);
  Future<bool> updateSecret(String id, SecretPartialTemplate secret);
  Future<String> saveSecret(SecretTemplate secret);
  Future<bool> deleteSecret(String id);
}

class SecretsRemoteDatasourceImpl implements SecretsRemoteDatasource {
  final NetworkClient _networkClient;

  const SecretsRemoteDatasourceImpl({required NetworkClient networkClient})
      : _networkClient = networkClient;

  @override
  Future<bool> deleteSecret(String id) async {
    final res = await _networkClient.deleteUri(
      uri: uriWithPath('/'),
    );
    return res.statusCode.type == StatusType.sucess;
  }

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
  Future<String> saveSecret(SecretTemplate secret) async {
    final res = await _networkClient.putUri(
      uri: uriWithPath('/'),
      body: {'secret': secret.toJson()},
    );
    return (res.data as Map<String, String>)["id"]!;
  }

  @override
  Future<SecretModel> getSecret(String id) async {
    final res = await _networkClient.getUri(uri: uriWithPath('/'));
    return SecretModel.fromJson(
      ((res.data as Map)["secret"] as Map<String, dynamic>),
    );
  }

  @override
  Future<bool> updateSecret(String id, SecretPartialTemplate secret) async {
    final res = await _networkClient
        .patchUri(uri: uriWithPath('/'), body: {"secret": secret.toJson()});
    return res.statusCode.type == StatusType.sucess;
  }
}
