import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/features/features.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'logout_cubit.freezed.dart';

class LogoutCubit extends Cubit<LogoutState> {
  final PostLogout _postLogout;

  LogoutCubit(this._postLogout) : super(const LogoutStateLoading());

  Future<void> postLogout() async {
    emit(const LogoutStateLoading());
    final data = await _postLogout.call(const NoParams());
    data.fold(
      (l) =>
          emit(LogoutStateFailure(l is ServerFailure ? l.message ?? '' : '')),
      (r) => emit(LogoutStateSuccess(r)),
    );
  }
}

@freezed
sealed class LogoutState with _$LogoutState {
  const factory LogoutState.loading() = LogoutStateLoading;
  const factory LogoutState.failure(String message) = LogoutStateFailure;
  const factory LogoutState.success(String message) = LogoutStateSuccess;
}
