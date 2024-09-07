import 'package:flutter/material.dart';
import 'package:instagramapp/core/utils/vaildate_function.dart';
import 'package:instagramapp/features/signUp/presentation/view/widget/custom_button.dart';
import 'package:instagramapp/features/signUp/presentation/view/widget/text_form.dart';
import 'package:instagramapp/features/signUp/presentation/view/widget/textfield_password.dart';

class CustomForm extends StatefulWidget {
  const CustomForm({super.key, required this.textbutton});

  final String textbutton;

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  final email = TextEditingController();
  final name = TextEditingController();
  final password = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    email.dispose();
    name.dispose();
    password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextForm(
            controller: name,
            validator: ValidateName,
            hintext: 'name',
          ),
          const SizedBox(height: 10),
          CustomTextForm(
            controller: email,
            validator: ValidateEmail,
            hintext: 'email',
          ),
          const SizedBox(height: 10),
          CustomTextFieldPassword(
            controller: password,
            validator: ValidatePassword,
          ),
          const SizedBox(height: 10),
          CustomButton(
            onPressed: OnPressedValidateButton,
            text: widget.textbutton,
          ),
        ],
      ),
    );
  }

  void OnPressedValidateButton() {
    formKey.currentState!.save();
    if (formKey.currentState!.validate()) {
      // signUp logic
    }
  }
}
