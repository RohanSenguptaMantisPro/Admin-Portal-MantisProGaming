
import 'package:admin_portal_mantis_pro_gaming/core/usecases/usecases.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/typedefs.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/domain/repo/auth_repo.dart';

class GoogleSignInService extends UsecaseWithoutParams<String> {
  const GoogleSignInService(this._repo);

  final AuthRepo _repo;

  @override
  ResultFuture<String> call() => _repo.googleSignInService();
}
