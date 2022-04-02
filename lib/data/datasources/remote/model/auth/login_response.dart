import 'package:equatable/equatable.dart';
import 'package:flutter_auth_app/domain/domain.dart';

class LoginResponse extends Equatable {
  final int? id;
  final String? token;
  final String? error;

  const LoginResponse({this.id, this.token, this.error});

  LoginResponse.fromJson(dynamic json)
      : id = json['id'] as int?,
        token = json['token'] as String?,
        error = json['error'] as String?;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['token'] = token;
    map['error'] = error;

    return map;
  }

  Login toEntity() => Login(token);

  @override
  List<Object?> get props => [
        id,
        token,
        error,
      ];
}
