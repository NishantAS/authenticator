import 'dart:async';

import 'package:authenticator/core/failure/app_failure.dart';
import 'package:authenticator/domain/otp_code/entities/secret.dart';
import 'package:authenticator/domain/otp_code/usecases/generate_totp.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'otp_code_event.dart';
part 'otp_code_state.dart';

class OtpCodeBloc extends Bloc<OtpCodeEvent, OtpCodeState> {
  final GenerateTotp generateTotp;
  OtpCodeBloc({required this.generateTotp})
      : super(const OtpCodeState.initial()) {
    on<_GenerateTotp>(_onGenerateTotp);
  }

  Future<void> _onGenerateTotp(
    _GenerateTotp event,
    Emitter<OtpCodeState> emit,
  ) async {
    final res = await generateTotp(GenerateTotpParams(secret: event.secret));
    res.fold(
      (failure) => emit(OtpCodeState.error(failure)),
      (totp) => emit(
        OtpCodeState.generated(
          totp,
          Duration(
            milliseconds: (event.secret.interval.inMilliseconds -
                    (DateTime.now().millisecondsSinceEpoch %
                        (event.secret.interval.inMilliseconds)))
                .floor(),
          ),
        ),
      ),
    );
  }
}
