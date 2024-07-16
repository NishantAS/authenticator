part of 'otp_code_bloc.dart';

sealed class OtpCodeState extends Equatable {
  const OtpCodeState();

  const factory OtpCodeState.initial() = OtpCodeInitial;
  const factory OtpCodeState.generated(int code, Duration timeRemaing) =
      OtpCodeGenerated;
  const factory OtpCodeState.error(AppFailure failure) = OtpCodeError;
}

final class OtpCodeInitial extends OtpCodeState {
  const OtpCodeInitial();

  @override
  List<Object?> get props => [];
}

final class OtpCodeGenerated extends OtpCodeState {
  final int code;
  final Duration timeRemaing;

  const OtpCodeGenerated(this.code, this.timeRemaing);

  @override
  List<Object?> get props => [code, timeRemaing];
}

final class OtpCodeError extends OtpCodeState {
  final AppFailure failure;

  const OtpCodeError(this.failure);

  @override
  List<Object?> get props => [failure];
}
