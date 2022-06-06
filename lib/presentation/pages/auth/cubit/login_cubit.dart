import 'package:equatable/equatable.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/data/data.dart';
import 'package:flutter_auth_app/di/di.dart';
import 'package:flutter_auth_app/domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._postLogin) : super(const LoginState());

  final PostLogin _postLogin;

  Future<void> login(LoginParams params) async {
    emit(state.copyWith(status: LoginStatus.loading));
    final _data = await _postLogin.call(params);

    _data.fold(
      (l) {
        if (l is ServerFailure) {
          emit(state.copyWith(status: LoginStatus.failure, message: l.message));
        }
      },
      (r) {
        /// Set isLogin true
        sl<PrefManager>().isLogin = true;
        sl<PrefManager>().token = r.token;
        emit(state.copyWith(status: LoginStatus.success, login: r));
      },
    );
  }
}
