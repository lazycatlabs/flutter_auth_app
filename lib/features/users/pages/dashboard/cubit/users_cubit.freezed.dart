// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'users_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UsersState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is UsersState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'UsersState()';
  }
}

/// @nodoc
class $UsersStateCopyWith<$Res> {
  $UsersStateCopyWith(UsersState _, $Res Function(UsersState) __);
}

/// @nodoc

class UsersStateLoading implements UsersState {
  const UsersStateLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is UsersStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'UsersState.loading()';
  }
}

/// @nodoc

class UsersStateInitial implements UsersState {
  const UsersStateInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is UsersStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'UsersState.initial()';
  }
}

/// @nodoc

class UsersStateSuccess implements UsersState {
  const UsersStateSuccess(this.data);

  final Users data;

  /// Create a copy of UsersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UsersStateSuccessCopyWith<UsersStateSuccess> get copyWith =>
      _$UsersStateSuccessCopyWithImpl<UsersStateSuccess>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UsersStateSuccess &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @override
  String toString() {
    return 'UsersState.success(data: $data)';
  }
}

/// @nodoc
abstract mixin class $UsersStateSuccessCopyWith<$Res>
    implements $UsersStateCopyWith<$Res> {
  factory $UsersStateSuccessCopyWith(
          UsersStateSuccess value, $Res Function(UsersStateSuccess) _then) =
      _$UsersStateSuccessCopyWithImpl;
  @useResult
  $Res call({Users data});

  $UsersCopyWith<$Res> get data;
}

/// @nodoc
class _$UsersStateSuccessCopyWithImpl<$Res>
    implements $UsersStateSuccessCopyWith<$Res> {
  _$UsersStateSuccessCopyWithImpl(this._self, this._then);

  final UsersStateSuccess _self;
  final $Res Function(UsersStateSuccess) _then;

  /// Create a copy of UsersState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = null,
  }) {
    return _then(UsersStateSuccess(
      null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as Users,
    ));
  }

  /// Create a copy of UsersState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UsersCopyWith<$Res> get data {
    return $UsersCopyWith<$Res>(_self.data, (value) {
      return _then(_self.copyWith(data: value));
    });
  }
}

/// @nodoc

class UsersStateFailure implements UsersState {
  const UsersStateFailure(this.message);

  final String message;

  /// Create a copy of UsersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UsersStateFailureCopyWith<UsersStateFailure> get copyWith =>
      _$UsersStateFailureCopyWithImpl<UsersStateFailure>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UsersStateFailure &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'UsersState.failure(message: $message)';
  }
}

/// @nodoc
abstract mixin class $UsersStateFailureCopyWith<$Res>
    implements $UsersStateCopyWith<$Res> {
  factory $UsersStateFailureCopyWith(
          UsersStateFailure value, $Res Function(UsersStateFailure) _then) =
      _$UsersStateFailureCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$UsersStateFailureCopyWithImpl<$Res>
    implements $UsersStateFailureCopyWith<$Res> {
  _$UsersStateFailureCopyWithImpl(this._self, this._then);

  final UsersStateFailure _self;
  final $Res Function(UsersStateFailure) _then;

  /// Create a copy of UsersState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(UsersStateFailure(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class UsersStateEmpty implements UsersState {
  const UsersStateEmpty();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is UsersStateEmpty);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'UsersState.empty()';
  }
}

// dart format on
