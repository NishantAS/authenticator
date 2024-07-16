import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'secret_template.g.dart';

@JsonSerializable()
class SecretTemplate extends Equatable {
  final String name;
  final String value;
  final Duration interval;
  final int length;
  final bool isGoogle;

  const SecretTemplate({
    required this.name,
    required this.value,
    required this.interval,
    required this.length,
    required this.isGoogle,
  });

  Map<String, dynamic> toJson() => _$SecretTemplateToJson(this);

  @override
  List<Object?> get props => [
        name,
        value,
        interval,
        length,
        isGoogle,
      ];
}
