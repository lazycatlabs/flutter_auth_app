import 'package:dartz/dartz.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/features/features.dart';
import 'package:flutter_auth_app/utils/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_login.freezed.dart';
part 'post_login.g.dart';

class PostLogin extends UseCase<Login, LoginParams> with MainBoxMixin {
  final AuthRepository _repo;

  PostLogin(this._repo);

  @override
  Future<Either<Failure, Login>> call(LoginParams params) async {
    final result = await _repo.login(params);
    return result.fold((failure) => Left(failure), (login) {
      addData(MainBoxKeys.isLogin, true);
      addData(MainBoxKeys.authToken, login.token);
      addData(MainBoxKeys.refreshToken, login.refreshToken);
      return Right(login);
    });
  }
}

@freezed
sealed class LoginParams with _$LoginParams {
  const factory LoginParams({
    @Default('') String email,
    @Default('') String password,
    String? osInfo,
    String? deviceInfo,
    @Default('GeneratedFCMToken') String fcmToken,
    @Default('email') String loginType,
  }) = _LoginParams;

  factory LoginParams.fromJson(Map<String, dynamic> json) =>
      _$LoginParamsFromJson(json);
}
