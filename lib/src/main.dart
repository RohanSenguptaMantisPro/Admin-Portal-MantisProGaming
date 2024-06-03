import 'package:admin_portal_mantis_pro_gaming/core/res/colours.dart';
import 'package:admin_portal_mantis_pro_gaming/core/services/injection_container.dart';
import 'package:admin_portal_mantis_pro_gaming/core/services/router.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:admin_portal_mantis_pro_gaming/src/dashboard/presentation/providers/dashboard_controller.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
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
        ChangeNotifierProvider(
          create: (_) => DashboardController(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => sl<AuthBloc>(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Education App',
          theme: ThemeData(
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
                  fontSize: 23,
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
          onGenerateRoute: generateRoute,
        ),
      ),
    );
  }
}
