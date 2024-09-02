import 'package:flutter/material.dart';
import 'package:instagramapp/features/signUp/presentation/view/widget/custom_button.dart';
import 'package:instagramapp/features/signUp/presentation/view/widget/text_form.dart';
import 'package:instagramapp/features/signUp/presentation/view/widget/textfield_password.dart';

class CustomForm extends StatefulWidget {
  CustomForm({super.key, required this.textbutton});

  final String textbutton;
  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  final GlobalKey key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: key,
      child: Column(
        children: [
          const CustomTextForm(
            hintext: 'name',
          ),
          const SizedBox(height: 10),
          const CustomTextForm(
            hintext: 'email',
          ),
          const SizedBox(height: 10),
          const CustomTextFieldPassword(),
          const SizedBox(height: 10),
          CustomButton(
            text: widget.textbutton,
          ),
        ],
      ),
    );
  }
}
