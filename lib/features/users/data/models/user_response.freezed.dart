// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserResponse {
  @JsonKey(name: "diagnostic")
  Diagnostic? get diagnostic;
  @JsonKey(name: "data")
  DataUser? get data;

  /// Create a copy of UserResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserResponseCopyWith<UserResponse> get copyWith =>
      _$UserResponseCopyWithImpl<UserResponse>(
          this as UserResponse, _$identity);

  /// Serializes this UserResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserResponse &&
            (identical(other.diagnostic, diagnostic) ||
                other.diagnostic == diagnostic) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, diagnostic, data);

  @override
  String toString() {
    return 'UserResponse(diagnostic: $diagnostic, data: $data)';
  }
}

/// @nodoc
abstract mixin class $UserResponseCopyWith<$Res> {
  factory $UserResponseCopyWith(
          UserResponse value, $Res Function(UserResponse) _then) =
      _$UserResponseCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "diagnostic") Diagnostic? diagnostic,
      @JsonKey(name: "data") DataUser? data});

  $DiagnosticCopyWith<$Res>? get diagnostic;
  $DataUserCopyWith<$Res>? get data;
}

/// @nodoc
class _$UserResponseCopyWithImpl<$Res> implements $UserResponseCopyWith<$Res> {
  _$UserResponseCopyWithImpl(this._self, this._then);

  final UserResponse _self;
  final $Res Function(UserResponse) _then;

  /// Create a copy of UserResponse
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
              as DataUser?,
    ));
  }

  /// Create a copy of UserResponse
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

  /// Create a copy of UserResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DataUserCopyWith<$Res>? get data {
    if (_self.data == null) {
      return null;
    }

    return $DataUserCopyWith<$Res>(_self.data!, (value) {
      return _then(_self.copyWith(data: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _UserResponse extends UserResponse {
  const _UserResponse(
      {@JsonKey(name: "diagnostic") this.diagnostic,
      @JsonKey(name: "data") this.data})
      : super._();
  factory _UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  @override
  @JsonKey(name: "diagnostic")
  final Diagnostic? diagnostic;
  @override
  @JsonKey(name: "data")
  final DataUser? data;

  /// Create a copy of UserResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserResponseCopyWith<_UserResponse> get copyWith =>
      __$UserResponseCopyWithImpl<_UserResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserResponse &&
            (identical(other.diagnostic, diagnostic) ||
                other.diagnostic == diagnostic) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, diagnostic, data);

  @override
  String toString() {
    return 'UserResponse(diagnostic: $diagnostic, data: $data)';
  }
}

/// @nodoc
abstract mixin class _$UserResponseCopyWith<$Res>
    implements $UserResponseCopyWith<$Res> {
  factory _$UserResponseCopyWith(
          _UserResponse value, $Res Function(_UserResponse) _then) =
      __$UserResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "diagnostic") Diagnostic? diagnostic,
      @JsonKey(name: "data") DataUser? data});

  @override
  $DiagnosticCopyWith<$Res>? get diagnostic;
  @override
  $DataUserCopyWith<$Res>? get data;
}

/// @nodoc
class __$UserResponseCopyWithImpl<$Res>
    implements _$UserResponseCopyWith<$Res> {
  __$UserResponseCopyWithImpl(this._self, this._then);

  final _UserResponse _self;
  final $Res Function(_UserResponse) _then;

  /// Create a copy of UserResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? diagnostic = freezed,
    Object? data = freezed,
  }) {
    return _then(_UserResponse(
      diagnostic: freezed == diagnostic
          ? _self.diagnostic
          : diagnostic // ignore: cast_nullable_to_non_nullable
              as Diagnostic?,
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as DataUser?,
    ));
  }

  /// Create a copy of UserResponse
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

  /// Create a copy of UserResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DataUserCopyWith<$Res>? get data {
    if (_self.data == null) {
      return null;
    }

    return $DataUserCopyWith<$Res>(_self.data!, (value) {
      return _then(_self.copyWith(data: value));
    });
  }
}

// dart format on
