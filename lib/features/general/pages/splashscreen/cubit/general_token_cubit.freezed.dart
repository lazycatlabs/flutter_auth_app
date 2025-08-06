// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'general_token_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GeneralTokenState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GeneralTokenState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GeneralTokenState()';
}


}

/// @nodoc
class $GeneralTokenStateCopyWith<$Res>  {
$GeneralTokenStateCopyWith(GeneralTokenState _, $Res Function(GeneralTokenState) __);
}


/// Adds pattern-matching-related methods to [GeneralTokenState].
extension GeneralTokenStatePatterns on GeneralTokenState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GeneralTokenStateLoading value)?  loading,TResult Function( GeneralTokenStateSuccess value)?  success,TResult Function( GeneralTokenStateFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GeneralTokenStateLoading() when loading != null:
return loading(_that);case GeneralTokenStateSuccess() when success != null:
return success(_that);case GeneralTokenStateFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GeneralTokenStateLoading value)  loading,required TResult Function( GeneralTokenStateSuccess value)  success,required TResult Function( GeneralTokenStateFailure value)  failure,}){
final _that = this;
switch (_that) {
case GeneralTokenStateLoading():
return loading(_that);case GeneralTokenStateSuccess():
return success(_that);case GeneralTokenStateFailure():
return failure(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GeneralTokenStateLoading value)?  loading,TResult? Function( GeneralTokenStateSuccess value)?  success,TResult? Function( GeneralTokenStateFailure value)?  failure,}){
final _that = this;
switch (_that) {
case GeneralTokenStateLoading() when loading != null:
return loading(_that);case GeneralTokenStateSuccess() when success != null:
return success(_that);case GeneralTokenStateFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( String? data)?  success,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GeneralTokenStateLoading() when loading != null:
return loading();case GeneralTokenStateSuccess() when success != null:
return success(_that.data);case GeneralTokenStateFailure() when failure != null:
return failure(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( String? data)  success,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case GeneralTokenStateLoading():
return loading();case GeneralTokenStateSuccess():
return success(_that.data);case GeneralTokenStateFailure():
return failure(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( String? data)?  success,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case GeneralTokenStateLoading() when loading != null:
return loading();case GeneralTokenStateSuccess() when success != null:
return success(_that.data);case GeneralTokenStateFailure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class GeneralTokenStateLoading implements GeneralTokenState {
  const GeneralTokenStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GeneralTokenStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GeneralTokenState.loading()';
}


}




/// @nodoc


class GeneralTokenStateSuccess implements GeneralTokenState {
  const GeneralTokenStateSuccess(this.data);
  

 final  String? data;

/// Create a copy of GeneralTokenState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GeneralTokenStateSuccessCopyWith<GeneralTokenStateSuccess> get copyWith => _$GeneralTokenStateSuccessCopyWithImpl<GeneralTokenStateSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GeneralTokenStateSuccess&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'GeneralTokenState.success(data: $data)';
}


}

/// @nodoc
abstract mixin class $GeneralTokenStateSuccessCopyWith<$Res> implements $GeneralTokenStateCopyWith<$Res> {
  factory $GeneralTokenStateSuccessCopyWith(GeneralTokenStateSuccess value, $Res Function(GeneralTokenStateSuccess) _then) = _$GeneralTokenStateSuccessCopyWithImpl;
@useResult
$Res call({
 String? data
});




}
/// @nodoc
class _$GeneralTokenStateSuccessCopyWithImpl<$Res>
    implements $GeneralTokenStateSuccessCopyWith<$Res> {
  _$GeneralTokenStateSuccessCopyWithImpl(this._self, this._then);

  final GeneralTokenStateSuccess _self;
  final $Res Function(GeneralTokenStateSuccess) _then;

/// Create a copy of GeneralTokenState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = freezed,}) {
  return _then(GeneralTokenStateSuccess(
freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class GeneralTokenStateFailure implements GeneralTokenState {
  const GeneralTokenStateFailure(this.message);
  

 final  String message;

/// Create a copy of GeneralTokenState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GeneralTokenStateFailureCopyWith<GeneralTokenStateFailure> get copyWith => _$GeneralTokenStateFailureCopyWithImpl<GeneralTokenStateFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GeneralTokenStateFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'GeneralTokenState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $GeneralTokenStateFailureCopyWith<$Res> implements $GeneralTokenStateCopyWith<$Res> {
  factory $GeneralTokenStateFailureCopyWith(GeneralTokenStateFailure value, $Res Function(GeneralTokenStateFailure) _then) = _$GeneralTokenStateFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$GeneralTokenStateFailureCopyWithImpl<$Res>
    implements $GeneralTokenStateFailureCopyWith<$Res> {
  _$GeneralTokenStateFailureCopyWithImpl(this._self, this._then);

  final GeneralTokenStateFailure _self;
  final $Res Function(GeneralTokenStateFailure) _then;

/// Create a copy of GeneralTokenState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(GeneralTokenStateFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
