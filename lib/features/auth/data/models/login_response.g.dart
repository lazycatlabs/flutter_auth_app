// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginResponseImpl _$$LoginResponseImplFromJson(Map<String, dynamic> json) =>
    _$LoginResponseImpl(
      diagnostic: json['diagnostic'] == null
          ? null
          : Diagnostic.fromJson(json['diagnostic'] as Map<String, dynamic>),
      data: json['data'] == null
          ? null
          : DataLogin.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LoginResponseImplToJson(_$LoginResponseImpl instance) =>
    <String, dynamic>{
      'diagnostic': instance.diagnostic?.toJson(),
      'data': instance.data?.toJson(),
    };

_$DataLoginImpl _$$DataLoginImplFromJson(Map<String, dynamic> json) =>
    _$DataLoginImpl(
      token: json['token'] as String?,
      tokenType: json['tokenType'] as String?,
    );

Map<String, dynamic> _$$DataLoginImplToJson(_$DataLoginImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'tokenType': instance.tokenType,
    };
