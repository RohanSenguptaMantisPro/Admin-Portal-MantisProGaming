import 'package:admin_portal_mantis_pro_gaming/core/usecases/usecases.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/typedefs.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/domain/entities/admin_details.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/domain/repo/auth_repo.dart';

class FetchUserData extends UsecaseWithParams<AdminDetails, String> {
  const FetchUserData(this._repo);

  final AuthRepo _repo;

  @override
  ResultFuture<AdminDetails> call(String params) => _repo.fetchUserData(params);
}
