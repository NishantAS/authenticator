import 'package:authenticator/core/failure/app_failure.dart';
import 'package:authenticator/core/helpers/usecase.dart';
import 'package:authenticator/domain/otp_code/entities/secret.dart';
import 'package:authenticator/domain/otp_code/entities/secret_partial_template.dart';
import 'package:authenticator/domain/otp_code/entities/secret_template.dart';
import 'package:authenticator/domain/otp_code/usecases/delete_secret.dart';
import 'package:authenticator/domain/otp_code/usecases/get_secret.dart';
import 'package:authenticator/domain/otp_code/usecases/get_secrets.dart';
import 'package:authenticator/domain/otp_code/usecases/save_secret.dart';
import 'package:authenticator/domain/otp_code/usecases/update_secret.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'secrets_event.dart';
part 'secrets_state.dart';

class SecretsBloc extends Bloc<SecretsEvent, SecretsState> {
  final GetSecrets _getSecrets;
  final GetSecret _getSecret;
  final SaveSecret _saveSecret;
  final UpdateSecret _updateSecret;
  final DeleteSecret _deleteSecret;

  SecretsBloc({
    required GetSecrets getSecrets,
    required GetSecret getSecret,
    required SaveSecret saveSecret,
    required UpdateSecret updateSecret,
    required DeleteSecret deleteSecret,
  })  : _getSecrets = getSecrets,
        _getSecret = getSecret,
        _saveSecret = saveSecret,
        _updateSecret = updateSecret,
        _deleteSecret = deleteSecret,
        super(const SecretsState.intial()) {
    on<_SaveSecret>(_onSaveSecret);
    on<_GetSecrets>(_onGetSecrets);
    on<_DeleteSecret>(_onDeleteSecret);
    on<_GetSecret>(_onGetSecret);
    on<_UpdateSecret>(_onUpdateSecret);
  }

  Future<void> _onSaveSecret(
    _SaveSecret event,
    Emitter<SecretsState> emit,
  ) async {
    emit(const SecretsState.loading());
    await (await _saveSecret(SaveSecretParams(event.secret))).fold(
      (failure) async => emit(SecretsState.error(failure: failure)),
      (id) async => (await _getSecret(GetSecretParams(id: id))).fold(
        (failure) => emit(SecretsState.error(failure: failure)),
        (secret) => emit(SecretsState.secretSaved(secret: secret)),
      ),
    );
  }

  Future<void> _onGetSecrets(
    _GetSecrets event,
    Emitter<SecretsState> emit,
  ) async {
    emit(const SecretsState.loading());
    // await Future.delayed(Duration(seconds: 5), () async {});
    (await _getSecrets(const NoParams())).fold(
      (failure) => emit(SecretsState.error(failure: failure)),
      (secrets) => emit(SecretsState.secretsReceived(secrets: secrets)),
    );
  }

  Future<void> _onDeleteSecret(
    _DeleteSecret event,
    Emitter<SecretsState> emit,
  ) async {
    emit(const SecretsState.loading());
    await (await _getSecret(GetSecretParams(id: event.id))).fold(
      (failure) async => emit(SecretsState.error(failure: failure)),
      (secret) async =>
          (await _deleteSecret(DeleteSecretParams(event.id))).fold(
        (failure) => emit(SecretsState.error(failure: failure)),
        (success) => emit(SecretsState.secretDestroyed(secret: secret)),
      ),
    );
  }

  Future<void> _onGetSecret(
    _GetSecret event,
    Emitter<SecretsState> emit,
  ) async {
    emit(const SecretsState.loading());
    (await _getSecret(GetSecretParams(id: event.id))).fold(
      (failure) => emit(SecretsState.error(failure: failure)),
      (secret) => emit(SecretsState.secretReceived(secret: secret)),
    );
  }

  Future<void> _onUpdateSecret(
    _UpdateSecret event,
    Emitter<SecretsState> emit,
  ) async {
    emit(const SecretsState.loading());
    await (await _updateSecret(
            UpdateSecretParams(id: event.id, partialTemplate: event.secret)))
        .fold(
      (failure) async => emit(SecretsState.error(failure: failure)),
      (_) async => (await _getSecret(GetSecretParams(id: event.id))).fold(
        (failure) => emit(SecretsState.error(failure: failure)),
        (secret) => emit(SecretsState.secretUpdated(secret: secret)),
      ),
    );
  }
}
