// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RegisterResponse {

@JsonKey(name: "diagnostic") Diagnostic? get diagnostic;@JsonKey(name: "data") DataRegister? get data;
/// Create a copy of RegisterResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterResponseCopyWith<RegisterResponse> get copyWith => _$RegisterResponseCopyWithImpl<RegisterResponse>(this as RegisterResponse, _$identity);

  /// Serializes this RegisterResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterResponse&&(identical(other.diagnostic, diagnostic) || other.diagnostic == diagnostic)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,diagnostic,data);

@override
String toString() {
  return 'RegisterResponse(diagnostic: $diagnostic, data: $data)';
}


}

/// @nodoc
abstract mixin class $RegisterResponseCopyWith<$Res>  {
  factory $RegisterResponseCopyWith(RegisterResponse value, $Res Function(RegisterResponse) _then) = _$RegisterResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "diagnostic") Diagnostic? diagnostic,@JsonKey(name: "data") DataRegister? data
});


$DiagnosticCopyWith<$Res>? get diagnostic;$DataRegisterCopyWith<$Res>? get data;

}
/// @nodoc
class _$RegisterResponseCopyWithImpl<$Res>
    implements $RegisterResponseCopyWith<$Res> {
  _$RegisterResponseCopyWithImpl(this._self, this._then);

  final RegisterResponse _self;
  final $Res Function(RegisterResponse) _then;

/// Create a copy of RegisterResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? diagnostic = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
diagnostic: freezed == diagnostic ? _self.diagnostic : diagnostic // ignore: cast_nullable_to_non_nullable
as Diagnostic?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as DataRegister?,
  ));
}
/// Create a copy of RegisterResponse
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
}/// Create a copy of RegisterResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DataRegisterCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $DataRegisterCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [RegisterResponse].
extension RegisterResponsePatterns on RegisterResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RegisterResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RegisterResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RegisterResponse value)  $default,){
final _that = this;
switch (_that) {
case _RegisterResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RegisterResponse value)?  $default,){
final _that = this;
switch (_that) {
case _RegisterResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "diagnostic")  Diagnostic? diagnostic, @JsonKey(name: "data")  DataRegister? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegisterResponse() when $default != null:
return $default(_that.diagnostic,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "diagnostic")  Diagnostic? diagnostic, @JsonKey(name: "data")  DataRegister? data)  $default,) {final _that = this;
switch (_that) {
case _RegisterResponse():
return $default(_that.diagnostic,_that.data);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "diagnostic")  Diagnostic? diagnostic, @JsonKey(name: "data")  DataRegister? data)?  $default,) {final _that = this;
switch (_that) {
case _RegisterResponse() when $default != null:
return $default(_that.diagnostic,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RegisterResponse extends RegisterResponse {
  const _RegisterResponse({@JsonKey(name: "diagnostic") this.diagnostic, @JsonKey(name: "data") this.data}): super._();
  factory _RegisterResponse.fromJson(Map<String, dynamic> json) => _$RegisterResponseFromJson(json);

@override@JsonKey(name: "diagnostic") final  Diagnostic? diagnostic;
@override@JsonKey(name: "data") final  DataRegister? data;

/// Create a copy of RegisterResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterResponseCopyWith<_RegisterResponse> get copyWith => __$RegisterResponseCopyWithImpl<_RegisterResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RegisterResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterResponse&&(identical(other.diagnostic, diagnostic) || other.diagnostic == diagnostic)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,diagnostic,data);

@override
String toString() {
  return 'RegisterResponse(diagnostic: $diagnostic, data: $data)';
}


}

/// @nodoc
abstract mixin class _$RegisterResponseCopyWith<$Res> implements $RegisterResponseCopyWith<$Res> {
  factory _$RegisterResponseCopyWith(_RegisterResponse value, $Res Function(_RegisterResponse) _then) = __$RegisterResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "diagnostic") Diagnostic? diagnostic,@JsonKey(name: "data") DataRegister? data
});


@override $DiagnosticCopyWith<$Res>? get diagnostic;@override $DataRegisterCopyWith<$Res>? get data;

}
/// @nodoc
class __$RegisterResponseCopyWithImpl<$Res>
    implements _$RegisterResponseCopyWith<$Res> {
  __$RegisterResponseCopyWithImpl(this._self, this._then);

  final _RegisterResponse _self;
  final $Res Function(_RegisterResponse) _then;

/// Create a copy of RegisterResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? diagnostic = freezed,Object? data = freezed,}) {
  return _then(_RegisterResponse(
diagnostic: freezed == diagnostic ? _self.diagnostic : diagnostic // ignore: cast_nullable_to_non_nullable
as Diagnostic?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as DataRegister?,
  ));
}

/// Create a copy of RegisterResponse
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
}/// Create a copy of RegisterResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DataRegisterCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $DataRegisterCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$DataRegister {

@JsonKey(name: "id") String? get id;@JsonKey(name: "name") String? get name;@JsonKey(name: "email") String? get email;@JsonKey(name: "photo") String? get photo;@JsonKey(name: "verified") bool? get verified;@JsonKey(name: "createdAt") String? get createdAt;@JsonKey(name: "updatedAt") String? get updatedAt;
/// Create a copy of DataRegister
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DataRegisterCopyWith<DataRegister> get copyWith => _$DataRegisterCopyWithImpl<DataRegister>(this as DataRegister, _$identity);

  /// Serializes this DataRegister to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DataRegister&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.photo, photo) || other.photo == photo)&&(identical(other.verified, verified) || other.verified == verified)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,email,photo,verified,createdAt,updatedAt);

@override
String toString() {
  return 'DataRegister(id: $id, name: $name, email: $email, photo: $photo, verified: $verified, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $DataRegisterCopyWith<$Res>  {
  factory $DataRegisterCopyWith(DataRegister value, $Res Function(DataRegister) _then) = _$DataRegisterCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") String? id,@JsonKey(name: "name") String? name,@JsonKey(name: "email") String? email,@JsonKey(name: "photo") String? photo,@JsonKey(name: "verified") bool? verified,@JsonKey(name: "createdAt") String? createdAt,@JsonKey(name: "updatedAt") String? updatedAt
});




}
/// @nodoc
class _$DataRegisterCopyWithImpl<$Res>
    implements $DataRegisterCopyWith<$Res> {
  _$DataRegisterCopyWithImpl(this._self, this._then);

  final DataRegister _self;
  final $Res Function(DataRegister) _then;

/// Create a copy of DataRegister
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? email = freezed,Object? photo = freezed,Object? verified = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,photo: freezed == photo ? _self.photo : photo // ignore: cast_nullable_to_non_nullable
as String?,verified: freezed == verified ? _self.verified : verified // ignore: cast_nullable_to_non_nullable
as bool?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DataRegister].
extension DataRegisterPatterns on DataRegister {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DataRegister value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DataRegister() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DataRegister value)  $default,){
final _that = this;
switch (_that) {
case _DataRegister():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DataRegister value)?  $default,){
final _that = this;
switch (_that) {
case _DataRegister() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  String? id, @JsonKey(name: "name")  String? name, @JsonKey(name: "email")  String? email, @JsonKey(name: "photo")  String? photo, @JsonKey(name: "verified")  bool? verified, @JsonKey(name: "createdAt")  String? createdAt, @JsonKey(name: "updatedAt")  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DataRegister() when $default != null:
return $default(_that.id,_that.name,_that.email,_that.photo,_that.verified,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  String? id, @JsonKey(name: "name")  String? name, @JsonKey(name: "email")  String? email, @JsonKey(name: "photo")  String? photo, @JsonKey(name: "verified")  bool? verified, @JsonKey(name: "createdAt")  String? createdAt, @JsonKey(name: "updatedAt")  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _DataRegister():
return $default(_that.id,_that.name,_that.email,_that.photo,_that.verified,_that.createdAt,_that.updatedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  String? id, @JsonKey(name: "name")  String? name, @JsonKey(name: "email")  String? email, @JsonKey(name: "photo")  String? photo, @JsonKey(name: "verified")  bool? verified, @JsonKey(name: "createdAt")  String? createdAt, @JsonKey(name: "updatedAt")  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _DataRegister() when $default != null:
return $default(_that.id,_that.name,_that.email,_that.photo,_that.verified,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DataRegister implements DataRegister {
  const _DataRegister({@JsonKey(name: "id") this.id, @JsonKey(name: "name") this.name, @JsonKey(name: "email") this.email, @JsonKey(name: "photo") this.photo, @JsonKey(name: "verified") this.verified, @JsonKey(name: "createdAt") this.createdAt, @JsonKey(name: "updatedAt") this.updatedAt});
  factory _DataRegister.fromJson(Map<String, dynamic> json) => _$DataRegisterFromJson(json);

@override@JsonKey(name: "id") final  String? id;
@override@JsonKey(name: "name") final  String? name;
@override@JsonKey(name: "email") final  String? email;
@override@JsonKey(name: "photo") final  String? photo;
@override@JsonKey(name: "verified") final  bool? verified;
@override@JsonKey(name: "createdAt") final  String? createdAt;
@override@JsonKey(name: "updatedAt") final  String? updatedAt;

/// Create a copy of DataRegister
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DataRegisterCopyWith<_DataRegister> get copyWith => __$DataRegisterCopyWithImpl<_DataRegister>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DataRegisterToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DataRegister&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.photo, photo) || other.photo == photo)&&(identical(other.verified, verified) || other.verified == verified)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,email,photo,verified,createdAt,updatedAt);

@override
String toString() {
  return 'DataRegister(id: $id, name: $name, email: $email, photo: $photo, verified: $verified, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$DataRegisterCopyWith<$Res> implements $DataRegisterCopyWith<$Res> {
  factory _$DataRegisterCopyWith(_DataRegister value, $Res Function(_DataRegister) _then) = __$DataRegisterCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") String? id,@JsonKey(name: "name") String? name,@JsonKey(name: "email") String? email,@JsonKey(name: "photo") String? photo,@JsonKey(name: "verified") bool? verified,@JsonKey(name: "createdAt") String? createdAt,@JsonKey(name: "updatedAt") String? updatedAt
});




}
/// @nodoc
class __$DataRegisterCopyWithImpl<$Res>
    implements _$DataRegisterCopyWith<$Res> {
  __$DataRegisterCopyWithImpl(this._self, this._then);

  final _DataRegister _self;
  final $Res Function(_DataRegister) _then;

/// Create a copy of DataRegister
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? email = freezed,Object? photo = freezed,Object? verified = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_DataRegister(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,photo: freezed == photo ? _self.photo : photo // ignore: cast_nullable_to_non_nullable
as String?,verified: freezed == verified ? _self.verified : verified // ignore: cast_nullable_to_non_nullable
as bool?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
