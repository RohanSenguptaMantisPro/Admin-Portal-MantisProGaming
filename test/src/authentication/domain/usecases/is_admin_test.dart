import 'package:admin_portal_mantis_pro_gaming/src/authentication/domain/repo/auth_repo.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/domain/usecases/is_admin.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'auth_repo.mock.dart';

void main() {
  late AuthRepo authRepo;
  late IsAdmin isAdmin;

  setUp(() {
    authRepo = MockAuthRepo();
    isAdmin = IsAdmin(authRepo);
  });
  const tUserToken = 'test user token';

  test(
    'should call the [AuthRepo.isAdmin]',
    () async {
      when(() => authRepo.isAdmin(any())).thenAnswer(
        (_) async => const Right(true),
      );

      final result = await isAdmin(tUserToken);

      expect(result, equals(const Right<dynamic, bool>(true)));

      verify(() => authRepo.isAdmin(tUserToken)).called(1);

      verifyNoMoreInteractions(authRepo);
    },
  );
}
