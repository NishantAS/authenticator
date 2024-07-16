// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'secret_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SecretModel _$SecretModelFromJson(Map<String, dynamic> json) {
  return _SecretModel.fromJson(json);
}

/// @nodoc
mixin _$SecretModel {
  String get value => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  Duration get interval => throw _privateConstructorUsedError;
  bool get isGoogle => throw _privateConstructorUsedError;
  int get length => throw _privateConstructorUsedError;

  /// Serializes this SecretModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SecretModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SecretModelCopyWith<SecretModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SecretModelCopyWith<$Res> {
  factory $SecretModelCopyWith(
          SecretModel value, $Res Function(SecretModel) then) =
      _$SecretModelCopyWithImpl<$Res, SecretModel>;
  @useResult
  $Res call(
      {String value,
      String name,
      String id,
      Duration interval,
      bool isGoogle,
      int length});
}

/// @nodoc
class _$SecretModelCopyWithImpl<$Res, $Val extends SecretModel>
    implements $SecretModelCopyWith<$Res> {
  _$SecretModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SecretModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? name = null,
    Object? id = null,
    Object? interval = null,
    Object? isGoogle = null,
    Object? length = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      interval: null == interval
          ? _value.interval
          : interval // ignore: cast_nullable_to_non_nullable
              as Duration,
      isGoogle: null == isGoogle
          ? _value.isGoogle
          : isGoogle // ignore: cast_nullable_to_non_nullable
              as bool,
      length: null == length
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SecretModelImplCopyWith<$Res>
    implements $SecretModelCopyWith<$Res> {
  factory _$$SecretModelImplCopyWith(
          _$SecretModelImpl value, $Res Function(_$SecretModelImpl) then) =
      __$$SecretModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String value,
      String name,
      String id,
      Duration interval,
      bool isGoogle,
      int length});
}

/// @nodoc
class __$$SecretModelImplCopyWithImpl<$Res>
    extends _$SecretModelCopyWithImpl<$Res, _$SecretModelImpl>
    implements _$$SecretModelImplCopyWith<$Res> {
  __$$SecretModelImplCopyWithImpl(
      _$SecretModelImpl _value, $Res Function(_$SecretModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SecretModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? name = null,
    Object? id = null,
    Object? interval = null,
    Object? isGoogle = null,
    Object? length = null,
  }) {
    return _then(_$SecretModelImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      interval: null == interval
          ? _value.interval
          : interval // ignore: cast_nullable_to_non_nullable
              as Duration,
      isGoogle: null == isGoogle
          ? _value.isGoogle
          : isGoogle // ignore: cast_nullable_to_non_nullable
              as bool,
      length: null == length
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SecretModelImpl implements _SecretModel {
  const _$SecretModelImpl(
      {required this.value,
      required this.name,
      required this.id,
      this.interval = const Duration(seconds: 30),
      this.isGoogle = false,
      this.length = 6});

  factory _$SecretModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SecretModelImplFromJson(json);

  @override
  final String value;
  @override
  final String name;
  @override
  final String id;
  @override
  @JsonKey()
  final Duration interval;
  @override
  @JsonKey()
  final bool isGoogle;
  @override
  @JsonKey()
  final int length;

  @override
  String toString() {
    return 'SecretModel(value: $value, name: $name, id: $id, interval: $interval, isGoogle: $isGoogle, length: $length)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SecretModelImpl &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.interval, interval) ||
                other.interval == interval) &&
            (identical(other.isGoogle, isGoogle) ||
                other.isGoogle == isGoogle) &&
            (identical(other.length, length) || other.length == length));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, value, name, id, interval, isGoogle, length);

  /// Create a copy of SecretModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SecretModelImplCopyWith<_$SecretModelImpl> get copyWith =>
      __$$SecretModelImplCopyWithImpl<_$SecretModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SecretModelImplToJson(
      this,
    );
  }
}

abstract class _SecretModel implements SecretModel {
  const factory _SecretModel(
      {required final String value,
      required final String name,
      required final String id,
      final Duration interval,
      final bool isGoogle,
      final int length}) = _$SecretModelImpl;

  factory _SecretModel.fromJson(Map<String, dynamic> json) =
      _$SecretModelImpl.fromJson;

  @override
  String get value;
  @override
  String get name;
  @override
  String get id;
  @override
  Duration get interval;
  @override
  bool get isGoogle;
  @override
  int get length;

  /// Create a copy of SecretModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SecretModelImplCopyWith<_$SecretModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
