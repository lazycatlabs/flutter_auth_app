import 'package:equatable/equatable.dart';

class Users extends Equatable {
  final List<User> users;
  final int currentPage;
  final int lastPage;

  const Users(this.users, this.currentPage, this.lastPage);

  @override
  List<Object?> get props => [users];
}

class User extends Equatable {
  final String? name;
  final String? avatar;
  final String? email;

  const User({
    this.name,
    this.avatar,
    this.email,
  });

  @override
  List<Object?> get props => [name, avatar, email];
}
