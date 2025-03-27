// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_users.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UsersParams {
  int get page;

  /// Create a copy of UsersParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UsersParamsCopyWith<UsersParams> get copyWith =>
      _$UsersParamsCopyWithImpl<UsersParams>(this as UsersParams, _$identity);

  /// Serializes this UsersParams to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UsersParams &&
            (identical(other.page, page) || other.page == page));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, page);

  @override
  String toString() {
    return 'UsersParams(page: $page)';
  }
}

/// @nodoc
abstract mixin class $UsersParamsCopyWith<$Res> {
  factory $UsersParamsCopyWith(
          UsersParams value, $Res Function(UsersParams) _then) =
      _$UsersParamsCopyWithImpl;
  @useResult
  $Res call({int page});
}

/// @nodoc
class _$UsersParamsCopyWithImpl<$Res> implements $UsersParamsCopyWith<$Res> {
  _$UsersParamsCopyWithImpl(this._self, this._then);

  final UsersParams _self;
  final $Res Function(UsersParams) _then;

  /// Create a copy of UsersParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
  }) {
    return _then(_self.copyWith(
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _UsersParams implements UsersParams {
  const _UsersParams({this.page = 1});
  factory _UsersParams.fromJson(Map<String, dynamic> json) =>
      _$UsersParamsFromJson(json);

  @override
  @JsonKey()
  final int page;

  /// Create a copy of UsersParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UsersParamsCopyWith<_UsersParams> get copyWith =>
      __$UsersParamsCopyWithImpl<_UsersParams>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UsersParamsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UsersParams &&
            (identical(other.page, page) || other.page == page));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, page);

  @override
  String toString() {
    return 'UsersParams(page: $page)';
  }
}

/// @nodoc
abstract mixin class _$UsersParamsCopyWith<$Res>
    implements $UsersParamsCopyWith<$Res> {
  factory _$UsersParamsCopyWith(
          _UsersParams value, $Res Function(_UsersParams) _then) =
      __$UsersParamsCopyWithImpl;
  @override
  @useResult
  $Res call({int page});
}

/// @nodoc
class __$UsersParamsCopyWithImpl<$Res> implements _$UsersParamsCopyWith<$Res> {
  __$UsersParamsCopyWithImpl(this._self, this._then);

  final _UsersParams _self;
  final $Res Function(_UsersParams) _then;

  /// Create a copy of UsersParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? page = null,
  }) {
    return _then(_UsersParams(
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
