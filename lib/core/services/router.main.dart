part of 'router.dart';

final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

late BreadcrumbNotifier breadcrumbNotifier;

CustomTransitionPage<void> customTransitionBuilder(
  BuildContext context,
  GoRouterState state,
  Widget child,
) {
  return CustomTransitionPage<void>(
    name: state.name,
    transitionDuration: Duration.zero,
    reverseTransitionDuration: Duration.zero,
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child; // This will give an immediate transition without animation
    },
  );
}

RouterConfig<Object> generateRoute(BuildContext context) {
  breadcrumbNotifier = Provider.of<BreadcrumbNotifier>(context, listen: false);
  return GoRouter(
    initialLocation: '/',
    routes: appRoutes,
    errorBuilder: (context, state) => BlocProvider(
      create: (_) => sl<AuthBloc>(),
      child: const LoginScreen(),
    ),
  );
}

final appRoutes = [
  GoRoute(
    name: 'login',
    path: '/',
    builder: (context, state) => BlocProvider(
      create: (_) => sl<AuthBloc>(),
      child: const LoginScreen(),
    ),
  ),
  //

  ShellRoute(
    observers: [
      GoRouterObserver(breadcrumbNotifier: breadcrumbNotifier),
    ],
    navigatorKey: _shellNavigatorKey,
    pageBuilder: (BuildContext context, GoRouterState state, Widget child) {
      return customTransitionBuilder(
        context,
        state,
        BlocProvider(
          create: (_) => sl<AuthBloc>(),
          child: Dashboard(
            child: child,
          ),
        ),
      );
    },
    routes: <RouteBase>[
      GoRoute(
        name: 'Global Dashboard',
        path: GlobalDashboardScreen.routeName,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return customTransitionBuilder(
            context,
            state,
            const GlobalDashboardScreen(),
          );
        },
      ),
      GoRoute(
        name: 'User Search',
        path: UserSearchScreen.routeName,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return customTransitionBuilder(
            context,
            state,
            BlocProvider(
              create: (_) => sl<UserSearchBloc>(),
              child: const UserSearchScreen(),
            ),
          );
        },
        routes: [
          GoRoute(
            //have to use full path in name else in goRouter observer we
            // are unable to
            // send the full path of the route.
            // as it takes only the name of the path.
            name: 'User Search/User Details',
            path: '${UserDetailsScreen.routeName}/:uID',
            pageBuilder: (BuildContext context, GoRouterState state) {
              return customTransitionBuilder(
                context,
                state,
                BlocProvider(
                  create: (context) => sl<UserSearchBloc>(),
                  child: BlocProvider(
                    create: (_) => sl<UserDetailsBloc>(),
                    child: UserDetailsScreen(
                      uID: state.pathParameters['uID']!,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      GoRoute(
        name: 'Game Search',
        path: GameSearchScreen.routeName,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return customTransitionBuilder(
            context,
            state,
            BlocProvider(
              create: (_) => sl<GameSearchBloc>(),
              child: const GameSearchScreen(),
            ),
          );
        },
        routes: [
          GoRoute(
            //have to use full path in name else in goRouter observer we
            // are unable to
            // send the full path of the route.
            // as it takes only the name of the path.
            name: 'Game Search/Game Details',
            path: '${UserDetailsScreen.routeName}/:uID',
            pageBuilder: (BuildContext context, GoRouterState state) {
              return customTransitionBuilder(
                context,
                state,
                BlocProvider(
                  create: (context) => sl<GameSearchBloc>(),
                  child: //later to be added the GameDetailsBloc.
                      /*BlocProvider(
                    create: (_) => sl<>(),
                    child: */
                      GameDetailsScreen(
                    gameID: state.pathParameters['gameID']!,
                  ),
                  // ),
                ),
              );
            },
          ),
        ],
      ),
      GoRoute(
        name: 'Time Tracking',
        path: TimeTrackingScreen.routeName,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return customTransitionBuilder(
            context,
            state,
            const TimeTrackingScreen(),
          );
        },
      ),
      GoRoute(
        name: 'Incentives',
        path: IncentivesScreen.routeName,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return customTransitionBuilder(
            context,
            state,
            const IncentivesScreen(),
          );
        },
      ),
      GoRoute(
        name: 'Push Notifications',
        path: PushNotificationsScreen.routeName,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return customTransitionBuilder(
            context,
            state,
            BlocProvider(
              create: (_) => sl<PushNotificationBloc>(),
              child: const PushNotificationsScreen(),
            ),
          );
        },
      ),
      GoRoute(
        name: 'Feedback',
        path: FeedbackScreen.routeName,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return customTransitionBuilder(
            context,
            state,
            const FeedbackScreen(),
          );
        },
      ),
      GoRoute(
        name: 'Admin Profile',
        path: AdminProfileScreen.routeName,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return customTransitionBuilder(
            context,
            state,
            BlocProvider(
              create: (_) => sl<AuthBloc>(),
              child: const AdminProfileScreen(),
            ),
          );
        },
      ),
    ],
  ),
];

// Route<dynamic> generateRoute(RouteSettings settings) {
//   switch (settings.name) {
//     case '/':
//       return _pageBuilder(
//         (_) => const LoginScreen(),
//         settings: settings,
//       );
//     case Dashboard.routeName:
//       final args = (settings.arguments ?? 1) as int;
//       return _pageBuilder(
//         (_) => Dashboard(
//           autoLogIn: args,
//         ),
//         settings: settings,
//       );
//
//     default:
//       return _pageBuilder(
//         (_) => const LoginScreen(),
//         settings: settings,
//       );
//   }
// }
//
// PageRouteBuilder<dynamic> _pageBuilder(
//   Widget Function(BuildContext) page, {
//   required RouteSettings settings,
// }) {
//   return PageRouteBuilder(
//     settings: settings,
//     transitionsBuilder: (_, animation, __, child) => FadeTransition(
//       opacity: animation,
//       child: child,
//     ),
//     pageBuilder: (context, _, __) => page(context),
//   );
// }
