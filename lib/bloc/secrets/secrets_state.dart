part of 'secrets_bloc.dart';

sealed class SecretsState extends Equatable {
  const SecretsState();

  const factory SecretsState.intial() = SecretsInitial;

  const factory SecretsState.loading() = SecretsLoading;

  const factory SecretsState.error({
    required AppFailure failure,
  }) = SecretsError;

  const factory SecretsState.secretSaved({
    required Secret secret,
  }) = SecretSaved;

  const factory SecretsState.secretsReceived({
    required Iterable<Secret> secrets,
  }) = SceretsReceived;

  const factory SecretsState.secretDestroyed({
    required Secret secret,
  }) = SecretDeleted;

  const factory SecretsState.secretReceived({required Secret secret}) =
      SecretReceived;

  const factory SecretsState.secretUpdated({required Secret secret}) =
      SecretUpdated;
}

final class SecretsInitial extends SecretsState {
  const SecretsInitial();

  @override
  List<Object> get props => [];
}

final class SecretsLoading extends SecretsState {
  const SecretsLoading();

  @override
  List<Object> get props => [];
}

final class SecretsError extends SecretsState {
  const SecretsError({required this.failure});

  final AppFailure failure;

  @override
  List<Object> get props => [failure];
}

final class SecretSaved extends SecretsState {
  const SecretSaved({required this.secret});

  final Secret secret;

  @override
  List<Object> get props => [secret];
}

final class SceretsReceived extends SecretsState {
  const SceretsReceived({required this.secrets});

  final Iterable<Secret> secrets;

  @override
  List<Object> get props => [secrets];
}

final class SecretDeleted extends SecretsState {
  const SecretDeleted({required this.secret});

  final Secret secret;

  @override
  List<Object> get props => [secret];
}

final class SecretReceived extends SecretsState {
  final Secret secret;

  const SecretReceived({required this.secret});

  @override
  List<Object?> get props => [secret];
}

final class SecretUpdated extends SecretsState {
  final Secret secret;

  const SecretUpdated({required this.secret});

  @override
  List<Object?> get props => [secret];
}
