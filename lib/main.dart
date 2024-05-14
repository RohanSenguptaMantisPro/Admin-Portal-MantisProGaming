import 'package:admin_portal_mantis_pro_gaming/core/res/colours.dart';
import 'package:admin_portal_mantis_pro_gaming/core/services/router.dart';
import 'package:admin_portal_mantis_pro_gaming/dashboard/presentation/providers/dashboard_controller.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
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
      child: MaterialApp(
        title: 'Education App',
        theme: ThemeData(
          useMaterial3: true,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          // fontFamily: Fonts.poppins,
          appBarTheme: const AppBarTheme(
            color: Colors.transparent,
          ),
          textTheme: GoogleFonts.poppinsTextTheme(textTheme).copyWith(
            bodyMedium: GoogleFonts.poppins(
              textStyle: const TextStyle(
                fontSize: 14,
                color: Colours.neutralTextColour,
                fontWeight: FontWeight.w400 ,
              ),
            ),
            bodySmall: GoogleFonts.poppins(
              textStyle: const TextStyle(
                fontSize: 14,
                color: Colours.lightTextColour,
                fontWeight: FontWeight.w500 ,
              ),
            ),
          ),

          colorScheme:
              ColorScheme.fromSwatch(accentColor: Colours.primaryColour),
        ),
        onGenerateRoute: generateRoute,
      ),
    );
  }
}
