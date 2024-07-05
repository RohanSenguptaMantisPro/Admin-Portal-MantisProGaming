
import 'dart:io';

import 'package:admin_portal_mantis_pro_gaming/src/authentication/domain/usecases/fetch_user_data.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/domain/usecases/log_out.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/presentation/utils/aes_encryption.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/consts.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/presentation/utils/browser_info.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/presentation/utils/encryption_service.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/presentation/utils/rsa_encryption.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/data/datasources/auth_remote_data_sources.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/data/repo/auth_repo_impl.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/domain/repo/auth_repo.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/domain/usecases/cache_user_token.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/domain/usecases/create_user.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/domain/usecases/google_sign_in_service.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/domain/usecases/is_admin.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/domain/usecases/is_user_logged_in.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:admin_portal_mantis_pro_gaming/src/user/search/data/datasources/user_search_remote_data_sources.dart';
import 'package:admin_portal_mantis_pro_gaming/src/user/search/data/repositories/user_search_repo_impl.dart';
import 'package:admin_portal_mantis_pro_gaming/src/user/search/domain/repositories/user_search_repo.dart';
import 'package:admin_portal_mantis_pro_gaming/src/user/search/domain/usecases/user_search_results.dart';
import 'package:admin_portal_mantis_pro_gaming/src/user/search/presentation/bloc/user_search_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

part 'injection_container.main.dart';
