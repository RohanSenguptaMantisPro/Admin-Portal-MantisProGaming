import 'package:admin_portal_mantis_pro_gaming/core/common/app/providers/admin_user_data.dart';
import 'package:admin_portal_mantis_pro_gaming/core/common/app/providers/bread_crumb_notifier.dart';
import 'package:admin_portal_mantis_pro_gaming/core/common/app/providers/game_search_parameters.dart';
import 'package:admin_portal_mantis_pro_gaming/core/common/app/providers/user_search_parameters.dart';
import 'package:admin_portal_mantis_pro_gaming/core/common/app/providers/user_token_provider.dart';
import 'package:admin_portal_mantis_pro_gaming/core/res/colours.dart';
import 'package:admin_portal_mantis_pro_gaming/core/services/injection_container.dart';
import 'package:admin_portal_mantis_pro_gaming/core/services/router.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserTokenProvider()),
        ChangeNotifierProvider(create: (_) => AdminUserData()),
        ChangeNotifierProvider(create: (_) => UserSearchParameters()),
        ChangeNotifierProvider(create: (_) => GameSearchParameters()),
        ChangeNotifierProvider(create: (_) => BreadcrumbNotifier()),
      ],
      // Builder : context defined below MultiProvider should be sent to
      // goRouter to access Provider.of(context).breadCrumbNotifier.
      child: Builder(
        builder: (builderContext) {
          return OKToast(
            child: MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: 'Education App',
              theme: ThemeData(
                scrollbarTheme: const ScrollbarThemeData(
                    thumbColor: WidgetStatePropertyAll(
                  Colours.grey,
                )),
                useMaterial3: true,
                visualDensity: VisualDensity.adaptivePlatformDensity,
                // fontFamily: Fonts.poppins,
                appBarTheme: const AppBarTheme(
                  color: Colors.transparent,
                ),
                fontFamily: GoogleFonts.poppins().fontFamily,
                textTheme: GoogleFonts.poppinsTextTheme(textTheme).copyWith(
                  // for different sized texts.
                  headlineLarge: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      height: 1,
                      fontSize: 90,
                      color: Colours.whiteTextColour,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  titleMedium: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontSize: 27,
                      color: Colours.whiteTextColour,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  titleSmall: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontSize: 18,
                      color: Colours.whiteTextColour,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  bodyMedium: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontSize: 14,
                      color: Colours.whiteTextColour,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  bodySmall: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontSize: 12,
                      color: Colours.whiteTextColour,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  labelSmall: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontSize: 11,
                      color: Colours.lightWhiteTextColour,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                colorScheme: ColorScheme.fromSwatch(
                  accentColor: Colours.primaryColour,
                ),
              ),
              // onGenerateRoute: generateRoute,
              routerConfig: generateRoute(builderContext),
            ),
          );
        },
      ),
    );
  }
}
