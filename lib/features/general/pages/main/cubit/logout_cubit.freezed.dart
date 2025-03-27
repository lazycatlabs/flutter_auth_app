// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'logout_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LogoutState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LogoutState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LogoutState()';
  }
}

/// @nodoc
class $LogoutStateCopyWith<$Res> {
  $LogoutStateCopyWith(LogoutState _, $Res Function(LogoutState) __);
}

/// @nodoc

class LogoutStateLoading implements LogoutState {
  const LogoutStateLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LogoutStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LogoutState.loading()';
  }
}

/// @nodoc

class LogoutStateFailure implements LogoutState {
  const LogoutStateFailure(this.message);

  final String message;

  /// Create a copy of LogoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LogoutStateFailureCopyWith<LogoutStateFailure> get copyWith =>
      _$LogoutStateFailureCopyWithImpl<LogoutStateFailure>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LogoutStateFailure &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'LogoutState.failure(message: $message)';
  }
}

/// @nodoc
abstract mixin class $LogoutStateFailureCopyWith<$Res>
    implements $LogoutStateCopyWith<$Res> {
  factory $LogoutStateFailureCopyWith(
          LogoutStateFailure value, $Res Function(LogoutStateFailure) _then) =
      _$LogoutStateFailureCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$LogoutStateFailureCopyWithImpl<$Res>
    implements $LogoutStateFailureCopyWith<$Res> {
  _$LogoutStateFailureCopyWithImpl(this._self, this._then);

  final LogoutStateFailure _self;
  final $Res Function(LogoutStateFailure) _then;

  /// Create a copy of LogoutState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(LogoutStateFailure(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class LogoutStateSuccess implements LogoutState {
  const LogoutStateSuccess(this.message);

  final String message;

  /// Create a copy of LogoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LogoutStateSuccessCopyWith<LogoutStateSuccess> get copyWith =>
      _$LogoutStateSuccessCopyWithImpl<LogoutStateSuccess>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LogoutStateSuccess &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'LogoutState.success(message: $message)';
  }
}

/// @nodoc
abstract mixin class $LogoutStateSuccessCopyWith<$Res>
    implements $LogoutStateCopyWith<$Res> {
  factory $LogoutStateSuccessCopyWith(
          LogoutStateSuccess value, $Res Function(LogoutStateSuccess) _then) =
      _$LogoutStateSuccessCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$LogoutStateSuccessCopyWithImpl<$Res>
    implements $LogoutStateSuccessCopyWith<$Res> {
  _$LogoutStateSuccessCopyWithImpl(this._self, this._then);

  final LogoutStateSuccess _self;
  final $Res Function(LogoutStateSuccess) _then;

  /// Create a copy of LogoutState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(LogoutStateSuccess(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
