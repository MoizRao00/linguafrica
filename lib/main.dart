import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linguafrica/screens/App%20Settings/app_setting_screen.dart';
import 'package:linguafrica/screens/Auth/OnboBoardingScreen.dart';
import 'package:linguafrica/screens/Kids/Kids_onboarding.dart';
import 'package:linguafrica/screens/Kids/kids_home_map.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      routes: {
        '/settings' :(context) => const AppSettingScreen(),

      },
        theme : ThemeData(
          textTheme: TextTheme(
            // Font for headers
            headlineLarge: GoogleFonts.plusJakartaSansTextTheme().headlineLarge,

            // Font for body text
            bodyMedium: GoogleFonts.beVietnamProTextTheme().bodyMedium,
          ),
        ),
debugShowCheckedModeBanner: false,
      home: OnBoardingScreen()
    );
  }
}

