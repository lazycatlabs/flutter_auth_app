// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diagnostic_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DiagnosticResponse _$DiagnosticResponseFromJson(Map<String, dynamic> json) {
  return _DiagnosticResponse.fromJson(json);
}

/// @nodoc
mixin _$DiagnosticResponse {
  @JsonKey(name: "diagnostic")
  Diagnostic? get diagnostic => throw _privateConstructorUsedError;

  /// Serializes this DiagnosticResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DiagnosticResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DiagnosticResponseCopyWith<DiagnosticResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiagnosticResponseCopyWith<$Res> {
  factory $DiagnosticResponseCopyWith(
          DiagnosticResponse value, $Res Function(DiagnosticResponse) then) =
      _$DiagnosticResponseCopyWithImpl<$Res, DiagnosticResponse>;
  @useResult
  $Res call({@JsonKey(name: "diagnostic") Diagnostic? diagnostic});

  $DiagnosticCopyWith<$Res>? get diagnostic;
}

/// @nodoc
class _$DiagnosticResponseCopyWithImpl<$Res, $Val extends DiagnosticResponse>
    implements $DiagnosticResponseCopyWith<$Res> {
  _$DiagnosticResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DiagnosticResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? diagnostic = freezed,
  }) {
    return _then(_value.copyWith(
      diagnostic: freezed == diagnostic
          ? _value.diagnostic
          : diagnostic // ignore: cast_nullable_to_non_nullable
              as Diagnostic?,
    ) as $Val);
  }

  /// Create a copy of DiagnosticResponse
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
}

/// @nodoc
abstract class _$$DiagnosticResponseImplCopyWith<$Res>
    implements $DiagnosticResponseCopyWith<$Res> {
  factory _$$DiagnosticResponseImplCopyWith(_$DiagnosticResponseImpl value,
          $Res Function(_$DiagnosticResponseImpl) then) =
      __$$DiagnosticResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "diagnostic") Diagnostic? diagnostic});

  @override
  $DiagnosticCopyWith<$Res>? get diagnostic;
}

/// @nodoc
class __$$DiagnosticResponseImplCopyWithImpl<$Res>
    extends _$DiagnosticResponseCopyWithImpl<$Res, _$DiagnosticResponseImpl>
    implements _$$DiagnosticResponseImplCopyWith<$Res> {
  __$$DiagnosticResponseImplCopyWithImpl(_$DiagnosticResponseImpl _value,
      $Res Function(_$DiagnosticResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiagnosticResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? diagnostic = freezed,
  }) {
    return _then(_$DiagnosticResponseImpl(
      diagnostic: freezed == diagnostic
          ? _value.diagnostic
          : diagnostic // ignore: cast_nullable_to_non_nullable
              as Diagnostic?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DiagnosticResponseImpl implements _DiagnosticResponse {
  const _$DiagnosticResponseImpl(
      {@JsonKey(name: "diagnostic") this.diagnostic});

  factory _$DiagnosticResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$DiagnosticResponseImplFromJson(json);

  @override
  @JsonKey(name: "diagnostic")
  final Diagnostic? diagnostic;

  @override
  String toString() {
    return 'DiagnosticResponse(diagnostic: $diagnostic)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiagnosticResponseImpl &&
            (identical(other.diagnostic, diagnostic) ||
                other.diagnostic == diagnostic));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, diagnostic);

  /// Create a copy of DiagnosticResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DiagnosticResponseImplCopyWith<_$DiagnosticResponseImpl> get copyWith =>
      __$$DiagnosticResponseImplCopyWithImpl<_$DiagnosticResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DiagnosticResponseImplToJson(
      this,
    );
  }
}

abstract class _DiagnosticResponse implements DiagnosticResponse {
  const factory _DiagnosticResponse(
          {@JsonKey(name: "diagnostic") final Diagnostic? diagnostic}) =
      _$DiagnosticResponseImpl;

  factory _DiagnosticResponse.fromJson(Map<String, dynamic> json) =
      _$DiagnosticResponseImpl.fromJson;

  @override
  @JsonKey(name: "diagnostic")
  Diagnostic? get diagnostic;

  /// Create a copy of DiagnosticResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DiagnosticResponseImplCopyWith<_$DiagnosticResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
