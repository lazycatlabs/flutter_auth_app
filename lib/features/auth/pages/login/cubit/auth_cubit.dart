import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/features/features.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._postLogin) : super(const AuthStateLoading());

  final PostLogin _postLogin;

  Future<void> login(LoginParams params) async {
    emit(const AuthStateLoading());
    final data = await _postLogin.call(params);

    data.fold(
      (l) {
        if (l is ServerFailure) {
          emit(AuthStateFailure(l.message ?? ''));
        }
      },
      (r) => emit(AuthStateSuccess(r.token)),
    );
  }
}
@freezed
sealed class AuthState with _$AuthState {
  const factory AuthState.loading() = AuthStateLoading;
  const factory AuthState.success(String? data) = AuthStateSuccess;
  const factory AuthState.failure(String message) = AuthStateFailure;
  const factory AuthState.showHide() = AuthStateShowHide;
  const factory AuthState.init() = AuthStateInit;
}
