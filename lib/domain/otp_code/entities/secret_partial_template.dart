import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'secret_partial_template.g.dart';

@JsonSerializable()
class SecretPartialTemplate extends Equatable {
  final String? name;
  final String? value;
  final Duration? interval;
  final int? length;
  final bool? isGoogle;

  const SecretPartialTemplate({
    this.name,
    this.value,
    this.interval,
    this.length,
    this.isGoogle,
  });

  @override
  List<Object?> get props => [
        name,
        value,
        interval,
        length,
        isGoogle,
      ];

  Map<String, dynamic> toJson() => _$SecretPartialTemplateToJson(this);
}
