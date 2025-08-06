// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_login.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LoginParams {

 String get email; String get password; String? get osInfo; String? get deviceInfo; String get fcmToken;
/// Create a copy of LoginParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginParamsCopyWith<LoginParams> get copyWith => _$LoginParamsCopyWithImpl<LoginParams>(this as LoginParams, _$identity);

  /// Serializes this LoginParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginParams&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.osInfo, osInfo) || other.osInfo == osInfo)&&(identical(other.deviceInfo, deviceInfo) || other.deviceInfo == deviceInfo)&&(identical(other.fcmToken, fcmToken) || other.fcmToken == fcmToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,password,osInfo,deviceInfo,fcmToken);

@override
String toString() {
  return 'LoginParams(email: $email, password: $password, osInfo: $osInfo, deviceInfo: $deviceInfo, fcmToken: $fcmToken)';
}


}

/// @nodoc
abstract mixin class $LoginParamsCopyWith<$Res>  {
  factory $LoginParamsCopyWith(LoginParams value, $Res Function(LoginParams) _then) = _$LoginParamsCopyWithImpl;
@useResult
$Res call({
 String email, String password, String? osInfo, String? deviceInfo, String fcmToken
});




}
/// @nodoc
class _$LoginParamsCopyWithImpl<$Res>
    implements $LoginParamsCopyWith<$Res> {
  _$LoginParamsCopyWithImpl(this._self, this._then);

  final LoginParams _self;
  final $Res Function(LoginParams) _then;

/// Create a copy of LoginParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? password = null,Object? osInfo = freezed,Object? deviceInfo = freezed,Object? fcmToken = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,osInfo: freezed == osInfo ? _self.osInfo : osInfo // ignore: cast_nullable_to_non_nullable
as String?,deviceInfo: freezed == deviceInfo ? _self.deviceInfo : deviceInfo // ignore: cast_nullable_to_non_nullable
as String?,fcmToken: null == fcmToken ? _self.fcmToken : fcmToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LoginParams].
extension LoginParamsPatterns on LoginParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoginParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoginParams value)  $default,){
final _that = this;
switch (_that) {
case _LoginParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoginParams value)?  $default,){
final _that = this;
switch (_that) {
case _LoginParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String email,  String password,  String? osInfo,  String? deviceInfo,  String fcmToken)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginParams() when $default != null:
return $default(_that.email,_that.password,_that.osInfo,_that.deviceInfo,_that.fcmToken);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String email,  String password,  String? osInfo,  String? deviceInfo,  String fcmToken)  $default,) {final _that = this;
switch (_that) {
case _LoginParams():
return $default(_that.email,_that.password,_that.osInfo,_that.deviceInfo,_that.fcmToken);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String email,  String password,  String? osInfo,  String? deviceInfo,  String fcmToken)?  $default,) {final _that = this;
switch (_that) {
case _LoginParams() when $default != null:
return $default(_that.email,_that.password,_that.osInfo,_that.deviceInfo,_that.fcmToken);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LoginParams implements LoginParams {
  const _LoginParams({this.email = "", this.password = "", this.osInfo, this.deviceInfo, this.fcmToken = "GeneratedFCMToken"});
  factory _LoginParams.fromJson(Map<String, dynamic> json) => _$LoginParamsFromJson(json);

@override@JsonKey() final  String email;
@override@JsonKey() final  String password;
@override final  String? osInfo;
@override final  String? deviceInfo;
@override@JsonKey() final  String fcmToken;

/// Create a copy of LoginParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginParamsCopyWith<_LoginParams> get copyWith => __$LoginParamsCopyWithImpl<_LoginParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoginParamsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginParams&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.osInfo, osInfo) || other.osInfo == osInfo)&&(identical(other.deviceInfo, deviceInfo) || other.deviceInfo == deviceInfo)&&(identical(other.fcmToken, fcmToken) || other.fcmToken == fcmToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,password,osInfo,deviceInfo,fcmToken);

@override
String toString() {
  return 'LoginParams(email: $email, password: $password, osInfo: $osInfo, deviceInfo: $deviceInfo, fcmToken: $fcmToken)';
}


}

/// @nodoc
abstract mixin class _$LoginParamsCopyWith<$Res> implements $LoginParamsCopyWith<$Res> {
  factory _$LoginParamsCopyWith(_LoginParams value, $Res Function(_LoginParams) _then) = __$LoginParamsCopyWithImpl;
@override @useResult
$Res call({
 String email, String password, String? osInfo, String? deviceInfo, String fcmToken
});




}
/// @nodoc
class __$LoginParamsCopyWithImpl<$Res>
    implements _$LoginParamsCopyWith<$Res> {
  __$LoginParamsCopyWithImpl(this._self, this._then);

  final _LoginParams _self;
  final $Res Function(_LoginParams) _then;

/// Create a copy of LoginParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,Object? osInfo = freezed,Object? deviceInfo = freezed,Object? fcmToken = null,}) {
  return _then(_LoginParams(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,osInfo: freezed == osInfo ? _self.osInfo : osInfo // ignore: cast_nullable_to_non_nullable
as String?,deviceInfo: freezed == deviceInfo ? _self.deviceInfo : deviceInfo // ignore: cast_nullable_to_non_nullable
as String?,fcmToken: null == fcmToken ? _self.fcmToken : fcmToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
