import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/features/features.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_cubit.freezed.dart';
part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final GetUser _getUser;

  UserCubit(this._getUser) : super(const _Loading());

  Future<void> getUser() async {
    emit(const _Loading());
    final data = await _getUser.call(NoParams());
    data.fold(
      (l) => emit(_Failure((l as ServerFailure).message ?? "")),
      (r) => emit(_Success(r)),
    );
  }
}
