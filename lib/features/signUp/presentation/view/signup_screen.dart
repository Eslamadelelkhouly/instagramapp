import 'package:flutter/material.dart';
import 'package:instagramapp/features/signUp/presentation/view/widget/signup_body.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SignupViewBody(),
    );
  }
}
