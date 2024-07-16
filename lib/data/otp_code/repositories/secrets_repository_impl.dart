import 'dart:async';

import 'package:authenticator/core/constants/strings.dart';
import 'package:authenticator/core/failure/app_failure.dart';
import 'package:authenticator/core/failure/failure_type.dart';
import 'package:authenticator/core/network/network_info.dart';
import 'package:authenticator/data/otp_code/model/secret_model.dart';
import 'package:authenticator/domain/otp_code/entities/secret.dart';
import 'package:authenticator/domain/otp_code/entities/secret_partial_template.dart';
import 'package:authenticator/domain/otp_code/entities/secret_template.dart';
import 'package:authenticator/domain/otp_code/repositories/secrets_repository.dart';
import 'package:dartz/dartz.dart';

import '../datasources/secrets_local_datasource.dart';
import '../datasources/secrets_remote_datasource.dart';

class SecretsRepositoryImpl implements SecretsRepository {
  final NetworkInfo _networkInfo;
  final SecretsLocalDatasource _localDatasource;
  final SecretsRemoteDatasource _remoteDatasource;

  const SecretsRepositoryImpl({
    required NetworkInfo networkInfo,
    required SecretsLocalDatasource localDatasource,
    required SecretsRemoteDatasource remoteDatasource,
  })  : _networkInfo = networkInfo,
        _localDatasource = localDatasource,
        _remoteDatasource = remoteDatasource;

  @override
  Future<Either<AppFailure, bool>> deleteSecret(String id) async {
    if (_networkInfo.isConnected) {
      try {
        final res = await _remoteDatasource.deleteSecret(id);
        _localDatasource.deleteSecret(id);
        return right(res);
      } catch (error) {
        rethrow;
      }
    } else {
      return Left(
        AppFailure(
          failureType: const FailureType.noNetwork(),
          errorMessage: kNoNetworkMessage,
        ),
      );
    }
  }

  @override
  Future<Either<AppFailure, Iterable<Secret>>> getSecrets() async {
    if (_networkInfo.isConnected) {
      try {
        final res = await _remoteDatasource.getSecrets();
        _localDatasource.reWriteSecrets(res);
        return right(res);
      } catch (error) {
        rethrow;
      }
    } else {
      try {
        return right(_localDatasource.getSecrets());
      } catch (error) {
        rethrow;
      }
    }
  }

  @override
  Future<Either<AppFailure, String>> saveSecret(SecretTemplate secret) async {
    if (_networkInfo.isConnected) {
      try {
        final id = await _remoteDatasource.saveSecret(secret);
        _localDatasource.saveSecret(
          SecretModel(
            value: secret.value,
            name: secret.name,
            id: id,
            interval: secret.interval,
            isGoogle: secret.isGoogle,
            length: secret.length,
          ),
        );
        return right(id);
      } catch (error) {
        rethrow;
      }
    } else {
      return Left(
        AppFailure(
          failureType: const FailureType.noNetwork(),
          errorMessage: kNoNetworkMessage,
        ),
      );
    }
  }

  @override
  Future<Either<AppFailure, Secret>> getSecret(String id) async {
    if (_networkInfo.isConnected) {
      try {
        final res = await _remoteDatasource.getSecret(id);
        _localDatasource.saveSecret(res);
        return right(res);
      } catch (error) {
        rethrow;
      }
    } else {
      try {
        return right(_localDatasource.getSecret(id));
      } catch (error) {
        rethrow;
      }
    }
  }

  @override
  Future<Either<AppFailure, bool>> updateSecret(
      String id, SecretPartialTemplate secret) async {
    if (_networkInfo.isConnected) {
      try {
        final res = await _remoteDatasource.updateSecret(id, secret);
        _localDatasource.updateSecret(id, secret);
        return right(res);
      } catch (error) {
        rethrow;
      }
    } else {
      return left(
        AppFailure(
          failureType: const FailureType.noNetwork(),
          errorMessage: kNoNetworkMessage,
        ),
      );
    }
  }
}
