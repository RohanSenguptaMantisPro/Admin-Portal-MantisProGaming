import 'package:admin_portal_mantis_pro_gaming/src/authentication/domain/repo/auth_repo.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/domain/usecases/is_user_logged_in.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'auth_repo.mock.dart';

void main() {
  late AuthRepo authRepo;
  late IsUserLoggedIn isUserLoggedIn;

  setUp(() {
    authRepo = MockAuthRepo();
    isUserLoggedIn = IsUserLoggedIn(authRepo);
  });

  test(
    'should call the [AuthRepo.isUserLoggedIn]',
        () async {
      when(() => authRepo.isUserLoggedIn()).thenAnswer(
            (_) async => const Right(false),
      );

      final result = await isUserLoggedIn();

      expect(result, equals(const Right<dynamic, bool>(false)));

      verify(() => authRepo.isUserLoggedIn()).called(1);

      verifyNoMoreInteractions(authRepo);
    },
  );
}
