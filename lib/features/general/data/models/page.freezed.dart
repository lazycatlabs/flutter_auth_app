// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'page.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Page {
  @JsonKey(name: "currentPage")
  int? get currentPage;
  @JsonKey(name: "perPage")
  int? get perPage;
  @JsonKey(name: "lastPage")
  int? get lastPage;
  @JsonKey(name: "total")
  int? get total;

  /// Create a copy of Page
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PageCopyWith<Page> get copyWith =>
      _$PageCopyWithImpl<Page>(this as Page, _$identity);

  /// Serializes this Page to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Page &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            (identical(other.lastPage, lastPage) ||
                other.lastPage == lastPage) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, currentPage, perPage, lastPage, total);

  @override
  String toString() {
    return 'Page(currentPage: $currentPage, perPage: $perPage, lastPage: $lastPage, total: $total)';
  }
}

/// @nodoc
abstract mixin class $PageCopyWith<$Res> {
  factory $PageCopyWith(Page value, $Res Function(Page) _then) =
      _$PageCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "currentPage") int? currentPage,
      @JsonKey(name: "perPage") int? perPage,
      @JsonKey(name: "lastPage") int? lastPage,
      @JsonKey(name: "total") int? total});
}

/// @nodoc
class _$PageCopyWithImpl<$Res> implements $PageCopyWith<$Res> {
  _$PageCopyWithImpl(this._self, this._then);

  final Page _self;
  final $Res Function(Page) _then;

  /// Create a copy of Page
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = freezed,
    Object? perPage = freezed,
    Object? lastPage = freezed,
    Object? total = freezed,
  }) {
    return _then(_self.copyWith(
      currentPage: freezed == currentPage
          ? _self.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int?,
      perPage: freezed == perPage
          ? _self.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int?,
      lastPage: freezed == lastPage
          ? _self.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int?,
      total: freezed == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Page implements Page {
  const _Page(
      {@JsonKey(name: "currentPage") this.currentPage,
      @JsonKey(name: "perPage") this.perPage,
      @JsonKey(name: "lastPage") this.lastPage,
      @JsonKey(name: "total") this.total});
  factory _Page.fromJson(Map<String, dynamic> json) => _$PageFromJson(json);

  @override
  @JsonKey(name: "currentPage")
  final int? currentPage;
  @override
  @JsonKey(name: "perPage")
  final int? perPage;
  @override
  @JsonKey(name: "lastPage")
  final int? lastPage;
  @override
  @JsonKey(name: "total")
  final int? total;

  /// Create a copy of Page
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PageCopyWith<_Page> get copyWith =>
      __$PageCopyWithImpl<_Page>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PageToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Page &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            (identical(other.lastPage, lastPage) ||
                other.lastPage == lastPage) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, currentPage, perPage, lastPage, total);

  @override
  String toString() {
    return 'Page(currentPage: $currentPage, perPage: $perPage, lastPage: $lastPage, total: $total)';
  }
}

/// @nodoc
abstract mixin class _$PageCopyWith<$Res> implements $PageCopyWith<$Res> {
  factory _$PageCopyWith(_Page value, $Res Function(_Page) _then) =
      __$PageCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "currentPage") int? currentPage,
      @JsonKey(name: "perPage") int? perPage,
      @JsonKey(name: "lastPage") int? lastPage,
      @JsonKey(name: "total") int? total});
}

/// @nodoc
class __$PageCopyWithImpl<$Res> implements _$PageCopyWith<$Res> {
  __$PageCopyWithImpl(this._self, this._then);

  final _Page _self;
  final $Res Function(_Page) _then;

  /// Create a copy of Page
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? currentPage = freezed,
    Object? perPage = freezed,
    Object? lastPage = freezed,
    Object? total = freezed,
  }) {
    return _then(_Page(
      currentPage: freezed == currentPage
          ? _self.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int?,
      perPage: freezed == perPage
          ? _self.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int?,
      lastPage: freezed == lastPage
          ? _self.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int?,
      total: freezed == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

// dart format on
