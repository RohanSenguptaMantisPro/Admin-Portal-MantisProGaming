part of 'router.dart';

RouterConfig<Object> generateRoute() {
  return GoRouter(
    routes: appRoutes,
    errorBuilder: (context, state) => const LoginScreen(),
  );
}

final appRoutes = [
  GoRoute(
    path: '/',
    builder: (context, state) => const LoginScreen(),
  ),
  GoRoute(
    path: '${Dashboard.routeName}/:autoLogin',
    builder: (context, state) {
      debugPrint(
        '----------Go Router :'
        ' autoLogIn : ${state.pathParameters['autoLogin']}',
      );
      final autoLogin = int.parse((state.pathParameters['autoLogin']) ?? '1');
      return Dashboard(autoLogIn: autoLogin);
    },
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
