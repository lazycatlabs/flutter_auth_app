// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) {
  return _LoginResponse.fromJson(json);
}

/// @nodoc
mixin _$LoginResponse {
  @JsonKey(name: "diagnostic")
  Diagnostic? get diagnostic => throw _privateConstructorUsedError;
  @JsonKey(name: "data")
  DataLogin? get data => throw _privateConstructorUsedError;

  /// Serializes this LoginResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginResponseCopyWith<LoginResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginResponseCopyWith<$Res> {
  factory $LoginResponseCopyWith(
          LoginResponse value, $Res Function(LoginResponse) then) =
      _$LoginResponseCopyWithImpl<$Res, LoginResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: "diagnostic") Diagnostic? diagnostic,
      @JsonKey(name: "data") DataLogin? data});

  $DiagnosticCopyWith<$Res>? get diagnostic;
  $DataLoginCopyWith<$Res>? get data;
}

/// @nodoc
class _$LoginResponseCopyWithImpl<$Res, $Val extends LoginResponse>
    implements $LoginResponseCopyWith<$Res> {
  _$LoginResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginResponse
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
              as DataLogin?,
    ) as $Val);
  }

  /// Create a copy of LoginResponse
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

  /// Create a copy of LoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DataLoginCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $DataLoginCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LoginResponseImplCopyWith<$Res>
    implements $LoginResponseCopyWith<$Res> {
  factory _$$LoginResponseImplCopyWith(
          _$LoginResponseImpl value, $Res Function(_$LoginResponseImpl) then) =
      __$$LoginResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "diagnostic") Diagnostic? diagnostic,
      @JsonKey(name: "data") DataLogin? data});

  @override
  $DiagnosticCopyWith<$Res>? get diagnostic;
  @override
  $DataLoginCopyWith<$Res>? get data;
}

/// @nodoc
class __$$LoginResponseImplCopyWithImpl<$Res>
    extends _$LoginResponseCopyWithImpl<$Res, _$LoginResponseImpl>
    implements _$$LoginResponseImplCopyWith<$Res> {
  __$$LoginResponseImplCopyWithImpl(
      _$LoginResponseImpl _value, $Res Function(_$LoginResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? diagnostic = freezed,
    Object? data = freezed,
  }) {
    return _then(_$LoginResponseImpl(
      diagnostic: freezed == diagnostic
          ? _value.diagnostic
          : diagnostic // ignore: cast_nullable_to_non_nullable
              as Diagnostic?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DataLogin?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginResponseImpl extends _LoginResponse {
  const _$LoginResponseImpl(
      {@JsonKey(name: "diagnostic") this.diagnostic,
      @JsonKey(name: "data") this.data})
      : super._();

  factory _$LoginResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginResponseImplFromJson(json);

  @override
  @JsonKey(name: "diagnostic")
  final Diagnostic? diagnostic;
  @override
  @JsonKey(name: "data")
  final DataLogin? data;

  @override
  String toString() {
    return 'LoginResponse(diagnostic: $diagnostic, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginResponseImpl &&
            (identical(other.diagnostic, diagnostic) ||
                other.diagnostic == diagnostic) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, diagnostic, data);

  /// Create a copy of LoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginResponseImplCopyWith<_$LoginResponseImpl> get copyWith =>
      __$$LoginResponseImplCopyWithImpl<_$LoginResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginResponseImplToJson(
      this,
    );
  }
}

abstract class _LoginResponse extends LoginResponse {
  const factory _LoginResponse(
      {@JsonKey(name: "diagnostic") final Diagnostic? diagnostic,
      @JsonKey(name: "data") final DataLogin? data}) = _$LoginResponseImpl;
  const _LoginResponse._() : super._();

  factory _LoginResponse.fromJson(Map<String, dynamic> json) =
      _$LoginResponseImpl.fromJson;

  @override
  @JsonKey(name: "diagnostic")
  Diagnostic? get diagnostic;
  @override
  @JsonKey(name: "data")
  DataLogin? get data;

  /// Create a copy of LoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginResponseImplCopyWith<_$LoginResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DataLogin _$DataLoginFromJson(Map<String, dynamic> json) {
  return _DataLogin.fromJson(json);
}

/// @nodoc
mixin _$DataLogin {
  @JsonKey(name: "token")
  String? get token => throw _privateConstructorUsedError;
  @JsonKey(name: "tokenType")
  String? get tokenType => throw _privateConstructorUsedError;

  /// Serializes this DataLogin to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DataLogin
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DataLoginCopyWith<DataLogin> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataLoginCopyWith<$Res> {
  factory $DataLoginCopyWith(DataLogin value, $Res Function(DataLogin) then) =
      _$DataLoginCopyWithImpl<$Res, DataLogin>;
  @useResult
  $Res call(
      {@JsonKey(name: "token") String? token,
      @JsonKey(name: "tokenType") String? tokenType});
}

/// @nodoc
class _$DataLoginCopyWithImpl<$Res, $Val extends DataLogin>
    implements $DataLoginCopyWith<$Res> {
  _$DataLoginCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DataLogin
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
abstract class _$$DataLoginImplCopyWith<$Res>
    implements $DataLoginCopyWith<$Res> {
  factory _$$DataLoginImplCopyWith(
          _$DataLoginImpl value, $Res Function(_$DataLoginImpl) then) =
      __$$DataLoginImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "token") String? token,
      @JsonKey(name: "tokenType") String? tokenType});
}

/// @nodoc
class __$$DataLoginImplCopyWithImpl<$Res>
    extends _$DataLoginCopyWithImpl<$Res, _$DataLoginImpl>
    implements _$$DataLoginImplCopyWith<$Res> {
  __$$DataLoginImplCopyWithImpl(
      _$DataLoginImpl _value, $Res Function(_$DataLoginImpl) _then)
      : super(_value, _then);

  /// Create a copy of DataLogin
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = freezed,
    Object? tokenType = freezed,
  }) {
    return _then(_$DataLoginImpl(
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
class _$DataLoginImpl implements _DataLogin {
  const _$DataLoginImpl(
      {@JsonKey(name: "token") this.token,
      @JsonKey(name: "tokenType") this.tokenType});

  factory _$DataLoginImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataLoginImplFromJson(json);

  @override
  @JsonKey(name: "token")
  final String? token;
  @override
  @JsonKey(name: "tokenType")
  final String? tokenType;

  @override
  String toString() {
    return 'DataLogin(token: $token, tokenType: $tokenType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataLoginImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.tokenType, tokenType) ||
                other.tokenType == tokenType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, token, tokenType);

  /// Create a copy of DataLogin
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DataLoginImplCopyWith<_$DataLoginImpl> get copyWith =>
      __$$DataLoginImplCopyWithImpl<_$DataLoginImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataLoginImplToJson(
      this,
    );
  }
}

abstract class _DataLogin implements DataLogin {
  const factory _DataLogin(
      {@JsonKey(name: "token") final String? token,
      @JsonKey(name: "tokenType") final String? tokenType}) = _$DataLoginImpl;

  factory _DataLogin.fromJson(Map<String, dynamic> json) =
      _$DataLoginImpl.fromJson;

  @override
  @JsonKey(name: "token")
  String? get token;
  @override
  @JsonKey(name: "tokenType")
  String? get tokenType;

  /// Create a copy of DataLogin
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DataLoginImplCopyWith<_$DataLoginImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
