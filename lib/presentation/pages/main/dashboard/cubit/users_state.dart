part of 'users_cubit.dart';

enum UsersStatus {
  loading,
  success,
  failure,
  empty;

  bool get isLoading => this == UsersStatus.loading;

  bool get isSuccess => this == UsersStatus.success;

  bool get isFailure => this == UsersStatus.failure;

  bool get isEmpty => this == UsersStatus.empty;
}

class UsersState extends Equatable {
  final UsersStatus status;
  final Users? users;
  final String? message;

  const UsersState({
    this.status = UsersStatus.loading,
    this.users,
    this.message,
  });

  UsersState copyWith({
    UsersStatus? status,
    Users? users,
    String? message,
  }) {
    return UsersState(
      status: status ?? this.status,
      users: users ?? this.users,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [status, users, message];
}
