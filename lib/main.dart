import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagramapp/features/comment/presentation/views/comment_screen.dart';

void main() {
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
      home: const CommentScreen(),
    );
  }
}
