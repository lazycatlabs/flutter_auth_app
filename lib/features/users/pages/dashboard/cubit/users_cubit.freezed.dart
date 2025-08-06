// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'users_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UsersState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UsersState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UsersState()';
}


}

/// @nodoc
class $UsersStateCopyWith<$Res>  {
$UsersStateCopyWith(UsersState _, $Res Function(UsersState) __);
}


/// Adds pattern-matching-related methods to [UsersState].
extension UsersStatePatterns on UsersState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( UsersStateLoading value)?  loading,TResult Function( UsersStateInitial value)?  initial,TResult Function( UsersStateSuccess value)?  success,TResult Function( UsersStateFailure value)?  failure,TResult Function( UsersStateEmpty value)?  empty,required TResult orElse(),}){
final _that = this;
switch (_that) {
case UsersStateLoading() when loading != null:
return loading(_that);case UsersStateInitial() when initial != null:
return initial(_that);case UsersStateSuccess() when success != null:
return success(_that);case UsersStateFailure() when failure != null:
return failure(_that);case UsersStateEmpty() when empty != null:
return empty(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( UsersStateLoading value)  loading,required TResult Function( UsersStateInitial value)  initial,required TResult Function( UsersStateSuccess value)  success,required TResult Function( UsersStateFailure value)  failure,required TResult Function( UsersStateEmpty value)  empty,}){
final _that = this;
switch (_that) {
case UsersStateLoading():
return loading(_that);case UsersStateInitial():
return initial(_that);case UsersStateSuccess():
return success(_that);case UsersStateFailure():
return failure(_that);case UsersStateEmpty():
return empty(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( UsersStateLoading value)?  loading,TResult? Function( UsersStateInitial value)?  initial,TResult? Function( UsersStateSuccess value)?  success,TResult? Function( UsersStateFailure value)?  failure,TResult? Function( UsersStateEmpty value)?  empty,}){
final _that = this;
switch (_that) {
case UsersStateLoading() when loading != null:
return loading(_that);case UsersStateInitial() when initial != null:
return initial(_that);case UsersStateSuccess() when success != null:
return success(_that);case UsersStateFailure() when failure != null:
return failure(_that);case UsersStateEmpty() when empty != null:
return empty(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function()?  initial,TResult Function( Users data)?  success,TResult Function( String message)?  failure,TResult Function()?  empty,required TResult orElse(),}) {final _that = this;
switch (_that) {
case UsersStateLoading() when loading != null:
return loading();case UsersStateInitial() when initial != null:
return initial();case UsersStateSuccess() when success != null:
return success(_that.data);case UsersStateFailure() when failure != null:
return failure(_that.message);case UsersStateEmpty() when empty != null:
return empty();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function()  initial,required TResult Function( Users data)  success,required TResult Function( String message)  failure,required TResult Function()  empty,}) {final _that = this;
switch (_that) {
case UsersStateLoading():
return loading();case UsersStateInitial():
return initial();case UsersStateSuccess():
return success(_that.data);case UsersStateFailure():
return failure(_that.message);case UsersStateEmpty():
return empty();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function()?  initial,TResult? Function( Users data)?  success,TResult? Function( String message)?  failure,TResult? Function()?  empty,}) {final _that = this;
switch (_that) {
case UsersStateLoading() when loading != null:
return loading();case UsersStateInitial() when initial != null:
return initial();case UsersStateSuccess() when success != null:
return success(_that.data);case UsersStateFailure() when failure != null:
return failure(_that.message);case UsersStateEmpty() when empty != null:
return empty();case _:
  return null;

}
}

}

/// @nodoc


class UsersStateLoading implements UsersState {
  const UsersStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UsersStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UsersState.loading()';
}


}




/// @nodoc


class UsersStateInitial implements UsersState {
  const UsersStateInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UsersStateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UsersState.initial()';
}


}




/// @nodoc


class UsersStateSuccess implements UsersState {
  const UsersStateSuccess(this.data);
  

 final  Users data;

/// Create a copy of UsersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UsersStateSuccessCopyWith<UsersStateSuccess> get copyWith => _$UsersStateSuccessCopyWithImpl<UsersStateSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UsersStateSuccess&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'UsersState.success(data: $data)';
}


}

/// @nodoc
abstract mixin class $UsersStateSuccessCopyWith<$Res> implements $UsersStateCopyWith<$Res> {
  factory $UsersStateSuccessCopyWith(UsersStateSuccess value, $Res Function(UsersStateSuccess) _then) = _$UsersStateSuccessCopyWithImpl;
@useResult
$Res call({
 Users data
});


$UsersCopyWith<$Res> get data;

}
/// @nodoc
class _$UsersStateSuccessCopyWithImpl<$Res>
    implements $UsersStateSuccessCopyWith<$Res> {
  _$UsersStateSuccessCopyWithImpl(this._self, this._then);

  final UsersStateSuccess _self;
  final $Res Function(UsersStateSuccess) _then;

/// Create a copy of UsersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(UsersStateSuccess(
null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as Users,
  ));
}

/// Create a copy of UsersState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UsersCopyWith<$Res> get data {
  
  return $UsersCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

/// @nodoc


class UsersStateFailure implements UsersState {
  const UsersStateFailure(this.message);
  

 final  String message;

/// Create a copy of UsersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UsersStateFailureCopyWith<UsersStateFailure> get copyWith => _$UsersStateFailureCopyWithImpl<UsersStateFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UsersStateFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'UsersState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $UsersStateFailureCopyWith<$Res> implements $UsersStateCopyWith<$Res> {
  factory $UsersStateFailureCopyWith(UsersStateFailure value, $Res Function(UsersStateFailure) _then) = _$UsersStateFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$UsersStateFailureCopyWithImpl<$Res>
    implements $UsersStateFailureCopyWith<$Res> {
  _$UsersStateFailureCopyWithImpl(this._self, this._then);

  final UsersStateFailure _self;
  final $Res Function(UsersStateFailure) _then;

/// Create a copy of UsersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(UsersStateFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class UsersStateEmpty implements UsersState {
  const UsersStateEmpty();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UsersStateEmpty);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UsersState.empty()';
}


}




// dart format on
