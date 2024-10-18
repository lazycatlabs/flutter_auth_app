// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginParamsImpl _$$LoginParamsImplFromJson(Map<String, dynamic> json) =>
    _$LoginParamsImpl(
      email: json['email'] as String? ?? "",
      password: json['password'] as String? ?? "",
      osInfo: json['osInfo'] as String?,
      deviceInfo: json['deviceInfo'] as String?,
      fcmToken: json['fcmToken'] as String? ?? "GeneratedFCMToken",
    );

Map<String, dynamic> _$$LoginParamsImplToJson(_$LoginParamsImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'osInfo': instance.osInfo,
      'deviceInfo': instance.deviceInfo,
      'fcmToken': instance.fcmToken,
    };
