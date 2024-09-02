import 'package:flutter/material.dart';
import 'package:instagramapp/core/utils/style.dart';
import 'package:instagramapp/features/signUp/presentation/view/widget/custom_form.dart';
import 'package:instagramapp/features/signUp/presentation/view/widget/personal_image.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

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
              SizedBox(height: 20),
              const PersonalImage(),
              SizedBox(height: 20),
              CustomForm(),
            ],
          ),
        ),
      ),
    );
  }
}
