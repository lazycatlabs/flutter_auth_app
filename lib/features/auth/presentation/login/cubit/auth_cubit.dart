import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/dependencies_injection.dart';
import 'package:flutter_auth_app/features/features.dart';
import 'package:flutter_auth_app/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._postLogin) : super(const _Loading());

  final PostLogin _postLogin;

  Future<void> login(LoginParams params) async {
    emit(const _Loading());
    final data = await _postLogin.call(params);

    data.fold(
      (l) {
        if (l is ServerFailure) {
          emit(_Failure(l.message ?? ""));
        }
      },
      (r) {
        /// Set isAuth true
        sl<PrefManager>().isLogin = true;
        sl<PrefManager>().token = r.token;
        emit(_Success(r.token));
      },
    );
  }

  Future<void> logout() async {
    emit(const _Loading());
    sl<PrefManager>().logout();
    emit(const _Success(null));
  }
}
