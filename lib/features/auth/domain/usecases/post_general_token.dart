import 'package:dartz/dartz.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/features/features.dart';
import 'package:flutter_auth_app/utils/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_general_token.freezed.dart';
part 'post_general_token.g.dart';

class PostGeneralToken extends UseCase<GeneralToken, GeneralTokenParams>
    with MainBoxMixin {
  final AuthRepository _repo;

  PostGeneralToken(this._repo);

  @override
  Future<Either<Failure, GeneralToken>> call(GeneralTokenParams params) async {
    final result = await _repo.generalToken(params);
    return result.fold((failure) => Left(failure), (token) async {
      final storedClientId = getData<String?>(MainBoxKeys.apiClientId);
      if (storedClientId != params.clientId) {
        await removeData(MainBoxKeys.isLogin);
        await removeData(MainBoxKeys.authToken);
        await removeData(MainBoxKeys.refreshToken);
      }
      await addData(MainBoxKeys.apiClientId, params.clientId);
      await addData(MainBoxKeys.generalToken, token.token);
      return Right(token);
    });
  }
}

@freezed
sealed class GeneralTokenParams with _$GeneralTokenParams {
  const factory GeneralTokenParams({String? clientId, String? clientSecret}) =
      _GeneralTokenParams;

  factory GeneralTokenParams.fromJson(Map<String, dynamic> json) =>
      _$GeneralTokenParamsFromJson(json);
}
