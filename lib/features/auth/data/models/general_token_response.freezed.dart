// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'general_token_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GeneralTokenResponse {
  @JsonKey(name: "diagnostic")
  Diagnostic? get diagnostic;
  @JsonKey(name: "data")
  DataGeneralToken? get data;

  /// Create a copy of GeneralTokenResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GeneralTokenResponseCopyWith<GeneralTokenResponse> get copyWith =>
      _$GeneralTokenResponseCopyWithImpl<GeneralTokenResponse>(
          this as GeneralTokenResponse, _$identity);

  /// Serializes this GeneralTokenResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GeneralTokenResponse &&
            (identical(other.diagnostic, diagnostic) ||
                other.diagnostic == diagnostic) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, diagnostic, data);

  @override
  String toString() {
    return 'GeneralTokenResponse(diagnostic: $diagnostic, data: $data)';
  }
}

/// @nodoc
abstract mixin class $GeneralTokenResponseCopyWith<$Res> {
  factory $GeneralTokenResponseCopyWith(GeneralTokenResponse value,
          $Res Function(GeneralTokenResponse) _then) =
      _$GeneralTokenResponseCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "diagnostic") Diagnostic? diagnostic,
      @JsonKey(name: "data") DataGeneralToken? data});

  $DiagnosticCopyWith<$Res>? get diagnostic;
  $DataGeneralTokenCopyWith<$Res>? get data;
}

/// @nodoc
class _$GeneralTokenResponseCopyWithImpl<$Res>
    implements $GeneralTokenResponseCopyWith<$Res> {
  _$GeneralTokenResponseCopyWithImpl(this._self, this._then);

  final GeneralTokenResponse _self;
  final $Res Function(GeneralTokenResponse) _then;

  /// Create a copy of GeneralTokenResponse
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
              as DataGeneralToken?,
    ));
  }

  /// Create a copy of GeneralTokenResponse
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

  /// Create a copy of GeneralTokenResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DataGeneralTokenCopyWith<$Res>? get data {
    if (_self.data == null) {
      return null;
    }

    return $DataGeneralTokenCopyWith<$Res>(_self.data!, (value) {
      return _then(_self.copyWith(data: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _GeneralTokenResponse extends GeneralTokenResponse {
  const _GeneralTokenResponse(
      {@JsonKey(name: "diagnostic") this.diagnostic,
      @JsonKey(name: "data") this.data})
      : super._();
  factory _GeneralTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$GeneralTokenResponseFromJson(json);

  @override
  @JsonKey(name: "diagnostic")
  final Diagnostic? diagnostic;
  @override
  @JsonKey(name: "data")
  final DataGeneralToken? data;

  /// Create a copy of GeneralTokenResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GeneralTokenResponseCopyWith<_GeneralTokenResponse> get copyWith =>
      __$GeneralTokenResponseCopyWithImpl<_GeneralTokenResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$GeneralTokenResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GeneralTokenResponse &&
            (identical(other.diagnostic, diagnostic) ||
                other.diagnostic == diagnostic) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, diagnostic, data);

  @override
  String toString() {
    return 'GeneralTokenResponse(diagnostic: $diagnostic, data: $data)';
  }
}

/// @nodoc
abstract mixin class _$GeneralTokenResponseCopyWith<$Res>
    implements $GeneralTokenResponseCopyWith<$Res> {
  factory _$GeneralTokenResponseCopyWith(_GeneralTokenResponse value,
          $Res Function(_GeneralTokenResponse) _then) =
      __$GeneralTokenResponseCopyWithImpl;
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
class __$GeneralTokenResponseCopyWithImpl<$Res>
    implements _$GeneralTokenResponseCopyWith<$Res> {
  __$GeneralTokenResponseCopyWithImpl(this._self, this._then);

  final _GeneralTokenResponse _self;
  final $Res Function(_GeneralTokenResponse) _then;

  /// Create a copy of GeneralTokenResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? diagnostic = freezed,
    Object? data = freezed,
  }) {
    return _then(_GeneralTokenResponse(
      diagnostic: freezed == diagnostic
          ? _self.diagnostic
          : diagnostic // ignore: cast_nullable_to_non_nullable
              as Diagnostic?,
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as DataGeneralToken?,
    ));
  }

  /// Create a copy of GeneralTokenResponse
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

  /// Create a copy of GeneralTokenResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DataGeneralTokenCopyWith<$Res>? get data {
    if (_self.data == null) {
      return null;
    }

    return $DataGeneralTokenCopyWith<$Res>(_self.data!, (value) {
      return _then(_self.copyWith(data: value));
    });
  }
}

/// @nodoc
mixin _$DataGeneralToken {
  @JsonKey(name: "token")
  String? get token;
  @JsonKey(name: "tokenType")
  String? get tokenType;

  /// Create a copy of DataGeneralToken
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DataGeneralTokenCopyWith<DataGeneralToken> get copyWith =>
      _$DataGeneralTokenCopyWithImpl<DataGeneralToken>(
          this as DataGeneralToken, _$identity);

  /// Serializes this DataGeneralToken to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DataGeneralToken &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.tokenType, tokenType) ||
                other.tokenType == tokenType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, token, tokenType);

  @override
  String toString() {
    return 'DataGeneralToken(token: $token, tokenType: $tokenType)';
  }
}

/// @nodoc
abstract mixin class $DataGeneralTokenCopyWith<$Res> {
  factory $DataGeneralTokenCopyWith(
          DataGeneralToken value, $Res Function(DataGeneralToken) _then) =
      _$DataGeneralTokenCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "token") String? token,
      @JsonKey(name: "tokenType") String? tokenType});
}

/// @nodoc
class _$DataGeneralTokenCopyWithImpl<$Res>
    implements $DataGeneralTokenCopyWith<$Res> {
  _$DataGeneralTokenCopyWithImpl(this._self, this._then);

  final DataGeneralToken _self;
  final $Res Function(DataGeneralToken) _then;

  /// Create a copy of DataGeneralToken
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
class _DataGeneralToken implements DataGeneralToken {
  const _DataGeneralToken(
      {@JsonKey(name: "token") this.token,
      @JsonKey(name: "tokenType") this.tokenType});
  factory _DataGeneralToken.fromJson(Map<String, dynamic> json) =>
      _$DataGeneralTokenFromJson(json);

  @override
  @JsonKey(name: "token")
  final String? token;
  @override
  @JsonKey(name: "tokenType")
  final String? tokenType;

  /// Create a copy of DataGeneralToken
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DataGeneralTokenCopyWith<_DataGeneralToken> get copyWith =>
      __$DataGeneralTokenCopyWithImpl<_DataGeneralToken>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DataGeneralTokenToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DataGeneralToken &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.tokenType, tokenType) ||
                other.tokenType == tokenType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, token, tokenType);

  @override
  String toString() {
    return 'DataGeneralToken(token: $token, tokenType: $tokenType)';
  }
}

/// @nodoc
abstract mixin class _$DataGeneralTokenCopyWith<$Res>
    implements $DataGeneralTokenCopyWith<$Res> {
  factory _$DataGeneralTokenCopyWith(
          _DataGeneralToken value, $Res Function(_DataGeneralToken) _then) =
      __$DataGeneralTokenCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "token") String? token,
      @JsonKey(name: "tokenType") String? tokenType});
}

/// @nodoc
class __$DataGeneralTokenCopyWithImpl<$Res>
    implements _$DataGeneralTokenCopyWith<$Res> {
  __$DataGeneralTokenCopyWithImpl(this._self, this._then);

  final _DataGeneralToken _self;
  final $Res Function(_DataGeneralToken) _then;

  /// Create a copy of DataGeneralToken
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? token = freezed,
    Object? tokenType = freezed,
  }) {
    return _then(_DataGeneralToken(
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
