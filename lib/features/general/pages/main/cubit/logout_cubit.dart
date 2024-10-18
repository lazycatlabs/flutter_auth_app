import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/dependencies_injection.dart';
import 'package:flutter_auth_app/features/features.dart';
import 'package:flutter_auth_app/utils/services/hive/hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'logout_cubit.freezed.dart';
part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  final PostLogout _postLogout;

  LogoutCubit(this._postLogout) : super(const _Loading());

  Future<void> postLogout() async {
    emit(const _Loading());
    final data = await _postLogout.call(NoParams());
    data.fold(
      (l) => emit(_Failure((l as ServerFailure).message ?? "")),
      (r) async {
        await sl<MainBoxMixin>().logoutBox();
        emit(_Success(r));
      },
    );
  }
}
