import 'package:equatable/equatable.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/data/data.dart';
import 'package:flutter_auth_app/di/di.dart';
import 'package:flutter_auth_app/domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._postLogin) : super(const AuthState());

  final PostLogin _postLogin;

  Future<void> login(LoginParams params) async {
    emit(state.copyWith(status: AuthStatus.loading));
    final data = await _postLogin.call(params);

    data.fold(
      (l) {
        if (l is ServerFailure) {
          emit(state.copyWith(status: AuthStatus.failure, message: l.message));
        }
      },
      (r) {
        /// Set isAuth true
        sl<PrefManager>().isLogin = true;
        sl<PrefManager>().token = r.token;
        emit(state.copyWith(status: AuthStatus.success, login: r));
      },
    );
  }

  Future<void> logout() async {
    emit(state.copyWith(status: AuthStatus.loading));
    sl<PrefManager>().logout();
    emit(state.copyWith(status: AuthStatus.success));
  }
}
