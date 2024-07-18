
import 'package:admin_portal_mantis_pro_gaming/core/common/app/providers/bread_crumb_notifier.dart';
import 'package:admin_portal_mantis_pro_gaming/core/services/injection_container.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/go_router_observer.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/presentation/views/login_screen.dart';
import 'package:admin_portal_mantis_pro_gaming/src/dashboard/home/presentation/views/dashboard.dart';
import 'package:admin_portal_mantis_pro_gaming/src/dashboard/profile/presentation/views/admin_profile_screen.dart';
import 'package:admin_portal_mantis_pro_gaming/src/feedback/presentation/views/feedback_screen.dart';
import 'package:admin_portal_mantis_pro_gaming/src/global_dashboard/presentation/views/global_dashboard_screen.dart';
import 'package:admin_portal_mantis_pro_gaming/src/incentives/presentation/views/incentives_screen.dart';
import 'package:admin_portal_mantis_pro_gaming/src/push_notifications/presentation/views/push_notifications_screen.dart';
import 'package:admin_portal_mantis_pro_gaming/src/time_tracking/presentation/views/time_tracking_screen.dart';
import 'package:admin_portal_mantis_pro_gaming/src/user/details/presentation/bloc/user_details_bloc.dart';
import 'package:admin_portal_mantis_pro_gaming/src/user/details/presentation/views/user_details_screen.dart';
import 'package:admin_portal_mantis_pro_gaming/src/user/search/presentation/bloc/user_search_bloc.dart';
import 'package:admin_portal_mantis_pro_gaming/src/user/search/presentation/views/user_search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

part 'router.main.dart';

