import 'package:authenticator/domain/otp_code/entities/secret.dart';
import 'package:otp/otp.dart';

abstract class OtpPackageDatasource {
  int genTotp(Secret secret);
}

class OtpPackageDatasourceImpl implements OtpPackageDatasource {
  @override
  int genTotp(Secret secret) => OTP.generateTOTPCode(
        secret.value,
        DateTime.now().millisecondsSinceEpoch,
        interval: secret.interval.inSeconds,
        isGoogle: secret.isGoogle,
        length: secret.length,
      );
}
