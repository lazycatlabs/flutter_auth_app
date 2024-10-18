import 'package:dartz/dartz.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/features/features.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_general_token.freezed.dart';
part 'post_general_token.g.dart';

class PostGeneralToken extends UseCase<GeneralToken, GeneralTokenParams> {
  final AuthRepository _repo;

  PostGeneralToken(this._repo);

  @override
  Future<Either<Failure, GeneralToken>> call(GeneralTokenParams params) =>
      _repo.generalToken(params);
}

@freezed
class GeneralTokenParams with _$GeneralTokenParams {
  const factory GeneralTokenParams({
    String? clientId,
    String? clientSecret,
  }) = _GeneralTokenParams;

  factory GeneralTokenParams.fromJson(Map<String, dynamic> json) =>
      _$GeneralTokenParamsFromJson(json);
}
