// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diagnostic_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DiagnosticResponse _$DiagnosticResponseFromJson(Map<String, dynamic> json) =>
    _DiagnosticResponse(
      diagnostic: json['diagnostic'] == null
          ? null
          : Diagnostic.fromJson(json['diagnostic'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DiagnosticResponseToJson(_DiagnosticResponse instance) =>
    <String, dynamic>{
      'diagnostic': instance.diagnostic?.toJson(),
    };
