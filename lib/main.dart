import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagramapp/features/signUp/presentation/view/signup_screen.dart';
import 'package:instagramapp/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram app',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        fontFamily: GoogleFonts.firaSans().fontFamily,
      ),
      home: const SignupScreen(),
    );
  }
}
