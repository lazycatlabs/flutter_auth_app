import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/features/features.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._postLogin) : super(const LoginStateLoading());

  final PostLogin _postLogin;

  Future<void> login(LoginParams params) async {
    emit(const LoginStateLoading());
    final data = await _postLogin.call(params);

    data.fold(
      (l) => emit(LoginStateFailure(l is ServerFailure ? l.message ?? '' : '')),
      (r) => emit(LoginStateSuccess(r.token)),
    );
  }
}

@freezed
sealed class LoginState with _$LoginState {
  const factory LoginState.loading() = LoginStateLoading;
  const factory LoginState.success(String? data) = LoginStateSuccess;
  const factory LoginState.failure(String message) = LoginStateFailure;
}
