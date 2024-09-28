// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UsersResponseImpl _$$UsersResponseImplFromJson(Map<String, dynamic> json) =>
    _$UsersResponseImpl(
      diagnostic: json['diagnostic'] == null
          ? null
          : Diagnostic.fromJson(json['diagnostic'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DataUser.fromJson(e as Map<String, dynamic>))
          .toList(),
      page: json['page'] == null
          ? null
          : Page.fromJson(json['page'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UsersResponseImplToJson(_$UsersResponseImpl instance) =>
    <String, dynamic>{
      'diagnostic': instance.diagnostic?.toJson(),
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'page': instance.page?.toJson(),
    };

_$DataUserImpl _$$DataUserImplFromJson(Map<String, dynamic> json) =>
    _$DataUserImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      photo: json['photo'] as String?,
      verified: json['verified'] as bool?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$$DataUserImplToJson(_$DataUserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'photo': instance.photo,
      'verified': instance.verified,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
