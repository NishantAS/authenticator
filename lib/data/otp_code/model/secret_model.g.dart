// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'secret_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SecretModelImpl _$$SecretModelImplFromJson(Map<String, dynamic> json) =>
    _$SecretModelImpl(
      value: json['value'] as String,
      name: json['name'] as String,
      id: json['id'] as String,
      interval: json['interval'] == null
          ? const Duration(seconds: 30)
          : Duration(microseconds: (json['interval'] as num).toInt()),
      isGoogle: json['isGoogle'] as bool? ?? false,
      length: (json['length'] as num?)?.toInt() ?? 6,
    );

Map<String, dynamic> _$$SecretModelImplToJson(_$SecretModelImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'name': instance.name,
      'id': instance.id,
      'interval': instance.interval.inMicroseconds,
      'isGoogle': instance.isGoogle,
      'length': instance.length,
    };
