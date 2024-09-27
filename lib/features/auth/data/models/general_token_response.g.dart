// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'general_token_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GeneralTokenResponseImpl _$$GeneralTokenResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GeneralTokenResponseImpl(
      diagnostic: json['diagnostic'] == null
          ? null
          : Diagnostic.fromJson(json['diagnostic'] as Map<String, dynamic>),
      data: json['data'] == null
          ? null
          : DataGeneralToken.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GeneralTokenResponseImplToJson(
        _$GeneralTokenResponseImpl instance) =>
    <String, dynamic>{
      'diagnostic': instance.diagnostic?.toJson(),
      'data': instance.data?.toJson(),
    };

_$DataGeneralTokenImpl _$$DataGeneralTokenImplFromJson(
        Map<String, dynamic> json) =>
    _$DataGeneralTokenImpl(
      token: json['token'] as String?,
      tokenType: json['tokenType'] as String?,
    );

Map<String, dynamic> _$$DataGeneralTokenImplToJson(
        _$DataGeneralTokenImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'tokenType': instance.tokenType,
    };
