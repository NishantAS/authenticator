import 'package:authenticator/core/constants/strings.dart';
import 'package:authenticator/core/failure/app_failure.dart';
import 'package:authenticator/core/failure/failure_type.dart';
import 'package:authenticator/core/network/network_info.dart';
import 'package:authenticator/data/otp_code/datasources/secrets_local_datasource.dart';
import 'package:authenticator/data/otp_code/datasources/secrets_remote_datasource.dart';
import 'package:authenticator/data/otp_code/model/secret_model.dart';
import 'package:authenticator/domain/otp_code/entities/secret.dart';
import 'package:authenticator/domain/otp_code/repositories/secrets_repository.dart';
import 'package:dartz/dartz.dart';

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
  Future<Either<AppFailure, void>> deleteSecret(Secret secret) async {
    if (_networkInfo.isConnected) {
      if (_localDatasource.hasUnsyncedChanges) {
        final res = await syncWithRemote();
        if (res.isLeft()) {
          return res;
        }
      }
      try {
        final secretModel = SecretModel(
          value: secret.value,
          name: secret.name,
          isSynced: true,
        );
        await _remoteDatasource.deleteSecret(secretModel);
        _localDatasource.deleteSecret(secretModel);
        return right(null);
      } catch (error) {
        rethrow;
      }
    } else {
      try {
        return right(
          _localDatasource.deleteSecret(
            SecretModel(
              value: secret.value,
              name: secret.name,
              isSynced: false,
            ),
          ),
        );
      } catch (error) {
        rethrow;
      }
    }
  }

  @override
  Future<Either<AppFailure, Iterable<Secret>>> getSecrets() async {
    if (_networkInfo.isConnected) {
      if (_localDatasource.hasUnsyncedChanges) {
        final res = await syncWithRemote();
        if (res.isLeft()) {
          return left(res.fold(
            (failure) => failure,
            (_) => throw Error(),
          ));
        }
      }
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
  Future<Either<AppFailure, void>> saveSecret(Secret secret) async {
    if (_networkInfo.isConnected) {
      if (_localDatasource.hasUnsyncedChanges) {
        final res = await syncWithRemote();
        if (res.isLeft()) {
          return res;
        }
      }
      try {
        final secretModel = SecretModel(
          value: secret.value,
          name: secret.name,
          interval: secret.interval,
          isGoogle: secret.isGoogle,
          length: secret.length,
          isSynced: true,
        );
        await _remoteDatasource.saveSecret(secretModel);
        _localDatasource.saveSecret(secretModel);
        return right(null);
      } catch (error) {
        rethrow;
      }
    } else {
      try {
        return right(
          _localDatasource.saveSecret(
            SecretModel(
              value: secret.value,
              name: secret.name,
              interval: secret.interval,
              isGoogle: secret.isGoogle,
              length: secret.length,
              isSynced: false,
            ),
          ),
        );
      } catch (error) {
        rethrow;
      }
    }
  }

  @override
  Future<Either<AppFailure, void>> syncWithRemote() async {
    if (_networkInfo.isConnected) {
      try {
        final local = _localDatasource.deletedSecrets();
        await Future.wait<void>(
          local.map((e) => _remoteDatasource.deleteSecret(e)),
        );
      } catch (error) {
        rethrow;
      }

      try {
        final local = _localDatasource.getUnsynced();
        await Future.wait<void>(
          local.map((e) => _remoteDatasource.saveSecret(e)),
        );
      } catch (error) {
        rethrow;
      }

      _localDatasource.onSync();

      try {
        final remote = await _remoteDatasource.getSecrets();
        _localDatasource.reWriteSecrets(remote);
      } catch (error) {
        rethrow;
      }

      return right(null);
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
