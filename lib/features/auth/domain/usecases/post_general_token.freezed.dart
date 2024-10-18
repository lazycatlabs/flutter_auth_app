// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_general_token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GeneralTokenParams _$GeneralTokenParamsFromJson(Map<String, dynamic> json) {
  return _GeneralTokenParams.fromJson(json);
}

/// @nodoc
mixin _$GeneralTokenParams {
  String? get clientId => throw _privateConstructorUsedError;
  String? get clientSecret => throw _privateConstructorUsedError;

  /// Serializes this GeneralTokenParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GeneralTokenParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GeneralTokenParamsCopyWith<GeneralTokenParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeneralTokenParamsCopyWith<$Res> {
  factory $GeneralTokenParamsCopyWith(
          GeneralTokenParams value, $Res Function(GeneralTokenParams) then) =
      _$GeneralTokenParamsCopyWithImpl<$Res, GeneralTokenParams>;
  @useResult
  $Res call({String? clientId, String? clientSecret});
}

/// @nodoc
class _$GeneralTokenParamsCopyWithImpl<$Res, $Val extends GeneralTokenParams>
    implements $GeneralTokenParamsCopyWith<$Res> {
  _$GeneralTokenParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GeneralTokenParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientId = freezed,
    Object? clientSecret = freezed,
  }) {
    return _then(_value.copyWith(
      clientId: freezed == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as String?,
      clientSecret: freezed == clientSecret
          ? _value.clientSecret
          : clientSecret // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GeneralTokenParamsImplCopyWith<$Res>
    implements $GeneralTokenParamsCopyWith<$Res> {
  factory _$$GeneralTokenParamsImplCopyWith(_$GeneralTokenParamsImpl value,
          $Res Function(_$GeneralTokenParamsImpl) then) =
      __$$GeneralTokenParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? clientId, String? clientSecret});
}

/// @nodoc
class __$$GeneralTokenParamsImplCopyWithImpl<$Res>
    extends _$GeneralTokenParamsCopyWithImpl<$Res, _$GeneralTokenParamsImpl>
    implements _$$GeneralTokenParamsImplCopyWith<$Res> {
  __$$GeneralTokenParamsImplCopyWithImpl(_$GeneralTokenParamsImpl _value,
      $Res Function(_$GeneralTokenParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of GeneralTokenParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientId = freezed,
    Object? clientSecret = freezed,
  }) {
    return _then(_$GeneralTokenParamsImpl(
      clientId: freezed == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as String?,
      clientSecret: freezed == clientSecret
          ? _value.clientSecret
          : clientSecret // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GeneralTokenParamsImpl implements _GeneralTokenParams {
  const _$GeneralTokenParamsImpl({this.clientId, this.clientSecret});

  factory _$GeneralTokenParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$GeneralTokenParamsImplFromJson(json);

  @override
  final String? clientId;
  @override
  final String? clientSecret;

  @override
  String toString() {
    return 'GeneralTokenParams(clientId: $clientId, clientSecret: $clientSecret)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeneralTokenParamsImpl &&
            (identical(other.clientId, clientId) ||
                other.clientId == clientId) &&
            (identical(other.clientSecret, clientSecret) ||
                other.clientSecret == clientSecret));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, clientId, clientSecret);

  /// Create a copy of GeneralTokenParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GeneralTokenParamsImplCopyWith<_$GeneralTokenParamsImpl> get copyWith =>
      __$$GeneralTokenParamsImplCopyWithImpl<_$GeneralTokenParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GeneralTokenParamsImplToJson(
      this,
    );
  }
}

abstract class _GeneralTokenParams implements GeneralTokenParams {
  const factory _GeneralTokenParams(
      {final String? clientId,
      final String? clientSecret}) = _$GeneralTokenParamsImpl;

  factory _GeneralTokenParams.fromJson(Map<String, dynamic> json) =
      _$GeneralTokenParamsImpl.fromJson;

  @override
  String? get clientId;
  @override
  String? get clientSecret;

  /// Create a copy of GeneralTokenParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GeneralTokenParamsImplCopyWith<_$GeneralTokenParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
