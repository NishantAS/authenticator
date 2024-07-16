part of 'otp_code_bloc.dart';

sealed class OtpCodeEvent extends Equatable {
  const OtpCodeEvent();
  const factory OtpCodeEvent.generateTotp(Secret key) = _GenerateTotp;
}

final class _GenerateTotp extends OtpCodeEvent {
  const _GenerateTotp(this.secret);

  final Secret secret;

  @override
  List<Object> get props => [];
}
