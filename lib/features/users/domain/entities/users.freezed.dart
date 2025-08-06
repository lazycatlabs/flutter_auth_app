// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'users.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Users {

 List<User>? get users; int? get currentPage; int? get lastPage;
/// Create a copy of Users
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UsersCopyWith<Users> get copyWith => _$UsersCopyWithImpl<Users>(this as Users, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Users&&const DeepCollectionEquality().equals(other.users, users)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(users),currentPage,lastPage);

@override
String toString() {
  return 'Users(users: $users, currentPage: $currentPage, lastPage: $lastPage)';
}


}

/// @nodoc
abstract mixin class $UsersCopyWith<$Res>  {
  factory $UsersCopyWith(Users value, $Res Function(Users) _then) = _$UsersCopyWithImpl;
@useResult
$Res call({
 List<User>? users, int? currentPage, int? lastPage
});




}
/// @nodoc
class _$UsersCopyWithImpl<$Res>
    implements $UsersCopyWith<$Res> {
  _$UsersCopyWithImpl(this._self, this._then);

  final Users _self;
  final $Res Function(Users) _then;

/// Create a copy of Users
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? users = freezed,Object? currentPage = freezed,Object? lastPage = freezed,}) {
  return _then(_self.copyWith(
users: freezed == users ? _self.users : users // ignore: cast_nullable_to_non_nullable
as List<User>?,currentPage: freezed == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int?,lastPage: freezed == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [Users].
extension UsersPatterns on Users {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Users value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Users() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Users value)  $default,){
final _that = this;
switch (_that) {
case _Users():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Users value)?  $default,){
final _that = this;
switch (_that) {
case _Users() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<User>? users,  int? currentPage,  int? lastPage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Users() when $default != null:
return $default(_that.users,_that.currentPage,_that.lastPage);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<User>? users,  int? currentPage,  int? lastPage)  $default,) {final _that = this;
switch (_that) {
case _Users():
return $default(_that.users,_that.currentPage,_that.lastPage);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<User>? users,  int? currentPage,  int? lastPage)?  $default,) {final _that = this;
switch (_that) {
case _Users() when $default != null:
return $default(_that.users,_that.currentPage,_that.lastPage);case _:
  return null;

}
}

}

/// @nodoc


class _Users implements Users {
  const _Users({final  List<User>? users, this.currentPage, this.lastPage}): _users = users;
  

 final  List<User>? _users;
@override List<User>? get users {
  final value = _users;
  if (value == null) return null;
  if (_users is EqualUnmodifiableListView) return _users;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  int? currentPage;
@override final  int? lastPage;

/// Create a copy of Users
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UsersCopyWith<_Users> get copyWith => __$UsersCopyWithImpl<_Users>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Users&&const DeepCollectionEquality().equals(other._users, _users)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_users),currentPage,lastPage);

@override
String toString() {
  return 'Users(users: $users, currentPage: $currentPage, lastPage: $lastPage)';
}


}

/// @nodoc
abstract mixin class _$UsersCopyWith<$Res> implements $UsersCopyWith<$Res> {
  factory _$UsersCopyWith(_Users value, $Res Function(_Users) _then) = __$UsersCopyWithImpl;
@override @useResult
$Res call({
 List<User>? users, int? currentPage, int? lastPage
});




}
/// @nodoc
class __$UsersCopyWithImpl<$Res>
    implements _$UsersCopyWith<$Res> {
  __$UsersCopyWithImpl(this._self, this._then);

  final _Users _self;
  final $Res Function(_Users) _then;

/// Create a copy of Users
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? users = freezed,Object? currentPage = freezed,Object? lastPage = freezed,}) {
  return _then(_Users(
users: freezed == users ? _self._users : users // ignore: cast_nullable_to_non_nullable
as List<User>?,currentPage: freezed == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int?,lastPage: freezed == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc
mixin _$User {

 String? get name; String? get avatar; String? get email; bool? get isVerified; String? get updatedAt;
/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserCopyWith<User> get copyWith => _$UserCopyWithImpl<User>(this as User, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is User&&(identical(other.name, name) || other.name == name)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.email, email) || other.email == email)&&(identical(other.isVerified, isVerified) || other.isVerified == isVerified)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,name,avatar,email,isVerified,updatedAt);

@override
String toString() {
  return 'User(name: $name, avatar: $avatar, email: $email, isVerified: $isVerified, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $UserCopyWith<$Res>  {
  factory $UserCopyWith(User value, $Res Function(User) _then) = _$UserCopyWithImpl;
@useResult
$Res call({
 String? name, String? avatar, String? email, bool? isVerified, String? updatedAt
});




}
/// @nodoc
class _$UserCopyWithImpl<$Res>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._self, this._then);

  final User _self;
  final $Res Function(User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? avatar = freezed,Object? email = freezed,Object? isVerified = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,isVerified: freezed == isVerified ? _self.isVerified : isVerified // ignore: cast_nullable_to_non_nullable
as bool?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [User].
extension UserPatterns on User {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _User value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _User value)  $default,){
final _that = this;
switch (_that) {
case _User():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _User value)?  $default,){
final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  String? avatar,  String? email,  bool? isVerified,  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that.name,_that.avatar,_that.email,_that.isVerified,_that.updatedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  String? avatar,  String? email,  bool? isVerified,  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _User():
return $default(_that.name,_that.avatar,_that.email,_that.isVerified,_that.updatedAt);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  String? avatar,  String? email,  bool? isVerified,  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that.name,_that.avatar,_that.email,_that.isVerified,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _User implements User {
  const _User({this.name, this.avatar, this.email, this.isVerified, this.updatedAt});
  

@override final  String? name;
@override final  String? avatar;
@override final  String? email;
@override final  bool? isVerified;
@override final  String? updatedAt;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserCopyWith<_User> get copyWith => __$UserCopyWithImpl<_User>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _User&&(identical(other.name, name) || other.name == name)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.email, email) || other.email == email)&&(identical(other.isVerified, isVerified) || other.isVerified == isVerified)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,name,avatar,email,isVerified,updatedAt);

@override
String toString() {
  return 'User(name: $name, avatar: $avatar, email: $email, isVerified: $isVerified, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) _then) = __$UserCopyWithImpl;
@override @useResult
$Res call({
 String? name, String? avatar, String? email, bool? isVerified, String? updatedAt
});




}
/// @nodoc
class __$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(this._self, this._then);

  final _User _self;
  final $Res Function(_User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? avatar = freezed,Object? email = freezed,Object? isVerified = freezed,Object? updatedAt = freezed,}) {
  return _then(_User(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,isVerified: freezed == isVerified ? _self.isVerified : isVerified // ignore: cast_nullable_to_non_nullable
as bool?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
