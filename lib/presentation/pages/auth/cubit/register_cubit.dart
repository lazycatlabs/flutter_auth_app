import 'package:equatable/equatable.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final PostRegister _postRegister;

  RegisterCubit(this._postRegister) : super(const RegisterState());

  Future<void> register(RegisterParams params) async {
    emit(state.copyWith(status: RegisterStatus.loading));
    final data = await _postRegister.call(params);
    data.fold(
      (l) {
        if (l is ServerFailure) {
          emit(
            state.copyWith(status: RegisterStatus.failure, message: l.message),
          );
        }
      },
      (r) => emit(state.copyWith(status: RegisterStatus.success, register: r)),
    );
  }
}
