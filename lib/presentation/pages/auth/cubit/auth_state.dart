part of 'auth_cubit.dart';

enum AuthStatus {
  loading,
  success,
  failure;

  bool get isLoading => this == AuthStatus.loading;

  bool get isSuccess => this == AuthStatus.success;

  bool get isFailure => this == AuthStatus.failure;
}

class AuthState extends Equatable {
  final AuthStatus status;
  final Login? login;
  final String? message;

  const AuthState({
    this.status = AuthStatus.loading,
    this.login,
    this.message,
  });

  AuthState copyWith({
    AuthStatus? status,
    Login? login,
    String? message,
  }) {
    return AuthState(
      status: status ?? this.status,
      login: login ?? this.login,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [status, login, message];
}
