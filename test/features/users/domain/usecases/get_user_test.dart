import 'package:either_dart/either.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/features/features.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../helpers/test_mock.mocks.dart';

void main() {
  late MockUsersRepository mockUsersRepository;
  late GetUser getUser;
  const user = User(name: 'Mudassir', email: 'mudassir@lazycatlabs.com');

  setUp(() {
    mockUsersRepository = MockUsersRepository();
    getUser = GetUser(mockUsersRepository);
  });

  test('should get the current user from the repository', () async {
    when(mockUsersRepository.user()).thenAnswer((_) async => const Right(user));

    final result = await getUser.call(const NoParams());

    expect(result, equals(const Right(user)));
    verify(mockUsersRepository.user());
  });
}
