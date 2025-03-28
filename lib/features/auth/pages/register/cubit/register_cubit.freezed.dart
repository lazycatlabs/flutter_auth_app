// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RegisterState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is RegisterState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'RegisterState()';
  }
}

/// @nodoc
class $RegisterStateCopyWith<$Res> {
  $RegisterStateCopyWith(RegisterState _, $Res Function(RegisterState) __);
}

/// @nodoc

class RegisterStateLoading implements RegisterState {
  const RegisterStateLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is RegisterStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'RegisterState.loading()';
  }
}

/// @nodoc

class RegisterStateSuccess implements RegisterState {
  const RegisterStateSuccess(this.data);

  final Register? data;

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RegisterStateSuccessCopyWith<RegisterStateSuccess> get copyWith =>
      _$RegisterStateSuccessCopyWithImpl<RegisterStateSuccess>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RegisterStateSuccess &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @override
  String toString() {
    return 'RegisterState.success(data: $data)';
  }
}

/// @nodoc
abstract mixin class $RegisterStateSuccessCopyWith<$Res>
    implements $RegisterStateCopyWith<$Res> {
  factory $RegisterStateSuccessCopyWith(RegisterStateSuccess value,
          $Res Function(RegisterStateSuccess) _then) =
      _$RegisterStateSuccessCopyWithImpl;
  @useResult
  $Res call({Register? data});

  $RegisterCopyWith<$Res>? get data;
}

/// @nodoc
class _$RegisterStateSuccessCopyWithImpl<$Res>
    implements $RegisterStateSuccessCopyWith<$Res> {
  _$RegisterStateSuccessCopyWithImpl(this._self, this._then);

  final RegisterStateSuccess _self;
  final $Res Function(RegisterStateSuccess) _then;

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = freezed,
  }) {
    return _then(RegisterStateSuccess(
      freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as Register?,
    ));
  }

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RegisterCopyWith<$Res>? get data {
    if (_self.data == null) {
      return null;
    }

    return $RegisterCopyWith<$Res>(_self.data!, (value) {
      return _then(_self.copyWith(data: value));
    });
  }
}

/// @nodoc

class RegisterStateFailure implements RegisterState {
  const RegisterStateFailure(this.message);

  final String message;

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RegisterStateFailureCopyWith<RegisterStateFailure> get copyWith =>
      _$RegisterStateFailureCopyWithImpl<RegisterStateFailure>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RegisterStateFailure &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'RegisterState.failure(message: $message)';
  }
}

/// @nodoc
abstract mixin class $RegisterStateFailureCopyWith<$Res>
    implements $RegisterStateCopyWith<$Res> {
  factory $RegisterStateFailureCopyWith(RegisterStateFailure value,
          $Res Function(RegisterStateFailure) _then) =
      _$RegisterStateFailureCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$RegisterStateFailureCopyWithImpl<$Res>
    implements $RegisterStateFailureCopyWith<$Res> {
  _$RegisterStateFailureCopyWithImpl(this._self, this._then);

  final RegisterStateFailure _self;
  final $Res Function(RegisterStateFailure) _then;

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(RegisterStateFailure(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class RegisterStateInit implements RegisterState {
  const RegisterStateInit();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is RegisterStateInit);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'RegisterState.init()';
  }
}

/// @nodoc

class RegisterStateShowHidePassword implements RegisterState {
  const RegisterStateShowHidePassword();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RegisterStateShowHidePassword);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'RegisterState.showHidePassword()';
  }
}

// dart format on
