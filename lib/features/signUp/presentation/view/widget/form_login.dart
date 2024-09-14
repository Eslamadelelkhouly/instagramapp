import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagramapp/core/utils/vaildate_function.dart';
import 'package:instagramapp/core/widgets/show_snack_bar.dart';
import 'package:instagramapp/features/home/presentation/views/home_screen.dart';
import 'package:instagramapp/features/signUp/presentation/view/widget/custom_button.dart';
import 'package:instagramapp/features/signUp/presentation/view/widget/text_form.dart';
import 'package:instagramapp/features/signUp/presentation/view/widget/textfield_password.dart';

class FormLogin extends StatefulWidget {
  const FormLogin({super.key, required this.textbutton});

  final String textbutton;
  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  final email = TextEditingController();
  final name = TextEditingController();
  final password = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    email.dispose();
    name.dispose();
    password.dispose();
    super.dispose();
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
            color: Colors.blue,
            onPressed: () async {
              formKey.currentState!.save();
              if (formKey.currentState!.validate()) {
                try {
                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: email.text,
                    password: password.text,
                  );
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) {
                      return const HomeScreen();
                    }),
                  );
                } on FirebaseAuthException catch (e) {
                  ShowSnackBar(context, e.toString());
                }
              }
            },
            text: widget.textbutton,
          ),
        ],
      ),
    );
    ;
  }
}
