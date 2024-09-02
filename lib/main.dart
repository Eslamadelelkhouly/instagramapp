import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagramapp/features/signUp/presentation/view/login_screen.dart';
import 'package:instagramapp/features/signUp/presentation/view/signup_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram app',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        fontFamily: GoogleFonts.firaSans().fontFamily,
      ),
      home: SignupScreen(),
    );
  }
}
