import 'package:admin_portal_mantis_pro_gaming/src/authentication/domain/entities/admin_details.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/domain/repo/auth_repo.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/domain/usecases/fetch_user_data.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'auth_repo.mock.dart';

void main() {
  late AuthRepo authRepo;
  late FetchUserData fetchUserData;

  setUp(() {
    authRepo = MockAuthRepo();
    fetchUserData = FetchUserData(authRepo);
  });

  const String tUserToken = 'test user token';
  const AdminDetails tAdminDetails = AdminDetails.empty();

  test('should call the [AuthRepo.fetchUserData]', () async {
    when(() => authRepo.fetchUserData(tUserToken)).thenAnswer(
      (_) async => const Right(tAdminDetails),
    );

    final result = await fetchUserData(tUserToken);

    expect(result, equals(const Right<dynamic, AdminDetails>(tAdminDetails)));


    verify(() => authRepo.fetchUserData(tUserToken)).called(1);

    verifyNoMoreInteractions(authRepo);
  });
}
