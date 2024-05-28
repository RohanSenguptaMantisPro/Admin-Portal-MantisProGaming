import 'package:admin_portal_mantis_pro_gaming/src/authentication/domain/repo/auth_repo.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/domain/usecases/log_in_with_google.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'auth_repo.mock.dart';

void main() {
  late AuthRepo authRepo;
  late LogInWithGoogle logInWithGoogle;

  setUp(() {
    authRepo = MockAuthRepo();
    logInWithGoogle = LogInWithGoogle(authRepo);
  });

  test(
    'should call the [AuthRepo.logInWithGoogle]',
    () async {
      when(() => authRepo.logInWithGoogle()).thenAnswer(
        (_) async => const Right(null),
      );

      final result = await logInWithGoogle();

      expect(result, equals(const Right<dynamic, void>(null)));

      verify(() => authRepo.logInWithGoogle()).called(1);

      verifyNoMoreInteractions(authRepo);
    },
  );
}
