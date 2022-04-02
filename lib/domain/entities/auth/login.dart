import 'package:equatable/equatable.dart';

class Login extends Equatable {
  final String? token;

  const Login(this.token);

  @override
  List<Object?> get props => [token];
}
