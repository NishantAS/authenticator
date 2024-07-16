// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'secret_template.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SecretTemplate _$SecretTemplateFromJson(Map<String, dynamic> json) =>
    SecretTemplate(
      name: json['name'] as String,
      value: json['value'] as String,
      interval: Duration(microseconds: (json['interval'] as num).toInt()),
      length: (json['length'] as num).toInt(),
      isGoogle: json['isGoogle'] as bool,
    );

Map<String, dynamic> _$SecretTemplateToJson(SecretTemplate instance) =>
    <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
      'interval': instance.interval.inMicroseconds,
      'length': instance.length,
      'isGoogle': instance.isGoogle,
    };
