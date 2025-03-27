// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LoginResponse {
  @JsonKey(name: "diagnostic")
  Diagnostic? get diagnostic;
  @JsonKey(name: "data")
  DataLogin? get data;

  /// Create a copy of LoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoginResponseCopyWith<LoginResponse> get copyWith =>
      _$LoginResponseCopyWithImpl<LoginResponse>(
          this as LoginResponse, _$identity);

  /// Serializes this LoginResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoginResponse &&
            (identical(other.diagnostic, diagnostic) ||
                other.diagnostic == diagnostic) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, diagnostic, data);

  @override
  String toString() {
    return 'LoginResponse(diagnostic: $diagnostic, data: $data)';
  }
}

/// @nodoc
abstract mixin class $LoginResponseCopyWith<$Res> {
  factory $LoginResponseCopyWith(
          LoginResponse value, $Res Function(LoginResponse) _then) =
      _$LoginResponseCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "diagnostic") Diagnostic? diagnostic,
      @JsonKey(name: "data") DataLogin? data});

  $DiagnosticCopyWith<$Res>? get diagnostic;
  $DataLoginCopyWith<$Res>? get data;
}

/// @nodoc
class _$LoginResponseCopyWithImpl<$Res>
    implements $LoginResponseCopyWith<$Res> {
  _$LoginResponseCopyWithImpl(this._self, this._then);

  final LoginResponse _self;
  final $Res Function(LoginResponse) _then;

  /// Create a copy of LoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? diagnostic = freezed,
    Object? data = freezed,
  }) {
    return _then(_self.copyWith(
      diagnostic: freezed == diagnostic
          ? _self.diagnostic
          : diagnostic // ignore: cast_nullable_to_non_nullable
              as Diagnostic?,
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as DataLogin?,
    ));
  }

  /// Create a copy of LoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DiagnosticCopyWith<$Res>? get diagnostic {
    if (_self.diagnostic == null) {
      return null;
    }

    return $DiagnosticCopyWith<$Res>(_self.diagnostic!, (value) {
      return _then(_self.copyWith(diagnostic: value));
    });
  }

  /// Create a copy of LoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DataLoginCopyWith<$Res>? get data {
    if (_self.data == null) {
      return null;
    }

    return $DataLoginCopyWith<$Res>(_self.data!, (value) {
      return _then(_self.copyWith(data: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _LoginResponse extends LoginResponse {
  const _LoginResponse(
      {@JsonKey(name: "diagnostic") this.diagnostic,
      @JsonKey(name: "data") this.data})
      : super._();
  factory _LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  @override
  @JsonKey(name: "diagnostic")
  final Diagnostic? diagnostic;
  @override
  @JsonKey(name: "data")
  final DataLogin? data;

  /// Create a copy of LoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoginResponseCopyWith<_LoginResponse> get copyWith =>
      __$LoginResponseCopyWithImpl<_LoginResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LoginResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoginResponse &&
            (identical(other.diagnostic, diagnostic) ||
                other.diagnostic == diagnostic) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, diagnostic, data);

  @override
  String toString() {
    return 'LoginResponse(diagnostic: $diagnostic, data: $data)';
  }
}

/// @nodoc
abstract mixin class _$LoginResponseCopyWith<$Res>
    implements $LoginResponseCopyWith<$Res> {
  factory _$LoginResponseCopyWith(
          _LoginResponse value, $Res Function(_LoginResponse) _then) =
      __$LoginResponseCopyWithImpl;
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
class __$LoginResponseCopyWithImpl<$Res>
    implements _$LoginResponseCopyWith<$Res> {
  __$LoginResponseCopyWithImpl(this._self, this._then);

  final _LoginResponse _self;
  final $Res Function(_LoginResponse) _then;

  /// Create a copy of LoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? diagnostic = freezed,
    Object? data = freezed,
  }) {
    return _then(_LoginResponse(
      diagnostic: freezed == diagnostic
          ? _self.diagnostic
          : diagnostic // ignore: cast_nullable_to_non_nullable
              as Diagnostic?,
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as DataLogin?,
    ));
  }

  /// Create a copy of LoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DiagnosticCopyWith<$Res>? get diagnostic {
    if (_self.diagnostic == null) {
      return null;
    }

    return $DiagnosticCopyWith<$Res>(_self.diagnostic!, (value) {
      return _then(_self.copyWith(diagnostic: value));
    });
  }

  /// Create a copy of LoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DataLoginCopyWith<$Res>? get data {
    if (_self.data == null) {
      return null;
    }

    return $DataLoginCopyWith<$Res>(_self.data!, (value) {
      return _then(_self.copyWith(data: value));
    });
  }
}

/// @nodoc
mixin _$DataLogin {
  @JsonKey(name: "token")
  String? get token;
  @JsonKey(name: "tokenType")
  String? get tokenType;

  /// Create a copy of DataLogin
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DataLoginCopyWith<DataLogin> get copyWith =>
      _$DataLoginCopyWithImpl<DataLogin>(this as DataLogin, _$identity);

  /// Serializes this DataLogin to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DataLogin &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.tokenType, tokenType) ||
                other.tokenType == tokenType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, token, tokenType);

  @override
  String toString() {
    return 'DataLogin(token: $token, tokenType: $tokenType)';
  }
}

/// @nodoc
abstract mixin class $DataLoginCopyWith<$Res> {
  factory $DataLoginCopyWith(DataLogin value, $Res Function(DataLogin) _then) =
      _$DataLoginCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "token") String? token,
      @JsonKey(name: "tokenType") String? tokenType});
}

/// @nodoc
class _$DataLoginCopyWithImpl<$Res> implements $DataLoginCopyWith<$Res> {
  _$DataLoginCopyWithImpl(this._self, this._then);

  final DataLogin _self;
  final $Res Function(DataLogin) _then;

  /// Create a copy of DataLogin
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = freezed,
    Object? tokenType = freezed,
  }) {
    return _then(_self.copyWith(
      token: freezed == token
          ? _self.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenType: freezed == tokenType
          ? _self.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _DataLogin implements DataLogin {
  const _DataLogin(
      {@JsonKey(name: "token") this.token,
      @JsonKey(name: "tokenType") this.tokenType});
  factory _DataLogin.fromJson(Map<String, dynamic> json) =>
      _$DataLoginFromJson(json);

  @override
  @JsonKey(name: "token")
  final String? token;
  @override
  @JsonKey(name: "tokenType")
  final String? tokenType;

  /// Create a copy of DataLogin
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DataLoginCopyWith<_DataLogin> get copyWith =>
      __$DataLoginCopyWithImpl<_DataLogin>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DataLoginToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DataLogin &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.tokenType, tokenType) ||
                other.tokenType == tokenType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, token, tokenType);

  @override
  String toString() {
    return 'DataLogin(token: $token, tokenType: $tokenType)';
  }
}

/// @nodoc
abstract mixin class _$DataLoginCopyWith<$Res>
    implements $DataLoginCopyWith<$Res> {
  factory _$DataLoginCopyWith(
          _DataLogin value, $Res Function(_DataLogin) _then) =
      __$DataLoginCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "token") String? token,
      @JsonKey(name: "tokenType") String? tokenType});
}

/// @nodoc
class __$DataLoginCopyWithImpl<$Res> implements _$DataLoginCopyWith<$Res> {
  __$DataLoginCopyWithImpl(this._self, this._then);

  final _DataLogin _self;
  final $Res Function(_DataLogin) _then;

  /// Create a copy of DataLogin
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? token = freezed,
    Object? tokenType = freezed,
  }) {
    return _then(_DataLogin(
      token: freezed == token
          ? _self.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenType: freezed == tokenType
          ? _self.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
