// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserState()';
}


}

/// @nodoc
class $UserStateCopyWith<$Res>  {
$UserStateCopyWith(UserState _, $Res Function(UserState) __);
}


/// Adds pattern-matching-related methods to [UserState].
extension UserStatePatterns on UserState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( UserStateLoading value)?  loading,TResult Function( UserStateFailure value)?  failure,TResult Function( UserStateSuccess value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case UserStateLoading() when loading != null:
return loading(_that);case UserStateFailure() when failure != null:
return failure(_that);case UserStateSuccess() when success != null:
return success(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( UserStateLoading value)  loading,required TResult Function( UserStateFailure value)  failure,required TResult Function( UserStateSuccess value)  success,}){
final _that = this;
switch (_that) {
case UserStateLoading():
return loading(_that);case UserStateFailure():
return failure(_that);case UserStateSuccess():
return success(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( UserStateLoading value)?  loading,TResult? Function( UserStateFailure value)?  failure,TResult? Function( UserStateSuccess value)?  success,}){
final _that = this;
switch (_that) {
case UserStateLoading() when loading != null:
return loading(_that);case UserStateFailure() when failure != null:
return failure(_that);case UserStateSuccess() when success != null:
return success(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( String message)?  failure,TResult Function( User? data)?  success,required TResult orElse(),}) {final _that = this;
switch (_that) {
case UserStateLoading() when loading != null:
return loading();case UserStateFailure() when failure != null:
return failure(_that.message);case UserStateSuccess() when success != null:
return success(_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( String message)  failure,required TResult Function( User? data)  success,}) {final _that = this;
switch (_that) {
case UserStateLoading():
return loading();case UserStateFailure():
return failure(_that.message);case UserStateSuccess():
return success(_that.data);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( String message)?  failure,TResult? Function( User? data)?  success,}) {final _that = this;
switch (_that) {
case UserStateLoading() when loading != null:
return loading();case UserStateFailure() when failure != null:
return failure(_that.message);case UserStateSuccess() when success != null:
return success(_that.data);case _:
  return null;

}
}

}

/// @nodoc


class UserStateLoading implements UserState {
  const UserStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserState.loading()';
}


}




/// @nodoc


class UserStateFailure implements UserState {
  const UserStateFailure(this.message);
  

 final  String message;

/// Create a copy of UserState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserStateFailureCopyWith<UserStateFailure> get copyWith => _$UserStateFailureCopyWithImpl<UserStateFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserStateFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'UserState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $UserStateFailureCopyWith<$Res> implements $UserStateCopyWith<$Res> {
  factory $UserStateFailureCopyWith(UserStateFailure value, $Res Function(UserStateFailure) _then) = _$UserStateFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$UserStateFailureCopyWithImpl<$Res>
    implements $UserStateFailureCopyWith<$Res> {
  _$UserStateFailureCopyWithImpl(this._self, this._then);

  final UserStateFailure _self;
  final $Res Function(UserStateFailure) _then;

/// Create a copy of UserState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(UserStateFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class UserStateSuccess implements UserState {
  const UserStateSuccess(this.data);
  

 final  User? data;

/// Create a copy of UserState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserStateSuccessCopyWith<UserStateSuccess> get copyWith => _$UserStateSuccessCopyWithImpl<UserStateSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserStateSuccess&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'UserState.success(data: $data)';
}


}

/// @nodoc
abstract mixin class $UserStateSuccessCopyWith<$Res> implements $UserStateCopyWith<$Res> {
  factory $UserStateSuccessCopyWith(UserStateSuccess value, $Res Function(UserStateSuccess) _then) = _$UserStateSuccessCopyWithImpl;
@useResult
$Res call({
 User? data
});


$UserCopyWith<$Res>? get data;

}
/// @nodoc
class _$UserStateSuccessCopyWithImpl<$Res>
    implements $UserStateSuccessCopyWith<$Res> {
  _$UserStateSuccessCopyWithImpl(this._self, this._then);

  final UserStateSuccess _self;
  final $Res Function(UserStateSuccess) _then;

/// Create a copy of UserState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = freezed,}) {
  return _then(UserStateSuccess(
freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as User?,
  ));
}

/// Create a copy of UserState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $UserCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

// dart format on
