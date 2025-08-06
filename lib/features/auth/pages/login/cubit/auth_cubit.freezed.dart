// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState()';
}


}

/// @nodoc
class $AuthStateCopyWith<$Res>  {
$AuthStateCopyWith(AuthState _, $Res Function(AuthState) __);
}


/// Adds pattern-matching-related methods to [AuthState].
extension AuthStatePatterns on AuthState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AuthStateLoading value)?  loading,TResult Function( AuthStateSuccess value)?  success,TResult Function( AuthStateFailure value)?  failure,TResult Function( AuthStateShowHide value)?  showHide,TResult Function( AuthStateInit value)?  init,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AuthStateLoading() when loading != null:
return loading(_that);case AuthStateSuccess() when success != null:
return success(_that);case AuthStateFailure() when failure != null:
return failure(_that);case AuthStateShowHide() when showHide != null:
return showHide(_that);case AuthStateInit() when init != null:
return init(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AuthStateLoading value)  loading,required TResult Function( AuthStateSuccess value)  success,required TResult Function( AuthStateFailure value)  failure,required TResult Function( AuthStateShowHide value)  showHide,required TResult Function( AuthStateInit value)  init,}){
final _that = this;
switch (_that) {
case AuthStateLoading():
return loading(_that);case AuthStateSuccess():
return success(_that);case AuthStateFailure():
return failure(_that);case AuthStateShowHide():
return showHide(_that);case AuthStateInit():
return init(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AuthStateLoading value)?  loading,TResult? Function( AuthStateSuccess value)?  success,TResult? Function( AuthStateFailure value)?  failure,TResult? Function( AuthStateShowHide value)?  showHide,TResult? Function( AuthStateInit value)?  init,}){
final _that = this;
switch (_that) {
case AuthStateLoading() when loading != null:
return loading(_that);case AuthStateSuccess() when success != null:
return success(_that);case AuthStateFailure() when failure != null:
return failure(_that);case AuthStateShowHide() when showHide != null:
return showHide(_that);case AuthStateInit() when init != null:
return init(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( String? data)?  success,TResult Function( String message)?  failure,TResult Function()?  showHide,TResult Function()?  init,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AuthStateLoading() when loading != null:
return loading();case AuthStateSuccess() when success != null:
return success(_that.data);case AuthStateFailure() when failure != null:
return failure(_that.message);case AuthStateShowHide() when showHide != null:
return showHide();case AuthStateInit() when init != null:
return init();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( String? data)  success,required TResult Function( String message)  failure,required TResult Function()  showHide,required TResult Function()  init,}) {final _that = this;
switch (_that) {
case AuthStateLoading():
return loading();case AuthStateSuccess():
return success(_that.data);case AuthStateFailure():
return failure(_that.message);case AuthStateShowHide():
return showHide();case AuthStateInit():
return init();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( String? data)?  success,TResult? Function( String message)?  failure,TResult? Function()?  showHide,TResult? Function()?  init,}) {final _that = this;
switch (_that) {
case AuthStateLoading() when loading != null:
return loading();case AuthStateSuccess() when success != null:
return success(_that.data);case AuthStateFailure() when failure != null:
return failure(_that.message);case AuthStateShowHide() when showHide != null:
return showHide();case AuthStateInit() when init != null:
return init();case _:
  return null;

}
}

}

/// @nodoc


class AuthStateLoading implements AuthState {
  const AuthStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.loading()';
}


}




/// @nodoc


class AuthStateSuccess implements AuthState {
  const AuthStateSuccess(this.data);
  

 final  String? data;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthStateSuccessCopyWith<AuthStateSuccess> get copyWith => _$AuthStateSuccessCopyWithImpl<AuthStateSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthStateSuccess&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'AuthState.success(data: $data)';
}


}

/// @nodoc
abstract mixin class $AuthStateSuccessCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $AuthStateSuccessCopyWith(AuthStateSuccess value, $Res Function(AuthStateSuccess) _then) = _$AuthStateSuccessCopyWithImpl;
@useResult
$Res call({
 String? data
});




}
/// @nodoc
class _$AuthStateSuccessCopyWithImpl<$Res>
    implements $AuthStateSuccessCopyWith<$Res> {
  _$AuthStateSuccessCopyWithImpl(this._self, this._then);

  final AuthStateSuccess _self;
  final $Res Function(AuthStateSuccess) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = freezed,}) {
  return _then(AuthStateSuccess(
freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class AuthStateFailure implements AuthState {
  const AuthStateFailure(this.message);
  

 final  String message;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthStateFailureCopyWith<AuthStateFailure> get copyWith => _$AuthStateFailureCopyWithImpl<AuthStateFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthStateFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AuthState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $AuthStateFailureCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $AuthStateFailureCopyWith(AuthStateFailure value, $Res Function(AuthStateFailure) _then) = _$AuthStateFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$AuthStateFailureCopyWithImpl<$Res>
    implements $AuthStateFailureCopyWith<$Res> {
  _$AuthStateFailureCopyWithImpl(this._self, this._then);

  final AuthStateFailure _self;
  final $Res Function(AuthStateFailure) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(AuthStateFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AuthStateShowHide implements AuthState {
  const AuthStateShowHide();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthStateShowHide);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.showHide()';
}


}




/// @nodoc


class AuthStateInit implements AuthState {
  const AuthStateInit();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthStateInit);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.init()';
}


}




// dart format on
