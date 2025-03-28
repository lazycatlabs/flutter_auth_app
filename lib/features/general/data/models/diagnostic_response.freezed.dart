// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diagnostic_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DiagnosticResponse {
  @JsonKey(name: "diagnostic")
  Diagnostic? get diagnostic;

  /// Create a copy of DiagnosticResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DiagnosticResponseCopyWith<DiagnosticResponse> get copyWith =>
      _$DiagnosticResponseCopyWithImpl<DiagnosticResponse>(
          this as DiagnosticResponse, _$identity);

  /// Serializes this DiagnosticResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DiagnosticResponse &&
            (identical(other.diagnostic, diagnostic) ||
                other.diagnostic == diagnostic));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, diagnostic);

  @override
  String toString() {
    return 'DiagnosticResponse(diagnostic: $diagnostic)';
  }
}

/// @nodoc
abstract mixin class $DiagnosticResponseCopyWith<$Res> {
  factory $DiagnosticResponseCopyWith(
          DiagnosticResponse value, $Res Function(DiagnosticResponse) _then) =
      _$DiagnosticResponseCopyWithImpl;
  @useResult
  $Res call({@JsonKey(name: "diagnostic") Diagnostic? diagnostic});

  $DiagnosticCopyWith<$Res>? get diagnostic;
}

/// @nodoc
class _$DiagnosticResponseCopyWithImpl<$Res>
    implements $DiagnosticResponseCopyWith<$Res> {
  _$DiagnosticResponseCopyWithImpl(this._self, this._then);

  final DiagnosticResponse _self;
  final $Res Function(DiagnosticResponse) _then;

  /// Create a copy of DiagnosticResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? diagnostic = freezed,
  }) {
    return _then(_self.copyWith(
      diagnostic: freezed == diagnostic
          ? _self.diagnostic
          : diagnostic // ignore: cast_nullable_to_non_nullable
              as Diagnostic?,
    ));
  }

  /// Create a copy of DiagnosticResponse
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
}

/// @nodoc
@JsonSerializable()
class _DiagnosticResponse implements DiagnosticResponse {
  const _DiagnosticResponse({@JsonKey(name: "diagnostic") this.diagnostic});
  factory _DiagnosticResponse.fromJson(Map<String, dynamic> json) =>
      _$DiagnosticResponseFromJson(json);

  @override
  @JsonKey(name: "diagnostic")
  final Diagnostic? diagnostic;

  /// Create a copy of DiagnosticResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DiagnosticResponseCopyWith<_DiagnosticResponse> get copyWith =>
      __$DiagnosticResponseCopyWithImpl<_DiagnosticResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DiagnosticResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DiagnosticResponse &&
            (identical(other.diagnostic, diagnostic) ||
                other.diagnostic == diagnostic));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, diagnostic);

  @override
  String toString() {
    return 'DiagnosticResponse(diagnostic: $diagnostic)';
  }
}

/// @nodoc
abstract mixin class _$DiagnosticResponseCopyWith<$Res>
    implements $DiagnosticResponseCopyWith<$Res> {
  factory _$DiagnosticResponseCopyWith(
          _DiagnosticResponse value, $Res Function(_DiagnosticResponse) _then) =
      __$DiagnosticResponseCopyWithImpl;
  @override
  @useResult
  $Res call({@JsonKey(name: "diagnostic") Diagnostic? diagnostic});

  @override
  $DiagnosticCopyWith<$Res>? get diagnostic;
}

/// @nodoc
class __$DiagnosticResponseCopyWithImpl<$Res>
    implements _$DiagnosticResponseCopyWith<$Res> {
  __$DiagnosticResponseCopyWithImpl(this._self, this._then);

  final _DiagnosticResponse _self;
  final $Res Function(_DiagnosticResponse) _then;

  /// Create a copy of DiagnosticResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? diagnostic = freezed,
  }) {
    return _then(_DiagnosticResponse(
      diagnostic: freezed == diagnostic
          ? _self.diagnostic
          : diagnostic // ignore: cast_nullable_to_non_nullable
              as Diagnostic?,
    ));
  }

  /// Create a copy of DiagnosticResponse
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
}

// dart format on
