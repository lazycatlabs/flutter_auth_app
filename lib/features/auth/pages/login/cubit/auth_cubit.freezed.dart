// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AuthState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthState()';
  }
}

/// @nodoc
class $AuthStateCopyWith<$Res> {
  $AuthStateCopyWith(AuthState _, $Res Function(AuthState) __);
}

/// @nodoc

class AuthStateLoading implements AuthState {
  const AuthStateLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AuthStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthState.loading()';
  }
}

/// @nodoc

class AuthStateSuccess implements AuthState {
  const AuthStateSuccess(this.data);

  final String? data;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AuthStateSuccessCopyWith<AuthStateSuccess> get copyWith =>
      _$AuthStateSuccessCopyWithImpl<AuthStateSuccess>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuthStateSuccess &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @override
  String toString() {
    return 'AuthState.success(data: $data)';
  }
}

/// @nodoc
abstract mixin class $AuthStateSuccessCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory $AuthStateSuccessCopyWith(
          AuthStateSuccess value, $Res Function(AuthStateSuccess) _then) =
      _$AuthStateSuccessCopyWithImpl;
  @useResult
  $Res call({String? data});
}

/// @nodoc
class _$AuthStateSuccessCopyWithImpl<$Res>
    implements $AuthStateSuccessCopyWith<$Res> {
  _$AuthStateSuccessCopyWithImpl(this._self, this._then);

  final AuthStateSuccess _self;
  final $Res Function(AuthStateSuccess) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = freezed,
  }) {
    return _then(AuthStateSuccess(
      freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class AuthStateFailure implements AuthState {
  const AuthStateFailure(this.message);

  final String message;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AuthStateFailureCopyWith<AuthStateFailure> get copyWith =>
      _$AuthStateFailureCopyWithImpl<AuthStateFailure>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuthStateFailure &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'AuthState.failure(message: $message)';
  }
}

/// @nodoc
abstract mixin class $AuthStateFailureCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory $AuthStateFailureCopyWith(
          AuthStateFailure value, $Res Function(AuthStateFailure) _then) =
      _$AuthStateFailureCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$AuthStateFailureCopyWithImpl<$Res>
    implements $AuthStateFailureCopyWith<$Res> {
  _$AuthStateFailureCopyWithImpl(this._self, this._then);

  final AuthStateFailure _self;
  final $Res Function(AuthStateFailure) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(AuthStateFailure(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class AuthStateShowHide implements AuthState {
  const AuthStateShowHide();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AuthStateShowHide);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthState.showHide()';
  }
}

/// @nodoc

class AuthStateInit implements AuthState {
  const AuthStateInit();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AuthStateInit);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthState.init()';
  }
}

// dart format on
