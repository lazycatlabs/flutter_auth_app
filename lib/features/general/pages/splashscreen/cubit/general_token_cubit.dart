import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/features/features.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'general_token_cubit.freezed.dart';

class GeneralTokenCubit extends Cubit<GeneralTokenState> {
  GeneralTokenCubit(this._postGeneralToken) : super(const GeneralTokenStateLoading());

  final PostGeneralToken _postGeneralToken;

  Future<void> generalToken(GeneralTokenParams params) async {
    emit(const GeneralTokenStateLoading());
    final data = await _postGeneralToken.call(params);

    data.fold(
      (l) {
        if (l is ServerFailure) {
          emit(GeneralTokenStateFailure(l.message ?? ''));
        }
      },
      (r) => emit(GeneralTokenStateSuccess(r.token)),
    );
  }
}
@freezed
sealed class GeneralTokenState with _$GeneralTokenState {
  const factory GeneralTokenState.loading() = GeneralTokenStateLoading;

  const factory GeneralTokenState.success(String? data) = GeneralTokenStateSuccess;

  const factory GeneralTokenState.failure(String message) = GeneralTokenStateFailure;
}
