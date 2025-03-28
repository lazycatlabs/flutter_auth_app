// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RegisterResponse _$RegisterResponseFromJson(Map<String, dynamic> json) =>
    _RegisterResponse(
      diagnostic: json['diagnostic'] == null
          ? null
          : Diagnostic.fromJson(json['diagnostic'] as Map<String, dynamic>),
      data: json['data'] == null
          ? null
          : DataRegister.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RegisterResponseToJson(_RegisterResponse instance) =>
    <String, dynamic>{
      'diagnostic': instance.diagnostic?.toJson(),
      'data': instance.data?.toJson(),
    };

_DataRegister _$DataRegisterFromJson(Map<String, dynamic> json) =>
    _DataRegister(
      id: json['id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      photo: json['photo'] as String?,
      verified: json['verified'] as bool?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$DataRegisterToJson(_DataRegister instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'photo': instance.photo,
      'verified': instance.verified,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
