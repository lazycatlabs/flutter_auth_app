// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Page _$PageFromJson(Map<String, dynamic> json) => _Page(
  currentPage: (json['currentPage'] as num?)?.toInt(),
  perPage: (json['perPage'] as num?)?.toInt(),
  lastPage: (json['lastPage'] as num?)?.toInt(),
  total: (json['total'] as num?)?.toInt(),
);

Map<String, dynamic> _$PageToJson(_Page instance) => <String, dynamic>{
  'currentPage': instance.currentPage,
  'perPage': instance.perPage,
  'lastPage': instance.lastPage,
  'total': instance.total,
};
