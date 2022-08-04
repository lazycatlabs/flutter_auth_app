import 'package:equatable/equatable.dart';
import 'package:flutter_auth_app/domain/domain.dart';

class UsersResponse extends Equatable {
  const UsersResponse({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.data,
    this.support,
    this.error,
  });

  factory UsersResponse.fromJson(dynamic json) {
    final page = json['page'] as int?;
    final perPage = json['per_page'] as int?;
    final total = json['total'] as int?;
    final totalPages = json['total_pages'] as int?;
    final error = json['error'] as String?;
    final dataTemp = json['data'] as List<dynamic>?;
    final data = dataTemp != null
        ? dataTemp.map((v) => DataUser.fromJson(v)).toList()
        : <DataUser>[];
    final support =
        json['support'] != null ? SupportUser.fromJson(json['support']) : null;

    return UsersResponse(
      page: page,
      perPage: perPage,
      total: total,
      totalPages: totalPages,
      data: data,
      support: support,
      error: error,
    );
  }

  final int? page;
  final int? perPage;
  final int? total;
  final int? totalPages;
  final List<DataUser>? data;
  final SupportUser? support;
  final String? error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    map['per_page'] = perPage;
    map['total'] = total;
    map['total_pages'] = totalPages;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    if (support != null) {
      map['support'] = support?.toJson();
    }
    map['error'] = error;

    return map;
  }

  Users toEntity() {
    final listUser = data!
        .map<User>(
          (model) => User(
            name: "${model.firstName} ${model.lastName}",
            avatar: model.avatar ?? "",
            email: model.email ?? "",
          ),
        )
        .toList();

    return Users(listUser, page ?? 1, totalPages ?? 1);
  }

  @override
  List<Object?> get props => [
        page,
        perPage,
        total,
        totalPages,
        data,
        support,
        error,
      ];
}

class SupportUser extends Equatable {
  const SupportUser({
    this.url,
    this.text,
  });

  SupportUser.fromJson(dynamic json)
      : url = json['url'] as String?,
        text = json['text'] as String?;

  final String? url;
  final String? text;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = url;
    map['text'] = text;

    return map;
  }

  @override
  List<Object?> get props => [
        url,
        text,
      ];
}

class DataUser extends Equatable {
  const DataUser({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  DataUser.fromJson(dynamic json)
      : id = json['id'] as int?,
        email = json['email'] as String?,
        firstName = json['first_name'] as String?,
        lastName = json['last_name'] as String?,
        avatar = json['avatar'] as String?;

  final int? id;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? avatar;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['email'] = email;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['avatar'] = avatar;

    return map;
  }

  @override
  List<Object?> get props => [
        id,
        email,
        firstName,
        lastName,
        avatar,
      ];
}
