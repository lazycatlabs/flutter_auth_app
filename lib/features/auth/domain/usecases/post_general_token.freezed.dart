// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_general_token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GeneralTokenParams {

 String? get clientId; String? get clientSecret;
/// Create a copy of GeneralTokenParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GeneralTokenParamsCopyWith<GeneralTokenParams> get copyWith => _$GeneralTokenParamsCopyWithImpl<GeneralTokenParams>(this as GeneralTokenParams, _$identity);

  /// Serializes this GeneralTokenParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GeneralTokenParams&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.clientSecret, clientSecret) || other.clientSecret == clientSecret));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clientId,clientSecret);

@override
String toString() {
  return 'GeneralTokenParams(clientId: $clientId, clientSecret: $clientSecret)';
}


}

/// @nodoc
abstract mixin class $GeneralTokenParamsCopyWith<$Res>  {
  factory $GeneralTokenParamsCopyWith(GeneralTokenParams value, $Res Function(GeneralTokenParams) _then) = _$GeneralTokenParamsCopyWithImpl;
@useResult
$Res call({
 String? clientId, String? clientSecret
});




}
/// @nodoc
class _$GeneralTokenParamsCopyWithImpl<$Res>
    implements $GeneralTokenParamsCopyWith<$Res> {
  _$GeneralTokenParamsCopyWithImpl(this._self, this._then);

  final GeneralTokenParams _self;
  final $Res Function(GeneralTokenParams) _then;

/// Create a copy of GeneralTokenParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? clientId = freezed,Object? clientSecret = freezed,}) {
  return _then(_self.copyWith(
clientId: freezed == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String?,clientSecret: freezed == clientSecret ? _self.clientSecret : clientSecret // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [GeneralTokenParams].
extension GeneralTokenParamsPatterns on GeneralTokenParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GeneralTokenParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GeneralTokenParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GeneralTokenParams value)  $default,){
final _that = this;
switch (_that) {
case _GeneralTokenParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GeneralTokenParams value)?  $default,){
final _that = this;
switch (_that) {
case _GeneralTokenParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? clientId,  String? clientSecret)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GeneralTokenParams() when $default != null:
return $default(_that.clientId,_that.clientSecret);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? clientId,  String? clientSecret)  $default,) {final _that = this;
switch (_that) {
case _GeneralTokenParams():
return $default(_that.clientId,_that.clientSecret);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? clientId,  String? clientSecret)?  $default,) {final _that = this;
switch (_that) {
case _GeneralTokenParams() when $default != null:
return $default(_that.clientId,_that.clientSecret);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GeneralTokenParams implements GeneralTokenParams {
  const _GeneralTokenParams({this.clientId, this.clientSecret});
  factory _GeneralTokenParams.fromJson(Map<String, dynamic> json) => _$GeneralTokenParamsFromJson(json);

@override final  String? clientId;
@override final  String? clientSecret;

/// Create a copy of GeneralTokenParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GeneralTokenParamsCopyWith<_GeneralTokenParams> get copyWith => __$GeneralTokenParamsCopyWithImpl<_GeneralTokenParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GeneralTokenParamsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GeneralTokenParams&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.clientSecret, clientSecret) || other.clientSecret == clientSecret));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clientId,clientSecret);

@override
String toString() {
  return 'GeneralTokenParams(clientId: $clientId, clientSecret: $clientSecret)';
}


}

/// @nodoc
abstract mixin class _$GeneralTokenParamsCopyWith<$Res> implements $GeneralTokenParamsCopyWith<$Res> {
  factory _$GeneralTokenParamsCopyWith(_GeneralTokenParams value, $Res Function(_GeneralTokenParams) _then) = __$GeneralTokenParamsCopyWithImpl;
@override @useResult
$Res call({
 String? clientId, String? clientSecret
});




}
/// @nodoc
class __$GeneralTokenParamsCopyWithImpl<$Res>
    implements _$GeneralTokenParamsCopyWith<$Res> {
  __$GeneralTokenParamsCopyWithImpl(this._self, this._then);

  final _GeneralTokenParams _self;
  final $Res Function(_GeneralTokenParams) _then;

/// Create a copy of GeneralTokenParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? clientId = freezed,Object? clientSecret = freezed,}) {
  return _then(_GeneralTokenParams(
clientId: freezed == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String?,clientSecret: freezed == clientSecret ? _self.clientSecret : clientSecret // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
