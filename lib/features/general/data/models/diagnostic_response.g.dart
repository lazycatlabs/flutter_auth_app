// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diagnostic_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DiagnosticResponseImpl _$$DiagnosticResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$DiagnosticResponseImpl(
      diagnostic: json['diagnostic'] == null
          ? null
          : Diagnostic.fromJson(json['diagnostic'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DiagnosticResponseImplToJson(
        _$DiagnosticResponseImpl instance) =>
    <String, dynamic>{
      'diagnostic': instance.diagnostic?.toJson(),
    };
