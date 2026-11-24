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
  users: response.users
      ?.map(
        (data) => User(
          name: '${data.firstName ?? ''} ${data.lastName ?? ''}'.trim(),
          email: data.email,
          avatar: data.image,
        ),
      )
      .toList(),
  currentPage: (response.skip ?? 0) ~/ (response.limit ?? 20) + 1,
  lastPage: ((response.total ?? 0) / (response.limit ?? 20)).ceil(),
);

User buildUserFixture(UserResponse response) => User(
  name: response.data?.name,
  email: response.data?.email,
  avatar: response.data?.photo,
  isVerified: response.data?.verified,
  updatedAt: response.data?.updatedAt,
);
