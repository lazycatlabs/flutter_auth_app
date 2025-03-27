// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'general_token_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GeneralTokenResponse _$GeneralTokenResponseFromJson(
        Map<String, dynamic> json) =>
    _GeneralTokenResponse(
      diagnostic: json['diagnostic'] == null
          ? null
          : Diagnostic.fromJson(json['diagnostic'] as Map<String, dynamic>),
      data: json['data'] == null
          ? null
          : DataGeneralToken.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GeneralTokenResponseToJson(
        _GeneralTokenResponse instance) =>
    <String, dynamic>{
      'diagnostic': instance.diagnostic?.toJson(),
      'data': instance.data?.toJson(),
    };

_DataGeneralToken _$DataGeneralTokenFromJson(Map<String, dynamic> json) =>
    _DataGeneralToken(
      token: json['token'] as String?,
      tokenType: json['tokenType'] as String?,
    );

Map<String, dynamic> _$DataGeneralTokenToJson(_DataGeneralToken instance) =>
    <String, dynamic>{
      'token': instance.token,
      'tokenType': instance.tokenType,
    };
