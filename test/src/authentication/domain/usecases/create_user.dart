import 'package:admin_portal_mantis_pro_gaming/src/authentication/domain/repo/auth_repo.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/domain/usecases/create_user.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'auth_repo.mock.dart';

void main() {
  late AuthRepo authRepo;
  late CreateUser createUser;

  setUp(() {
    authRepo = MockAuthRepo();
    createUser = CreateUser(authRepo);
  });

  const tUserToken = 'test user token';

  test(
    'should call the [AuthRepo.createUser]',
    () async {
      when(() => authRepo.createUser()).thenAnswer(
        (_) async => const Right(tUserToken),
      );

      final result = await createUser();

      expect(result, equals(const Right<dynamic, String>(tUserToken)));

      verify(() => authRepo.createUser()).called(1);

      verifyNoMoreInteractions(authRepo);
    },
  );
}
