import 'package:flutter/cupertino.dart';
import 'package:flutter_auth_app/features/features.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  AuthRepository,
  AuthRemoteDatasource,
  UsersRepository,
  UsersRemoteDatasource,
])
@GenerateNiceMocks([MockSpec<BuildContext>()])
void main() {}
