import 'package:admin_portal_mantis_pro_gaming/src/authentication/domain/repo/auth_repo.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/domain/usecases/log_out.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'auth_repo.mock.dart';

void main() {
  late AuthRepo authRepo;
  late LogOut logOut;

  setUp(() {
    authRepo = MockAuthRepo();
    logOut = LogOut(authRepo);
  });

  test('should call the [AuthRepo.logOut]', () async {
    when(() => authRepo.logOut()).thenAnswer(
      (_) async => const Right(null),
    );

    final result = await logOut();

    expect(result, equals(const Right<dynamic, void>(null)));

    verify(() => authRepo.logOut()).called(1);

    verifyNoMoreInteractions(authRepo);
  });
}
