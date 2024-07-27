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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UsersParams _$UsersParamsFromJson(Map<String, dynamic> json) {
  return _UsersParams.fromJson(json);
}

/// @nodoc
mixin _$UsersParams {
  int get page => throw _privateConstructorUsedError;

  /// Serializes this UsersParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UsersParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of UsersParams
  /// with the given fields replaced by the non-null parameter values.
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
abstract class _$$UsersParamsImplCopyWith<$Res>
    implements $UsersParamsCopyWith<$Res> {
  factory _$$UsersParamsImplCopyWith(
          _$UsersParamsImpl value, $Res Function(_$UsersParamsImpl) then) =
      __$$UsersParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int page});
}

/// @nodoc
class __$$UsersParamsImplCopyWithImpl<$Res>
    extends _$UsersParamsCopyWithImpl<$Res, _$UsersParamsImpl>
    implements _$$UsersParamsImplCopyWith<$Res> {
  __$$UsersParamsImplCopyWithImpl(
      _$UsersParamsImpl _value, $Res Function(_$UsersParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of UsersParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
  }) {
    return _then(_$UsersParamsImpl(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UsersParamsImpl implements _UsersParams {
  const _$UsersParamsImpl({this.page = 1});

  factory _$UsersParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$UsersParamsImplFromJson(json);

  @override
  @JsonKey()
  final int page;

  @override
  String toString() {
    return 'UsersParams(page: $page)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UsersParamsImpl &&
            (identical(other.page, page) || other.page == page));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, page);

  /// Create a copy of UsersParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UsersParamsImplCopyWith<_$UsersParamsImpl> get copyWith =>
      __$$UsersParamsImplCopyWithImpl<_$UsersParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UsersParamsImplToJson(
      this,
    );
  }
}

abstract class _UsersParams implements UsersParams {
  const factory _UsersParams({final int page}) = _$UsersParamsImpl;

  factory _UsersParams.fromJson(Map<String, dynamic> json) =
      _$UsersParamsImpl.fromJson;

  @override
  int get page;

  /// Create a copy of UsersParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UsersParamsImplCopyWith<_$UsersParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
