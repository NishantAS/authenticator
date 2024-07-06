import 'package:authenticator/domain/otp_code/entities/secret.dart';
import 'package:json/json.dart';

@JsonCodable()
class SecretModel extends Secret {
  final bool isSynced;
  const SecretModel({
    required super.value,
    required super.name,
    super.interval,
    super.isGoogle,
    super.length,
    required this.isSynced,
  });
}
