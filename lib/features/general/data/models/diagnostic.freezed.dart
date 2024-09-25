// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diagnostic.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Diagnostic _$DiagnosticFromJson(Map<String, dynamic> json) {
  return _Diagnostic.fromJson(json);
}

/// @nodoc
mixin _$Diagnostic {
  @JsonKey(name: "status")
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "message")
  String? get message => throw _privateConstructorUsedError;

  /// Serializes this Diagnostic to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Diagnostic
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DiagnosticCopyWith<Diagnostic> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiagnosticCopyWith<$Res> {
  factory $DiagnosticCopyWith(
          Diagnostic value, $Res Function(Diagnostic) then) =
      _$DiagnosticCopyWithImpl<$Res, Diagnostic>;
  @useResult
  $Res call(
      {@JsonKey(name: "status") String? status,
      @JsonKey(name: "message") String? message});
}

/// @nodoc
class _$DiagnosticCopyWithImpl<$Res, $Val extends Diagnostic>
    implements $DiagnosticCopyWith<$Res> {
  _$DiagnosticCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Diagnostic
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DiagnosticImplCopyWith<$Res>
    implements $DiagnosticCopyWith<$Res> {
  factory _$$DiagnosticImplCopyWith(
          _$DiagnosticImpl value, $Res Function(_$DiagnosticImpl) then) =
      __$$DiagnosticImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "status") String? status,
      @JsonKey(name: "message") String? message});
}

/// @nodoc
class __$$DiagnosticImplCopyWithImpl<$Res>
    extends _$DiagnosticCopyWithImpl<$Res, _$DiagnosticImpl>
    implements _$$DiagnosticImplCopyWith<$Res> {
  __$$DiagnosticImplCopyWithImpl(
      _$DiagnosticImpl _value, $Res Function(_$DiagnosticImpl) _then)
      : super(_value, _then);

  /// Create a copy of Diagnostic
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
  }) {
    return _then(_$DiagnosticImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DiagnosticImpl implements _Diagnostic {
  const _$DiagnosticImpl(
      {@JsonKey(name: "status") this.status,
      @JsonKey(name: "message") this.message});

  factory _$DiagnosticImpl.fromJson(Map<String, dynamic> json) =>
      _$$DiagnosticImplFromJson(json);

  @override
  @JsonKey(name: "status")
  final String? status;
  @override
  @JsonKey(name: "message")
  final String? message;

  @override
  String toString() {
    return 'Diagnostic(status: $status, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiagnosticImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message);

  /// Create a copy of Diagnostic
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DiagnosticImplCopyWith<_$DiagnosticImpl> get copyWith =>
      __$$DiagnosticImplCopyWithImpl<_$DiagnosticImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DiagnosticImplToJson(
      this,
    );
  }
}

abstract class _Diagnostic implements Diagnostic {
  const factory _Diagnostic(
      {@JsonKey(name: "status") final String? status,
      @JsonKey(name: "message") final String? message}) = _$DiagnosticImpl;

  factory _Diagnostic.fromJson(Map<String, dynamic> json) =
      _$DiagnosticImpl.fromJson;

  @override
  @JsonKey(name: "status")
  String? get status;
  @override
  @JsonKey(name: "message")
  String? get message;

  /// Create a copy of Diagnostic
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DiagnosticImplCopyWith<_$DiagnosticImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
