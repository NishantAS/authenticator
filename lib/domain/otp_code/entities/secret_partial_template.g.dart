// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'secret_partial_template.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SecretPartialTemplate _$SecretPartialTemplateFromJson(
        Map<String, dynamic> json) =>
    SecretPartialTemplate(
      name: json['name'] as String?,
      value: json['value'] as String?,
      interval: json['interval'] == null
          ? null
          : Duration(microseconds: (json['interval'] as num).toInt()),
      length: (json['length'] as num?)?.toInt(),
      isGoogle: json['isGoogle'] as bool?,
    );

Map<String, dynamic> _$SecretPartialTemplateToJson(
        SecretPartialTemplate instance) =>
    <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
      'interval': instance.interval?.inMicroseconds,
      'length': instance.length,
      'isGoogle': instance.isGoogle,
    };
