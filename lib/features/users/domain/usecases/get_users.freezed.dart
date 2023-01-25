// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_users.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UsersParams _$UsersParamsFromJson(Map<String, dynamic> json) {
  return _UsersParams.fromJson(json);
}

/// @nodoc
mixin _$UsersParams {
  int get page => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UsersParamsCopyWith<UsersParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsersParamsCopyWith<$Res> {
  factory $UsersParamsCopyWith(
          UsersParams value, $Res Function(UsersParams) then) =
      _$UsersParamsCopyWithImpl<$Res, UsersParams>;
  @useResult
  $Res call({int page});
}

/// @nodoc
class _$UsersParamsCopyWithImpl<$Res, $Val extends UsersParams>
    implements $UsersParamsCopyWith<$Res> {
  _$UsersParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
  }) {
    return _then(_value.copyWith(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UsersParamsCopyWith<$Res>
    implements $UsersParamsCopyWith<$Res> {
  factory _$$_UsersParamsCopyWith(
          _$_UsersParams value, $Res Function(_$_UsersParams) then) =
      __$$_UsersParamsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int page});
}

/// @nodoc
class __$$_UsersParamsCopyWithImpl<$Res>
    extends _$UsersParamsCopyWithImpl<$Res, _$_UsersParams>
    implements _$$_UsersParamsCopyWith<$Res> {
  __$$_UsersParamsCopyWithImpl(
      _$_UsersParams _value, $Res Function(_$_UsersParams) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
  }) {
    return _then(_$_UsersParams(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UsersParams implements _UsersParams {
  const _$_UsersParams({this.page = 1});

  factory _$_UsersParams.fromJson(Map<String, dynamic> json) =>
      _$$_UsersParamsFromJson(json);

  @override
  @JsonKey()
  final int page;

  @override
  String toString() {
    return 'UsersParams(page: $page)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UsersParams &&
            (identical(other.page, page) || other.page == page));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, page);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UsersParamsCopyWith<_$_UsersParams> get copyWith =>
      __$$_UsersParamsCopyWithImpl<_$_UsersParams>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UsersParamsToJson(
      this,
    );
  }
}

abstract class _UsersParams implements UsersParams {
  const factory _UsersParams({final int page}) = _$_UsersParams;

  factory _UsersParams.fromJson(Map<String, dynamic> json) =
      _$_UsersParams.fromJson;

  @override
  int get page;
  @override
  @JsonKey(ignore: true)
  _$$_UsersParamsCopyWith<_$_UsersParams> get copyWith =>
      throw _privateConstructorUsedError;
}
