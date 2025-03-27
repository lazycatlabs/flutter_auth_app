// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diagnostic.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Diagnostic {
  @JsonKey(name: "status")
  String? get status;
  @JsonKey(name: "message")
  String? get message;

  /// Create a copy of Diagnostic
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DiagnosticCopyWith<Diagnostic> get copyWith =>
      _$DiagnosticCopyWithImpl<Diagnostic>(this as Diagnostic, _$identity);

  /// Serializes this Diagnostic to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Diagnostic &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message);

  @override
  String toString() {
    return 'Diagnostic(status: $status, message: $message)';
  }
}

/// @nodoc
abstract mixin class $DiagnosticCopyWith<$Res> {
  factory $DiagnosticCopyWith(
          Diagnostic value, $Res Function(Diagnostic) _then) =
      _$DiagnosticCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "status") String? status,
      @JsonKey(name: "message") String? message});
}

/// @nodoc
class _$DiagnosticCopyWithImpl<$Res> implements $DiagnosticCopyWith<$Res> {
  _$DiagnosticCopyWithImpl(this._self, this._then);

  final Diagnostic _self;
  final $Res Function(Diagnostic) _then;

  /// Create a copy of Diagnostic
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
  }) {
    return _then(_self.copyWith(
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Diagnostic implements Diagnostic {
  const _Diagnostic(
      {@JsonKey(name: "status") this.status,
      @JsonKey(name: "message") this.message});
  factory _Diagnostic.fromJson(Map<String, dynamic> json) =>
      _$DiagnosticFromJson(json);

  @override
  @JsonKey(name: "status")
  final String? status;
  @override
  @JsonKey(name: "message")
  final String? message;

  /// Create a copy of Diagnostic
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DiagnosticCopyWith<_Diagnostic> get copyWith =>
      __$DiagnosticCopyWithImpl<_Diagnostic>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DiagnosticToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Diagnostic &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message);

  @override
  String toString() {
    return 'Diagnostic(status: $status, message: $message)';
  }
}

/// @nodoc
abstract mixin class _$DiagnosticCopyWith<$Res>
    implements $DiagnosticCopyWith<$Res> {
  factory _$DiagnosticCopyWith(
          _Diagnostic value, $Res Function(_Diagnostic) _then) =
      __$DiagnosticCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "status") String? status,
      @JsonKey(name: "message") String? message});
}

/// @nodoc
class __$DiagnosticCopyWithImpl<$Res> implements _$DiagnosticCopyWith<$Res> {
  __$DiagnosticCopyWithImpl(this._self, this._then);

  final _Diagnostic _self;
  final $Res Function(_Diagnostic) _then;

  /// Create a copy of Diagnostic
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
  }) {
    return _then(_Diagnostic(
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
