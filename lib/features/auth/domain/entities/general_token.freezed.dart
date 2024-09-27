// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'general_token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GeneralToken {
  String? get token => throw _privateConstructorUsedError;

  /// Create a copy of GeneralToken
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GeneralTokenCopyWith<GeneralToken> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeneralTokenCopyWith<$Res> {
  factory $GeneralTokenCopyWith(
          GeneralToken value, $Res Function(GeneralToken) then) =
      _$GeneralTokenCopyWithImpl<$Res, GeneralToken>;
  @useResult
  $Res call({String? token});
}

/// @nodoc
class _$GeneralTokenCopyWithImpl<$Res, $Val extends GeneralToken>
    implements $GeneralTokenCopyWith<$Res> {
  _$GeneralTokenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GeneralToken
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = freezed,
  }) {
    return _then(_value.copyWith(
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GeneralTokenImplCopyWith<$Res>
    implements $GeneralTokenCopyWith<$Res> {
  factory _$$GeneralTokenImplCopyWith(
          _$GeneralTokenImpl value, $Res Function(_$GeneralTokenImpl) then) =
      __$$GeneralTokenImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? token});
}

/// @nodoc
class __$$GeneralTokenImplCopyWithImpl<$Res>
    extends _$GeneralTokenCopyWithImpl<$Res, _$GeneralTokenImpl>
    implements _$$GeneralTokenImplCopyWith<$Res> {
  __$$GeneralTokenImplCopyWithImpl(
      _$GeneralTokenImpl _value, $Res Function(_$GeneralTokenImpl) _then)
      : super(_value, _then);

  /// Create a copy of GeneralToken
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = freezed,
  }) {
    return _then(_$GeneralTokenImpl(
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$GeneralTokenImpl implements _GeneralToken {
  const _$GeneralTokenImpl({this.token});

  @override
  final String? token;

  @override
  String toString() {
    return 'GeneralToken(token: $token)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeneralTokenImpl &&
            (identical(other.token, token) || other.token == token));
  }

  @override
  int get hashCode => Object.hash(runtimeType, token);

  /// Create a copy of GeneralToken
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GeneralTokenImplCopyWith<_$GeneralTokenImpl> get copyWith =>
      __$$GeneralTokenImplCopyWithImpl<_$GeneralTokenImpl>(this, _$identity);
}

abstract class _GeneralToken implements GeneralToken {
  const factory _GeneralToken({final String? token}) = _$GeneralTokenImpl;

  @override
  String? get token;

  /// Create a copy of GeneralToken
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GeneralTokenImplCopyWith<_$GeneralTokenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
