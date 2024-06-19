import 'package:admin_portal_mantis_pro_gaming/src/authentication/domain/repo/auth_repo.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/domain/usecases/google_sign_in_service.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'auth_repo.mock.dart';

void main() {
  late AuthRepo authRepo;
  late GoogleSignInService googleSignInService;

  setUp(() {
    authRepo = MockAuthRepo();
    googleSignInService = GoogleSignInService(authRepo);
  });

  const tUserToken = 'idToken';

  test(
    'should call the [AuthRepo.googleSignin]',
        () async {
      when(() => authRepo.googleSignInService()).thenAnswer(
            (_) async => const Right(tUserToken),
      );

      final result = await googleSignInService();

      expect(result, equals(const Right<dynamic, String>(tUserToken)));

      verify(() => authRepo.googleSignInService()).called(1);

      verifyNoMoreInteractions(authRepo);
    },
  );
}
