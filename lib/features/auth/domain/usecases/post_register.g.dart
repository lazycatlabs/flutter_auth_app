// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_register.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RegisterParams _$RegisterParamsFromJson(Map<String, dynamic> json) =>
    _RegisterParams(
      name: json['name'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$RegisterParamsToJson(_RegisterParams instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
    };
