import 'package:flutter/material.dart';
import 'package:instagramapp/features/signUp/presentation/view/widget/login_view_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginViewBody(),
    );
  }
}
