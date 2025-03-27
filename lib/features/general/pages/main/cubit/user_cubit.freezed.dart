// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is UserState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'UserState()';
  }
}

/// @nodoc
class $UserStateCopyWith<$Res> {
  $UserStateCopyWith(UserState _, $Res Function(UserState) __);
}

/// @nodoc

class UserStateLoading implements UserState {
  const UserStateLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is UserStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'UserState.loading()';
  }
}

/// @nodoc

class UserStateFailure implements UserState {
  const UserStateFailure(this.message);

  final String message;

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserStateFailureCopyWith<UserStateFailure> get copyWith =>
      _$UserStateFailureCopyWithImpl<UserStateFailure>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserStateFailure &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'UserState.failure(message: $message)';
  }
}

/// @nodoc
abstract mixin class $UserStateFailureCopyWith<$Res>
    implements $UserStateCopyWith<$Res> {
  factory $UserStateFailureCopyWith(
          UserStateFailure value, $Res Function(UserStateFailure) _then) =
      _$UserStateFailureCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$UserStateFailureCopyWithImpl<$Res>
    implements $UserStateFailureCopyWith<$Res> {
  _$UserStateFailureCopyWithImpl(this._self, this._then);

  final UserStateFailure _self;
  final $Res Function(UserStateFailure) _then;

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(UserStateFailure(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class UserStateSuccess implements UserState {
  const UserStateSuccess(this.data);

  final User? data;

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserStateSuccessCopyWith<UserStateSuccess> get copyWith =>
      _$UserStateSuccessCopyWithImpl<UserStateSuccess>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserStateSuccess &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @override
  String toString() {
    return 'UserState.success(data: $data)';
  }
}

/// @nodoc
abstract mixin class $UserStateSuccessCopyWith<$Res>
    implements $UserStateCopyWith<$Res> {
  factory $UserStateSuccessCopyWith(
          UserStateSuccess value, $Res Function(UserStateSuccess) _then) =
      _$UserStateSuccessCopyWithImpl;
  @useResult
  $Res call({User? data});

  $UserCopyWith<$Res>? get data;
}

/// @nodoc
class _$UserStateSuccessCopyWithImpl<$Res>
    implements $UserStateSuccessCopyWith<$Res> {
  _$UserStateSuccessCopyWithImpl(this._self, this._then);

  final UserStateSuccess _self;
  final $Res Function(UserStateSuccess) _then;

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = freezed,
  }) {
    return _then(UserStateSuccess(
      freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get data {
    if (_self.data == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_self.data!, (value) {
      return _then(_self.copyWith(data: value));
    });
  }
}

// dart format on
