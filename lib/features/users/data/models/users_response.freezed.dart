// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'users_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UsersResponse {
  @JsonKey(name: "diagnostic")
  Diagnostic? get diagnostic;
  @JsonKey(name: "data")
  List<DataUser>? get data;
  @JsonKey(name: "page")
  Page? get page;

  /// Create a copy of UsersResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UsersResponseCopyWith<UsersResponse> get copyWith =>
      _$UsersResponseCopyWithImpl<UsersResponse>(
          this as UsersResponse, _$identity);

  /// Serializes this UsersResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UsersResponse &&
            (identical(other.diagnostic, diagnostic) ||
                other.diagnostic == diagnostic) &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.page, page) || other.page == page));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, diagnostic, const DeepCollectionEquality().hash(data), page);

  @override
  String toString() {
    return 'UsersResponse(diagnostic: $diagnostic, data: $data, page: $page)';
  }
}

/// @nodoc
abstract mixin class $UsersResponseCopyWith<$Res> {
  factory $UsersResponseCopyWith(
          UsersResponse value, $Res Function(UsersResponse) _then) =
      _$UsersResponseCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "diagnostic") Diagnostic? diagnostic,
      @JsonKey(name: "data") List<DataUser>? data,
      @JsonKey(name: "page") Page? page});

  $DiagnosticCopyWith<$Res>? get diagnostic;
  $PageCopyWith<$Res>? get page;
}

/// @nodoc
class _$UsersResponseCopyWithImpl<$Res>
    implements $UsersResponseCopyWith<$Res> {
  _$UsersResponseCopyWithImpl(this._self, this._then);

  final UsersResponse _self;
  final $Res Function(UsersResponse) _then;

  /// Create a copy of UsersResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? diagnostic = freezed,
    Object? data = freezed,
    Object? page = freezed,
  }) {
    return _then(_self.copyWith(
      diagnostic: freezed == diagnostic
          ? _self.diagnostic
          : diagnostic // ignore: cast_nullable_to_non_nullable
              as Diagnostic?,
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<DataUser>?,
      page: freezed == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as Page?,
    ));
  }

  /// Create a copy of UsersResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DiagnosticCopyWith<$Res>? get diagnostic {
    if (_self.diagnostic == null) {
      return null;
    }

    return $DiagnosticCopyWith<$Res>(_self.diagnostic!, (value) {
      return _then(_self.copyWith(diagnostic: value));
    });
  }

  /// Create a copy of UsersResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PageCopyWith<$Res>? get page {
    if (_self.page == null) {
      return null;
    }

    return $PageCopyWith<$Res>(_self.page!, (value) {
      return _then(_self.copyWith(page: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _UsersResponse extends UsersResponse {
  const _UsersResponse(
      {@JsonKey(name: "diagnostic") this.diagnostic,
      @JsonKey(name: "data") final List<DataUser>? data,
      @JsonKey(name: "page") this.page})
      : _data = data,
        super._();
  factory _UsersResponse.fromJson(Map<String, dynamic> json) =>
      _$UsersResponseFromJson(json);

  @override
  @JsonKey(name: "diagnostic")
  final Diagnostic? diagnostic;
  final List<DataUser>? _data;
  @override
  @JsonKey(name: "data")
  List<DataUser>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "page")
  final Page? page;

  /// Create a copy of UsersResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UsersResponseCopyWith<_UsersResponse> get copyWith =>
      __$UsersResponseCopyWithImpl<_UsersResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UsersResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UsersResponse &&
            (identical(other.diagnostic, diagnostic) ||
                other.diagnostic == diagnostic) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.page, page) || other.page == page));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, diagnostic,
      const DeepCollectionEquality().hash(_data), page);

  @override
  String toString() {
    return 'UsersResponse(diagnostic: $diagnostic, data: $data, page: $page)';
  }
}

/// @nodoc
abstract mixin class _$UsersResponseCopyWith<$Res>
    implements $UsersResponseCopyWith<$Res> {
  factory _$UsersResponseCopyWith(
          _UsersResponse value, $Res Function(_UsersResponse) _then) =
      __$UsersResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "diagnostic") Diagnostic? diagnostic,
      @JsonKey(name: "data") List<DataUser>? data,
      @JsonKey(name: "page") Page? page});

  @override
  $DiagnosticCopyWith<$Res>? get diagnostic;
  @override
  $PageCopyWith<$Res>? get page;
}

/// @nodoc
class __$UsersResponseCopyWithImpl<$Res>
    implements _$UsersResponseCopyWith<$Res> {
  __$UsersResponseCopyWithImpl(this._self, this._then);

  final _UsersResponse _self;
  final $Res Function(_UsersResponse) _then;

  /// Create a copy of UsersResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? diagnostic = freezed,
    Object? data = freezed,
    Object? page = freezed,
  }) {
    return _then(_UsersResponse(
      diagnostic: freezed == diagnostic
          ? _self.diagnostic
          : diagnostic // ignore: cast_nullable_to_non_nullable
              as Diagnostic?,
      data: freezed == data
          ? _self._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<DataUser>?,
      page: freezed == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as Page?,
    ));
  }

  /// Create a copy of UsersResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DiagnosticCopyWith<$Res>? get diagnostic {
    if (_self.diagnostic == null) {
      return null;
    }

    return $DiagnosticCopyWith<$Res>(_self.diagnostic!, (value) {
      return _then(_self.copyWith(diagnostic: value));
    });
  }

  /// Create a copy of UsersResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PageCopyWith<$Res>? get page {
    if (_self.page == null) {
      return null;
    }

    return $PageCopyWith<$Res>(_self.page!, (value) {
      return _then(_self.copyWith(page: value));
    });
  }
}

/// @nodoc
mixin _$DataUser {
  @JsonKey(name: "id")
  String? get id;
  @JsonKey(name: "name")
  String? get name;
  @JsonKey(name: "email")
  String? get email;
  @JsonKey(name: "photo")
  String? get photo;
  @JsonKey(name: "verified")
  bool? get verified;
  @JsonKey(name: "createdAt")
  String? get createdAt;
  @JsonKey(name: "updatedAt")
  String? get updatedAt;

  /// Create a copy of DataUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DataUserCopyWith<DataUser> get copyWith =>
      _$DataUserCopyWithImpl<DataUser>(this as DataUser, _$identity);

  /// Serializes this DataUser to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DataUser &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.photo, photo) || other.photo == photo) &&
            (identical(other.verified, verified) ||
                other.verified == verified) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, email, photo, verified, createdAt, updatedAt);

  @override
  String toString() {
    return 'DataUser(id: $id, name: $name, email: $email, photo: $photo, verified: $verified, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $DataUserCopyWith<$Res> {
  factory $DataUserCopyWith(DataUser value, $Res Function(DataUser) _then) =
      _$DataUserCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "id") String? id,
      @JsonKey(name: "name") String? name,
      @JsonKey(name: "email") String? email,
      @JsonKey(name: "photo") String? photo,
      @JsonKey(name: "verified") bool? verified,
      @JsonKey(name: "createdAt") String? createdAt,
      @JsonKey(name: "updatedAt") String? updatedAt});
}

/// @nodoc
class _$DataUserCopyWithImpl<$Res> implements $DataUserCopyWith<$Res> {
  _$DataUserCopyWithImpl(this._self, this._then);

  final DataUser _self;
  final $Res Function(DataUser) _then;

  /// Create a copy of DataUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? photo = freezed,
    Object? verified = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      photo: freezed == photo
          ? _self.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      verified: freezed == verified
          ? _self.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _DataUser implements DataUser {
  const _DataUser(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "name") this.name,
      @JsonKey(name: "email") this.email,
      @JsonKey(name: "photo") this.photo,
      @JsonKey(name: "verified") this.verified,
      @JsonKey(name: "createdAt") this.createdAt,
      @JsonKey(name: "updatedAt") this.updatedAt});
  factory _DataUser.fromJson(Map<String, dynamic> json) =>
      _$DataUserFromJson(json);

  @override
  @JsonKey(name: "id")
  final String? id;
  @override
  @JsonKey(name: "name")
  final String? name;
  @override
  @JsonKey(name: "email")
  final String? email;
  @override
  @JsonKey(name: "photo")
  final String? photo;
  @override
  @JsonKey(name: "verified")
  final bool? verified;
  @override
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @override
  @JsonKey(name: "updatedAt")
  final String? updatedAt;

  /// Create a copy of DataUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DataUserCopyWith<_DataUser> get copyWith =>
      __$DataUserCopyWithImpl<_DataUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DataUserToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DataUser &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.photo, photo) || other.photo == photo) &&
            (identical(other.verified, verified) ||
                other.verified == verified) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, email, photo, verified, createdAt, updatedAt);

  @override
  String toString() {
    return 'DataUser(id: $id, name: $name, email: $email, photo: $photo, verified: $verified, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$DataUserCopyWith<$Res>
    implements $DataUserCopyWith<$Res> {
  factory _$DataUserCopyWith(_DataUser value, $Res Function(_DataUser) _then) =
      __$DataUserCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") String? id,
      @JsonKey(name: "name") String? name,
      @JsonKey(name: "email") String? email,
      @JsonKey(name: "photo") String? photo,
      @JsonKey(name: "verified") bool? verified,
      @JsonKey(name: "createdAt") String? createdAt,
      @JsonKey(name: "updatedAt") String? updatedAt});
}

/// @nodoc
class __$DataUserCopyWithImpl<$Res> implements _$DataUserCopyWith<$Res> {
  __$DataUserCopyWithImpl(this._self, this._then);

  final _DataUser _self;
  final $Res Function(_DataUser) _then;

  /// Create a copy of DataUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? photo = freezed,
    Object? verified = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_DataUser(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      photo: freezed == photo
          ? _self.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      verified: freezed == verified
          ? _self.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
