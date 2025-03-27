import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/dependencies_injection.dart';
import 'package:flutter_auth_app/features/features.dart';
import 'package:flutter_auth_app/utils/services/hive/hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'logout_cubit.freezed.dart';

class LogoutCubit extends Cubit<LogoutState> {
  final PostLogout _postLogout;

  LogoutCubit(this._postLogout) : super(const LogoutStateLoading());

  Future<void> postLogout() async {
    emit(const LogoutStateLoading());
    final data = await _postLogout.call(NoParams());
    data.fold(
      (l) => emit(LogoutStateFailure((l as ServerFailure).message ?? "")),
      (r) async {
        await sl<MainBoxMixin>().logoutBox();
        emit(LogoutStateSuccess(r));
      },
    );
  }
}
@freezed
abstract class LogoutState with _$LogoutState {
  const factory LogoutState.loading() = LogoutStateLoading;
  const factory LogoutState.failure(String message) = LogoutStateFailure;
  const factory LogoutState.success(String message) = LogoutStateSuccess;
}
