// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MainState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is MainState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'MainState()';
  }
}

/// @nodoc
class $MainStateCopyWith<$Res> {
  $MainStateCopyWith(MainState _, $Res Function(MainState) __);
}

/// @nodoc

class MainStateLoading implements MainState {
  const MainStateLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is MainStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'MainState.loading()';
  }
}

/// @nodoc

class MainStateSuccess implements MainState {
  const MainStateSuccess(this.data);

  final DataHelper? data;

  /// Create a copy of MainState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MainStateSuccessCopyWith<MainStateSuccess> get copyWith =>
      _$MainStateSuccessCopyWithImpl<MainStateSuccess>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MainStateSuccess &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @override
  String toString() {
    return 'MainState.success(data: $data)';
  }
}

/// @nodoc
abstract mixin class $MainStateSuccessCopyWith<$Res>
    implements $MainStateCopyWith<$Res> {
  factory $MainStateSuccessCopyWith(
          MainStateSuccess value, $Res Function(MainStateSuccess) _then) =
      _$MainStateSuccessCopyWithImpl;
  @useResult
  $Res call({DataHelper? data});

  $DataHelperCopyWith<$Res>? get data;
}

/// @nodoc
class _$MainStateSuccessCopyWithImpl<$Res>
    implements $MainStateSuccessCopyWith<$Res> {
  _$MainStateSuccessCopyWithImpl(this._self, this._then);

  final MainStateSuccess _self;
  final $Res Function(MainStateSuccess) _then;

  /// Create a copy of MainState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = freezed,
  }) {
    return _then(MainStateSuccess(
      freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as DataHelper?,
    ));
  }

  /// Create a copy of MainState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DataHelperCopyWith<$Res>? get data {
    if (_self.data == null) {
      return null;
    }

    return $DataHelperCopyWith<$Res>(_self.data!, (value) {
      return _then(_self.copyWith(data: value));
    });
  }
}

// dart format on
