part of 'router.dart';

final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

CustomTransitionPage<void> customTransitionBuilder(
  BuildContext context,
  GoRouterState state,
  Widget child,
) {
  return CustomTransitionPage<void>(
    transitionDuration: Duration.zero,
    reverseTransitionDuration: Duration.zero,
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child; // This will give an immediate transition without animation
    },
  );
}

RouterConfig<Object> generateRoute() {
  return GoRouter(
    initialLocation: '/',
    routes: appRoutes,
    errorBuilder: (context, state) => const LoginScreen(),
  );
}

final appRoutes = [
  //

  GoRoute(
    path: '/',
    builder: (context, state) => const LoginScreen(),
  ),
  //

  ShellRoute(
    navigatorKey: _shellNavigatorKey,
    pageBuilder: (BuildContext context, GoRouterState state, Widget child) {
      return customTransitionBuilder(context, state, Dashboard(child: child));
    },
    routes: <RouteBase>[
      GoRoute(
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
        path: UserSearchScreen.routeName,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return customTransitionBuilder(
            context,
            state,
            const UserSearchScreen(),
          );
        },
        routes: [
          GoRoute(
            path: UserDetailsScreen.routeName,
            pageBuilder: (BuildContext context, GoRouterState state) {
              return customTransitionBuilder(
                context,
                state,
                const UserDetailsScreen(),
              );
            },
          ),
        ],
      ),
      GoRoute(
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
        path: FeedbackScreen.routeName,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return customTransitionBuilder(
              context, state, const FeedbackScreen());
        },
      ),
      GoRoute(
        path: AdminProfileScreen.routeName,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return customTransitionBuilder(
            context,
            state,
            const AdminProfileScreen(),
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
