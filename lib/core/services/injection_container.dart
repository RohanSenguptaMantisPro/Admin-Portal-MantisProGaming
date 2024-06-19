
import 'package:admin_portal_mantis_pro_gaming/core/utils/aes_encryption.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/consts.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/encryption_service.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/rsa_encryption.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/data/datasources/auth_remote_data_sources.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/data/repo/auth_repo_impl.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/domain/repo/auth_repo.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/domain/usecases/cache_user_token.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/domain/usecases/create_user.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/domain/usecases/google_sign_in_service.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/domain/usecases/is_admin.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/domain/usecases/is_user_logged_in.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

part 'injection_container.main.dart';
