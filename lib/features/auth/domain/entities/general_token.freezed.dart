// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'general_token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GeneralToken {
  String? get token;

  /// Create a copy of GeneralToken
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GeneralTokenCopyWith<GeneralToken> get copyWith =>
      _$GeneralTokenCopyWithImpl<GeneralToken>(
          this as GeneralToken, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GeneralToken &&
            (identical(other.token, token) || other.token == token));
  }

  @override
  int get hashCode => Object.hash(runtimeType, token);

  @override
  String toString() {
    return 'GeneralToken(token: $token)';
  }
}

/// @nodoc
abstract mixin class $GeneralTokenCopyWith<$Res> {
  factory $GeneralTokenCopyWith(
          GeneralToken value, $Res Function(GeneralToken) _then) =
      _$GeneralTokenCopyWithImpl;
  @useResult
  $Res call({String? token});
}

/// @nodoc
class _$GeneralTokenCopyWithImpl<$Res> implements $GeneralTokenCopyWith<$Res> {
  _$GeneralTokenCopyWithImpl(this._self, this._then);

  final GeneralToken _self;
  final $Res Function(GeneralToken) _then;

  /// Create a copy of GeneralToken
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = freezed,
  }) {
    return _then(_self.copyWith(
      token: freezed == token
          ? _self.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _GeneralToken implements GeneralToken {
  const _GeneralToken({this.token});

  @override
  final String? token;

  /// Create a copy of GeneralToken
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GeneralTokenCopyWith<_GeneralToken> get copyWith =>
      __$GeneralTokenCopyWithImpl<_GeneralToken>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GeneralToken &&
            (identical(other.token, token) || other.token == token));
  }

  @override
  int get hashCode => Object.hash(runtimeType, token);

  @override
  String toString() {
    return 'GeneralToken(token: $token)';
  }
}

/// @nodoc
abstract mixin class _$GeneralTokenCopyWith<$Res>
    implements $GeneralTokenCopyWith<$Res> {
  factory _$GeneralTokenCopyWith(
          _GeneralToken value, $Res Function(_GeneralToken) _then) =
      __$GeneralTokenCopyWithImpl;
  @override
  @useResult
  $Res call({String? token});
}

/// @nodoc
class __$GeneralTokenCopyWithImpl<$Res>
    implements _$GeneralTokenCopyWith<$Res> {
  __$GeneralTokenCopyWithImpl(this._self, this._then);

  final _GeneralToken _self;
  final $Res Function(_GeneralToken) _then;

  /// Create a copy of GeneralToken
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? token = freezed,
  }) {
    return _then(_GeneralToken(
      token: freezed == token
          ? _self.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
