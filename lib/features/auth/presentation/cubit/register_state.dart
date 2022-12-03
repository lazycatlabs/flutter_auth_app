part of 'register_cubit.dart';

enum RegisterStatus {
  loading,
  success,
  failure;

  bool get isLoading => this == RegisterStatus.loading;

  bool get isSuccess => this == RegisterStatus.success;

  bool get isFailure => this == RegisterStatus.failure;
}

class RegisterState extends Equatable {
  final RegisterStatus status;
  final Register? register;
  final String? message;

  const RegisterState({
    this.status = RegisterStatus.loading,
    this.register,
    this.message,
  });

  RegisterState copyWith({
    RegisterStatus? status,
    Register? register,
    String? message,
  }) {
    return RegisterState(
      status: status ?? this.status,
      register: register ?? this.register,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [status, register, message];
}
