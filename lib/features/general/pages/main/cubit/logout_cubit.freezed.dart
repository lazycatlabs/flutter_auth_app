// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'logout_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LogoutState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogoutState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LogoutState()';
}


}

/// @nodoc
class $LogoutStateCopyWith<$Res>  {
$LogoutStateCopyWith(LogoutState _, $Res Function(LogoutState) __);
}


/// Adds pattern-matching-related methods to [LogoutState].
extension LogoutStatePatterns on LogoutState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LogoutStateLoading value)?  loading,TResult Function( LogoutStateFailure value)?  failure,TResult Function( LogoutStateSuccess value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LogoutStateLoading() when loading != null:
return loading(_that);case LogoutStateFailure() when failure != null:
return failure(_that);case LogoutStateSuccess() when success != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LogoutStateLoading value)  loading,required TResult Function( LogoutStateFailure value)  failure,required TResult Function( LogoutStateSuccess value)  success,}){
final _that = this;
switch (_that) {
case LogoutStateLoading():
return loading(_that);case LogoutStateFailure():
return failure(_that);case LogoutStateSuccess():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LogoutStateLoading value)?  loading,TResult? Function( LogoutStateFailure value)?  failure,TResult? Function( LogoutStateSuccess value)?  success,}){
final _that = this;
switch (_that) {
case LogoutStateLoading() when loading != null:
return loading(_that);case LogoutStateFailure() when failure != null:
return failure(_that);case LogoutStateSuccess() when success != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( String message)?  failure,TResult Function( String message)?  success,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LogoutStateLoading() when loading != null:
return loading();case LogoutStateFailure() when failure != null:
return failure(_that.message);case LogoutStateSuccess() when success != null:
return success(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( String message)  failure,required TResult Function( String message)  success,}) {final _that = this;
switch (_that) {
case LogoutStateLoading():
return loading();case LogoutStateFailure():
return failure(_that.message);case LogoutStateSuccess():
return success(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( String message)?  failure,TResult? Function( String message)?  success,}) {final _that = this;
switch (_that) {
case LogoutStateLoading() when loading != null:
return loading();case LogoutStateFailure() when failure != null:
return failure(_that.message);case LogoutStateSuccess() when success != null:
return success(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class LogoutStateLoading implements LogoutState {
  const LogoutStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogoutStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LogoutState.loading()';
}


}




/// @nodoc


class LogoutStateFailure implements LogoutState {
  const LogoutStateFailure(this.message);
  

 final  String message;

/// Create a copy of LogoutState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LogoutStateFailureCopyWith<LogoutStateFailure> get copyWith => _$LogoutStateFailureCopyWithImpl<LogoutStateFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogoutStateFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'LogoutState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $LogoutStateFailureCopyWith<$Res> implements $LogoutStateCopyWith<$Res> {
  factory $LogoutStateFailureCopyWith(LogoutStateFailure value, $Res Function(LogoutStateFailure) _then) = _$LogoutStateFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$LogoutStateFailureCopyWithImpl<$Res>
    implements $LogoutStateFailureCopyWith<$Res> {
  _$LogoutStateFailureCopyWithImpl(this._self, this._then);

  final LogoutStateFailure _self;
  final $Res Function(LogoutStateFailure) _then;

/// Create a copy of LogoutState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(LogoutStateFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class LogoutStateSuccess implements LogoutState {
  const LogoutStateSuccess(this.message);
  

 final  String message;

/// Create a copy of LogoutState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LogoutStateSuccessCopyWith<LogoutStateSuccess> get copyWith => _$LogoutStateSuccessCopyWithImpl<LogoutStateSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogoutStateSuccess&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'LogoutState.success(message: $message)';
}


}

/// @nodoc
abstract mixin class $LogoutStateSuccessCopyWith<$Res> implements $LogoutStateCopyWith<$Res> {
  factory $LogoutStateSuccessCopyWith(LogoutStateSuccess value, $Res Function(LogoutStateSuccess) _then) = _$LogoutStateSuccessCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$LogoutStateSuccessCopyWithImpl<$Res>
    implements $LogoutStateSuccessCopyWith<$Res> {
  _$LogoutStateSuccessCopyWithImpl(this._self, this._then);

  final LogoutStateSuccess _self;
  final $Res Function(LogoutStateSuccess) _then;

/// Create a copy of LogoutState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(LogoutStateSuccess(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
