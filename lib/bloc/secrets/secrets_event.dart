part of 'secrets_bloc.dart';

sealed class SecretsEvent extends Equatable {
  const SecretsEvent();
  const factory SecretsEvent.saveSecret(
      {required final SecretTemplate secret}) = _SaveSecret;

  const factory SecretsEvent.deleteSecret({
    required String id,
  }) = _DeleteSecret;

  const factory SecretsEvent.getSecrets() = _GetSecrets;

  const factory SecretsEvent.getSecret({required String id}) = _GetSecret;

  const factory SecretsEvent.updateSecret(
      {required String id,
      required SecretPartialTemplate secret}) = _UpdateSecret;
}

final class _SaveSecret extends SecretsEvent {
  const _SaveSecret({required this.secret});

  final SecretTemplate secret;

  @override
  List<Object> get props => [secret];
}

final class _DeleteSecret extends SecretsEvent {
  const _DeleteSecret({required this.id});

  final String id;

  @override
  List<Object> get props => [id];
}

final class _GetSecrets extends SecretsEvent {
  const _GetSecrets();

  @override
  List<Object> get props => [];
}

final class _GetSecret extends SecretsEvent {
  final String id;

  const _GetSecret({required this.id});

  @override
  List<Object?> get props => [id];
}

final class _UpdateSecret extends SecretsEvent {
  final String id;
  final SecretPartialTemplate secret;

  const _UpdateSecret({required this.id, required this.secret});

  @override
  List<Object?> get props => [id, secret];
}
