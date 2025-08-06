// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diagnostic.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Diagnostic {

@JsonKey(name: "status") String? get status;@JsonKey(name: "message") String? get message;
/// Create a copy of Diagnostic
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DiagnosticCopyWith<Diagnostic> get copyWith => _$DiagnosticCopyWithImpl<Diagnostic>(this as Diagnostic, _$identity);

  /// Serializes this Diagnostic to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Diagnostic&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,message);

@override
String toString() {
  return 'Diagnostic(status: $status, message: $message)';
}


}

/// @nodoc
abstract mixin class $DiagnosticCopyWith<$Res>  {
  factory $DiagnosticCopyWith(Diagnostic value, $Res Function(Diagnostic) _then) = _$DiagnosticCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "status") String? status,@JsonKey(name: "message") String? message
});




}
/// @nodoc
class _$DiagnosticCopyWithImpl<$Res>
    implements $DiagnosticCopyWith<$Res> {
  _$DiagnosticCopyWithImpl(this._self, this._then);

  final Diagnostic _self;
  final $Res Function(Diagnostic) _then;

/// Create a copy of Diagnostic
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = freezed,Object? message = freezed,}) {
  return _then(_self.copyWith(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Diagnostic].
extension DiagnosticPatterns on Diagnostic {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Diagnostic value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Diagnostic() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Diagnostic value)  $default,){
final _that = this;
switch (_that) {
case _Diagnostic():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Diagnostic value)?  $default,){
final _that = this;
switch (_that) {
case _Diagnostic() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "status")  String? status, @JsonKey(name: "message")  String? message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Diagnostic() when $default != null:
return $default(_that.status,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "status")  String? status, @JsonKey(name: "message")  String? message)  $default,) {final _that = this;
switch (_that) {
case _Diagnostic():
return $default(_that.status,_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "status")  String? status, @JsonKey(name: "message")  String? message)?  $default,) {final _that = this;
switch (_that) {
case _Diagnostic() when $default != null:
return $default(_that.status,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Diagnostic implements Diagnostic {
  const _Diagnostic({@JsonKey(name: "status") this.status, @JsonKey(name: "message") this.message});
  factory _Diagnostic.fromJson(Map<String, dynamic> json) => _$DiagnosticFromJson(json);

@override@JsonKey(name: "status") final  String? status;
@override@JsonKey(name: "message") final  String? message;

/// Create a copy of Diagnostic
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DiagnosticCopyWith<_Diagnostic> get copyWith => __$DiagnosticCopyWithImpl<_Diagnostic>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DiagnosticToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Diagnostic&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,message);

@override
String toString() {
  return 'Diagnostic(status: $status, message: $message)';
}


}

/// @nodoc
abstract mixin class _$DiagnosticCopyWith<$Res> implements $DiagnosticCopyWith<$Res> {
  factory _$DiagnosticCopyWith(_Diagnostic value, $Res Function(_Diagnostic) _then) = __$DiagnosticCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "status") String? status,@JsonKey(name: "message") String? message
});




}
/// @nodoc
class __$DiagnosticCopyWithImpl<$Res>
    implements _$DiagnosticCopyWith<$Res> {
  __$DiagnosticCopyWithImpl(this._self, this._then);

  final _Diagnostic _self;
  final $Res Function(_Diagnostic) _then;

/// Create a copy of Diagnostic
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = freezed,Object? message = freezed,}) {
  return _then(_Diagnostic(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
