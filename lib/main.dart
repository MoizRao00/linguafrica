import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linguafrica/screens/OnboBoardingScreen.dart';
import 'package:linguafrica/screens/forgetPassword_page.dart';
import 'package:linguafrica/screens/login_page.dart';
import 'package:linguafrica/screens/parents_potal.dart';
import 'package:linguafrica/screens/signup_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        theme : ThemeData(
          textTheme: TextTheme(
            // Font for headers
            headlineLarge: GoogleFonts.plusJakartaSansTextTheme().headlineLarge,

            // Font for body text
            bodyMedium: GoogleFonts.beVietnamProTextTheme().bodyMedium,
          ),
        ),
debugShowCheckedModeBanner: false,
      home: ParentsPortal()
    );
  }
}

