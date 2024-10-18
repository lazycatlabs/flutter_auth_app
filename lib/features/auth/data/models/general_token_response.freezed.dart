// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'general_token_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GeneralTokenResponse _$GeneralTokenResponseFromJson(Map<String, dynamic> json) {
  return _GeneralTokenResponse.fromJson(json);
}

/// @nodoc
mixin _$GeneralTokenResponse {
  @JsonKey(name: "diagnostic")
  Diagnostic? get diagnostic => throw _privateConstructorUsedError;
  @JsonKey(name: "data")
  DataGeneralToken? get data => throw _privateConstructorUsedError;

  /// Serializes this GeneralTokenResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GeneralTokenResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GeneralTokenResponseCopyWith<GeneralTokenResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeneralTokenResponseCopyWith<$Res> {
  factory $GeneralTokenResponseCopyWith(GeneralTokenResponse value,
          $Res Function(GeneralTokenResponse) then) =
      _$GeneralTokenResponseCopyWithImpl<$Res, GeneralTokenResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: "diagnostic") Diagnostic? diagnostic,
      @JsonKey(name: "data") DataGeneralToken? data});

  $DiagnosticCopyWith<$Res>? get diagnostic;
  $DataGeneralTokenCopyWith<$Res>? get data;
}

/// @nodoc
class _$GeneralTokenResponseCopyWithImpl<$Res,
        $Val extends GeneralTokenResponse>
    implements $GeneralTokenResponseCopyWith<$Res> {
  _$GeneralTokenResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GeneralTokenResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? diagnostic = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      diagnostic: freezed == diagnostic
          ? _value.diagnostic
          : diagnostic // ignore: cast_nullable_to_non_nullable
              as Diagnostic?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DataGeneralToken?,
    ) as $Val);
  }

  /// Create a copy of GeneralTokenResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DiagnosticCopyWith<$Res>? get diagnostic {
    if (_value.diagnostic == null) {
      return null;
    }

    return $DiagnosticCopyWith<$Res>(_value.diagnostic!, (value) {
      return _then(_value.copyWith(diagnostic: value) as $Val);
    });
  }

  /// Create a copy of GeneralTokenResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DataGeneralTokenCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $DataGeneralTokenCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GeneralTokenResponseImplCopyWith<$Res>
    implements $GeneralTokenResponseCopyWith<$Res> {
  factory _$$GeneralTokenResponseImplCopyWith(_$GeneralTokenResponseImpl value,
          $Res Function(_$GeneralTokenResponseImpl) then) =
      __$$GeneralTokenResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "diagnostic") Diagnostic? diagnostic,
      @JsonKey(name: "data") DataGeneralToken? data});

  @override
  $DiagnosticCopyWith<$Res>? get diagnostic;
  @override
  $DataGeneralTokenCopyWith<$Res>? get data;
}

/// @nodoc
class __$$GeneralTokenResponseImplCopyWithImpl<$Res>
    extends _$GeneralTokenResponseCopyWithImpl<$Res, _$GeneralTokenResponseImpl>
    implements _$$GeneralTokenResponseImplCopyWith<$Res> {
  __$$GeneralTokenResponseImplCopyWithImpl(_$GeneralTokenResponseImpl _value,
      $Res Function(_$GeneralTokenResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of GeneralTokenResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? diagnostic = freezed,
    Object? data = freezed,
  }) {
    return _then(_$GeneralTokenResponseImpl(
      diagnostic: freezed == diagnostic
          ? _value.diagnostic
          : diagnostic // ignore: cast_nullable_to_non_nullable
              as Diagnostic?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DataGeneralToken?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GeneralTokenResponseImpl extends _GeneralTokenResponse {
  const _$GeneralTokenResponseImpl(
      {@JsonKey(name: "diagnostic") this.diagnostic,
      @JsonKey(name: "data") this.data})
      : super._();

  factory _$GeneralTokenResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GeneralTokenResponseImplFromJson(json);

  @override
  @JsonKey(name: "diagnostic")
  final Diagnostic? diagnostic;
  @override
  @JsonKey(name: "data")
  final DataGeneralToken? data;

  @override
  String toString() {
    return 'GeneralTokenResponse(diagnostic: $diagnostic, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeneralTokenResponseImpl &&
            (identical(other.diagnostic, diagnostic) ||
                other.diagnostic == diagnostic) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, diagnostic, data);

  /// Create a copy of GeneralTokenResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GeneralTokenResponseImplCopyWith<_$GeneralTokenResponseImpl>
      get copyWith =>
          __$$GeneralTokenResponseImplCopyWithImpl<_$GeneralTokenResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GeneralTokenResponseImplToJson(
      this,
    );
  }
}

abstract class _GeneralTokenResponse extends GeneralTokenResponse {
  const factory _GeneralTokenResponse(
          {@JsonKey(name: "diagnostic") final Diagnostic? diagnostic,
          @JsonKey(name: "data") final DataGeneralToken? data}) =
      _$GeneralTokenResponseImpl;
  const _GeneralTokenResponse._() : super._();

  factory _GeneralTokenResponse.fromJson(Map<String, dynamic> json) =
      _$GeneralTokenResponseImpl.fromJson;

  @override
  @JsonKey(name: "diagnostic")
  Diagnostic? get diagnostic;
  @override
  @JsonKey(name: "data")
  DataGeneralToken? get data;

  /// Create a copy of GeneralTokenResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GeneralTokenResponseImplCopyWith<_$GeneralTokenResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

DataGeneralToken _$DataGeneralTokenFromJson(Map<String, dynamic> json) {
  return _DataGeneralToken.fromJson(json);
}

/// @nodoc
mixin _$DataGeneralToken {
  @JsonKey(name: "token")
  String? get token => throw _privateConstructorUsedError;
  @JsonKey(name: "tokenType")
  String? get tokenType => throw _privateConstructorUsedError;

  /// Serializes this DataGeneralToken to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DataGeneralToken
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DataGeneralTokenCopyWith<DataGeneralToken> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataGeneralTokenCopyWith<$Res> {
  factory $DataGeneralTokenCopyWith(
          DataGeneralToken value, $Res Function(DataGeneralToken) then) =
      _$DataGeneralTokenCopyWithImpl<$Res, DataGeneralToken>;
  @useResult
  $Res call(
      {@JsonKey(name: "token") String? token,
      @JsonKey(name: "tokenType") String? tokenType});
}

/// @nodoc
class _$DataGeneralTokenCopyWithImpl<$Res, $Val extends DataGeneralToken>
    implements $DataGeneralTokenCopyWith<$Res> {
  _$DataGeneralTokenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DataGeneralToken
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = freezed,
    Object? tokenType = freezed,
  }) {
    return _then(_value.copyWith(
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenType: freezed == tokenType
          ? _value.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DataGeneralTokenImplCopyWith<$Res>
    implements $DataGeneralTokenCopyWith<$Res> {
  factory _$$DataGeneralTokenImplCopyWith(_$DataGeneralTokenImpl value,
          $Res Function(_$DataGeneralTokenImpl) then) =
      __$$DataGeneralTokenImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "token") String? token,
      @JsonKey(name: "tokenType") String? tokenType});
}

/// @nodoc
class __$$DataGeneralTokenImplCopyWithImpl<$Res>
    extends _$DataGeneralTokenCopyWithImpl<$Res, _$DataGeneralTokenImpl>
    implements _$$DataGeneralTokenImplCopyWith<$Res> {
  __$$DataGeneralTokenImplCopyWithImpl(_$DataGeneralTokenImpl _value,
      $Res Function(_$DataGeneralTokenImpl) _then)
      : super(_value, _then);

  /// Create a copy of DataGeneralToken
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = freezed,
    Object? tokenType = freezed,
  }) {
    return _then(_$DataGeneralTokenImpl(
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenType: freezed == tokenType
          ? _value.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataGeneralTokenImpl implements _DataGeneralToken {
  const _$DataGeneralTokenImpl(
      {@JsonKey(name: "token") this.token,
      @JsonKey(name: "tokenType") this.tokenType});

  factory _$DataGeneralTokenImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataGeneralTokenImplFromJson(json);

  @override
  @JsonKey(name: "token")
  final String? token;
  @override
  @JsonKey(name: "tokenType")
  final String? tokenType;

  @override
  String toString() {
    return 'DataGeneralToken(token: $token, tokenType: $tokenType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataGeneralTokenImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.tokenType, tokenType) ||
                other.tokenType == tokenType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, token, tokenType);

  /// Create a copy of DataGeneralToken
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DataGeneralTokenImplCopyWith<_$DataGeneralTokenImpl> get copyWith =>
      __$$DataGeneralTokenImplCopyWithImpl<_$DataGeneralTokenImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataGeneralTokenImplToJson(
      this,
    );
  }
}

abstract class _DataGeneralToken implements DataGeneralToken {
  const factory _DataGeneralToken(
          {@JsonKey(name: "token") final String? token,
          @JsonKey(name: "tokenType") final String? tokenType}) =
      _$DataGeneralTokenImpl;

  factory _DataGeneralToken.fromJson(Map<String, dynamic> json) =
      _$DataGeneralTokenImpl.fromJson;

  @override
  @JsonKey(name: "token")
  String? get token;
  @override
  @JsonKey(name: "tokenType")
  String? get tokenType;

  /// Create a copy of DataGeneralToken
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DataGeneralTokenImplCopyWith<_$DataGeneralTokenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
