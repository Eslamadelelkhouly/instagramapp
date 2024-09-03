import 'package:flutter/material.dart';
import 'package:instagramapp/core/utils/style.dart';
import 'package:instagramapp/features/signUp/presentation/view/widget/custom_form.dart';
import 'package:instagramapp/features/signUp/presentation/view/widget/text_button.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: height * 0.15),
              const Text(
                'Instagram App',
                style: Style.textStyle30,
              ),
              const SizedBox(height: 20),
              CustomForm(
                textbutton: 'Login',
              ),
              const SizedBox(height: 10),
              const CustomTextButton(text: 'Sign Up'),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
