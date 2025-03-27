// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    _LoginResponse(
      diagnostic: json['diagnostic'] == null
          ? null
          : Diagnostic.fromJson(json['diagnostic'] as Map<String, dynamic>),
      data: json['data'] == null
          ? null
          : DataLogin.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseToJson(_LoginResponse instance) =>
    <String, dynamic>{
      'diagnostic': instance.diagnostic?.toJson(),
      'data': instance.data?.toJson(),
    };

_DataLogin _$DataLoginFromJson(Map<String, dynamic> json) => _DataLogin(
      token: json['token'] as String?,
      tokenType: json['tokenType'] as String?,
    );

Map<String, dynamic> _$DataLoginToJson(_DataLogin instance) =>
    <String, dynamic>{
      'token': instance.token,
      'tokenType': instance.tokenType,
    };
