import 'package:flutter_auth_app/features/features.dart';

Login buildLoginFixture(LoginResponse response) => Login(
  token: '${response.data?.tokenType} ${response.data?.token}',
  refreshToken: '${response.data?.tokenType} ${response.data?.refreshToken}',
);

GeneralToken buildGeneralTokenFixture(GeneralTokenResponse response) =>
    GeneralToken(token: '${response.data?.tokenType} ${response.data?.token}');

Register buildRegisterFixture(RegisterResponse response) =>
    Register(message: response.diagnostic?.message ?? '');

Users buildUsersFixture(UsersResponse response) => Users(
  users: response.data
      ?.map(
        (data) => User(
          name: data.name,
          email: data.email,
          avatar: data.photo,
          isVerified: data.verified,
          updatedAt: data.updatedAt,
        ),
      )
      .toList(),
  currentPage: response.page?.currentPage,
  lastPage: response.page?.lastPage,
);

User buildUserFixture(UserResponse response) => User(
  name: response.data?.name,
  email: response.data?.email,
  avatar: response.data?.photo,
  isVerified: response.data?.verified,
  updatedAt: response.data?.updatedAt,
);
