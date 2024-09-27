import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/features/features.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'general_token_cubit.freezed.dart';

class GeneralTokenCubit extends Cubit<GeneralTokenState> {
  GeneralTokenCubit(this._postGeneralToken) : super(const _Loading());

  final PostGeneralToken _postGeneralToken;

  Future<void> generalToken(GeneralTokenParams params) async {
    emit(const _Loading());
    final data = await _postGeneralToken.call(params);

    data.fold(
      (l) {
        if (l is ServerFailure) {
          emit(_Failure(l.message ?? ""));
        }
      },
      (r) => emit(_Success(r.token)),
    );
  }
}

@freezed
class GeneralTokenState with _$GeneralTokenState {
  const factory GeneralTokenState.loading() = _Loading;

  const factory GeneralTokenState.success(String? data) = _Success;

  const factory GeneralTokenState.failure(String message) = _Failure;
}
