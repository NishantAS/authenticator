import 'package:authenticator/domain/otp_code/entities/secret.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'secret_model.g.dart';
part 'secret_model.freezed.dart';

@freezed
class SecretModel with _$SecretModel implements Secret {
  const factory SecretModel({
    required final String value,
    required final String name,
    required final String id,
    @Default(Duration(seconds: 30)) final Duration interval,
    @Default(false) final bool isGoogle,
    @Default(6) final int length,
  }) = _SecretModel;

  factory SecretModel.fromJson(Map<String, dynamic> json) =>
      _$SecretModelFromJson(json);
}
