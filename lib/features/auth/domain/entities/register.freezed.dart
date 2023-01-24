// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Register {
  String? get token => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegisterCopyWith<Register> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterCopyWith<$Res> {
  factory $RegisterCopyWith(Register value, $Res Function(Register) then) =
      _$RegisterCopyWithImpl<$Res, Register>;
  @useResult
  $Res call({String? token});
}

/// @nodoc
class _$RegisterCopyWithImpl<$Res, $Val extends Register>
    implements $RegisterCopyWith<$Res> {
  _$RegisterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = freezed,
  }) {
    return _then(_value.copyWith(
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RegisterCopyWith<$Res> implements $RegisterCopyWith<$Res> {
  factory _$$_RegisterCopyWith(
          _$_Register value, $Res Function(_$_Register) then) =
      __$$_RegisterCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? token});
}

/// @nodoc
class __$$_RegisterCopyWithImpl<$Res>
    extends _$RegisterCopyWithImpl<$Res, _$_Register>
    implements _$$_RegisterCopyWith<$Res> {
  __$$_RegisterCopyWithImpl(
      _$_Register _value, $Res Function(_$_Register) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = freezed,
  }) {
    return _then(_$_Register(
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Register implements _Register {
  const _$_Register({this.token});

  @override
  final String? token;

  @override
  String toString() {
    return 'Register(token: $token)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Register &&
            (identical(other.token, token) || other.token == token));
  }

  @override
  int get hashCode => Object.hash(runtimeType, token);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RegisterCopyWith<_$_Register> get copyWith =>
      __$$_RegisterCopyWithImpl<_$_Register>(this, _$identity);
}

abstract class _Register implements Register {
  const factory _Register({final String? token}) = _$_Register;

  @override
  String? get token;
  @override
  @JsonKey(ignore: true)
  _$$_RegisterCopyWith<_$_Register> get copyWith =>
      throw _privateConstructorUsedError;
}
