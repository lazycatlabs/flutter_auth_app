// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UsersResponseImpl _$$UsersResponseImplFromJson(Map<String, dynamic> json) =>
    _$UsersResponseImpl(
      page: (json['page'] as num?)?.toInt(),
      perPage: (json['per_page'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toInt(),
      totalPages: (json['total_pages'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DataUser.fromJson(e as Map<String, dynamic>))
          .toList(),
      support: json['support'] == null
          ? null
          : SupportUser.fromJson(json['support'] as Map<String, dynamic>),
      error: json['error'] as String?,
    );

Map<String, dynamic> _$$UsersResponseImplToJson(_$UsersResponseImpl instance) =>
    <String, dynamic>{
      'page': instance.page,
      'per_page': instance.perPage,
      'total': instance.total,
      'total_pages': instance.totalPages,
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'support': instance.support?.toJson(),
      'error': instance.error,
    };

_$SupportUserImpl _$$SupportUserImplFromJson(Map<String, dynamic> json) =>
    _$SupportUserImpl(
      url: json['url'] as String?,
      text: json['text'] as String?,
    );

Map<String, dynamic> _$$SupportUserImplToJson(_$SupportUserImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'text': instance.text,
    };

_$DataUserImpl _$$DataUserImplFromJson(Map<String, dynamic> json) =>
    _$DataUserImpl(
      id: (json['id'] as num?)?.toInt(),
      email: json['email'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      avatar: json['avatar'] as String?,
    );

Map<String, dynamic> _$$DataUserImplToJson(_$DataUserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'avatar': instance.avatar,
    };
