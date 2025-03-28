// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_helper.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DataHelper {
  String? get title;
  set title(String? value);
  String? get desc;
  set desc(String? value);
  String? get iconPath;
  set iconPath(String? value);
  IconData? get icon;
  set icon(IconData? value);
  String? get url;
  set url(String? value);
  String? get type;
  set type(String? value);
  int? get id;
  set id(int? value);
  bool get isSelected;
  set isSelected(bool value);
  ActiveTheme get activeTheme;
  set activeTheme(ActiveTheme value);

  /// Create a copy of DataHelper
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DataHelperCopyWith<DataHelper> get copyWith =>
      _$DataHelperCopyWithImpl<DataHelper>(this as DataHelper, _$identity);

  @override
  String toString() {
    return 'DataHelper(title: $title, desc: $desc, iconPath: $iconPath, icon: $icon, url: $url, type: $type, id: $id, isSelected: $isSelected, activeTheme: $activeTheme)';
  }
}

/// @nodoc
abstract mixin class $DataHelperCopyWith<$Res> {
  factory $DataHelperCopyWith(
          DataHelper value, $Res Function(DataHelper) _then) =
      _$DataHelperCopyWithImpl;
  @useResult
  $Res call(
      {String? title,
      String? desc,
      String? iconPath,
      IconData? icon,
      String? url,
      String? type,
      int? id,
      bool isSelected,
      ActiveTheme activeTheme});
}

/// @nodoc
class _$DataHelperCopyWithImpl<$Res> implements $DataHelperCopyWith<$Res> {
  _$DataHelperCopyWithImpl(this._self, this._then);

  final DataHelper _self;
  final $Res Function(DataHelper) _then;

  /// Create a copy of DataHelper
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? desc = freezed,
    Object? iconPath = freezed,
    Object? icon = freezed,
    Object? url = freezed,
    Object? type = freezed,
    Object? id = freezed,
    Object? isSelected = null,
    Object? activeTheme = null,
  }) {
    return _then(_self.copyWith(
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      desc: freezed == desc
          ? _self.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String?,
      iconPath: freezed == iconPath
          ? _self.iconPath
          : iconPath // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _self.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconData?,
      url: freezed == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      isSelected: null == isSelected
          ? _self.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      activeTheme: null == activeTheme
          ? _self.activeTheme
          : activeTheme // ignore: cast_nullable_to_non_nullable
              as ActiveTheme,
    ));
  }
}

/// @nodoc

class _DataHelper implements DataHelper {
  _DataHelper(
      {this.title,
      this.desc,
      this.iconPath,
      this.icon,
      this.url,
      this.type,
      this.id,
      this.isSelected = false,
      this.activeTheme = ActiveTheme.light});

  @override
  String? title;
  @override
  String? desc;
  @override
  String? iconPath;
  @override
  IconData? icon;
  @override
  String? url;
  @override
  String? type;
  @override
  int? id;
  @override
  @JsonKey()
  bool isSelected;
  @override
  @JsonKey()
  ActiveTheme activeTheme;

  /// Create a copy of DataHelper
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DataHelperCopyWith<_DataHelper> get copyWith =>
      __$DataHelperCopyWithImpl<_DataHelper>(this, _$identity);

  @override
  String toString() {
    return 'DataHelper(title: $title, desc: $desc, iconPath: $iconPath, icon: $icon, url: $url, type: $type, id: $id, isSelected: $isSelected, activeTheme: $activeTheme)';
  }
}

/// @nodoc
abstract mixin class _$DataHelperCopyWith<$Res>
    implements $DataHelperCopyWith<$Res> {
  factory _$DataHelperCopyWith(
          _DataHelper value, $Res Function(_DataHelper) _then) =
      __$DataHelperCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? title,
      String? desc,
      String? iconPath,
      IconData? icon,
      String? url,
      String? type,
      int? id,
      bool isSelected,
      ActiveTheme activeTheme});
}

/// @nodoc
class __$DataHelperCopyWithImpl<$Res> implements _$DataHelperCopyWith<$Res> {
  __$DataHelperCopyWithImpl(this._self, this._then);

  final _DataHelper _self;
  final $Res Function(_DataHelper) _then;

  /// Create a copy of DataHelper
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = freezed,
    Object? desc = freezed,
    Object? iconPath = freezed,
    Object? icon = freezed,
    Object? url = freezed,
    Object? type = freezed,
    Object? id = freezed,
    Object? isSelected = null,
    Object? activeTheme = null,
  }) {
    return _then(_DataHelper(
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      desc: freezed == desc
          ? _self.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String?,
      iconPath: freezed == iconPath
          ? _self.iconPath
          : iconPath // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _self.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconData?,
      url: freezed == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      isSelected: null == isSelected
          ? _self.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      activeTheme: null == activeTheme
          ? _self.activeTheme
          : activeTheme // ignore: cast_nullable_to_non_nullable
              as ActiveTheme,
    ));
  }
}

// dart format on
