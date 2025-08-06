import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/features/features.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_cubit.freezed.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final PostRegister _postRegister;

  RegisterCubit(this._postRegister) : super(const RegisterStateLoading());

  Future<void> register(RegisterParams params) async {
    emit(const RegisterStateLoading());
    final data = await _postRegister.call(params);
    data.fold(
      (l) {
        if (l is ServerFailure) {
          emit(RegisterStateFailure(l.message ?? ''));
        }
      },
      (r) => emit(RegisterStateSuccess(r)),
    );
  }
}
@freezed
sealed class RegisterState with _$RegisterState {
  const factory RegisterState.loading() = RegisterStateLoading;
  const factory RegisterState.success(Register? data) = RegisterStateSuccess;
  const factory RegisterState.failure(String message) = RegisterStateFailure;
  const factory RegisterState.init() = RegisterStateInit;
  const factory RegisterState.showHidePassword() = RegisterStateShowHidePassword;
}
