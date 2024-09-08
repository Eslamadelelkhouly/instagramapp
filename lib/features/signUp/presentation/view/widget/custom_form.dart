import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagramapp/core/utils/vaildate_function.dart';
import 'package:instagramapp/core/widgets/show_snack_bar.dart';
import 'package:instagramapp/features/home/data/models/user_model.dart';
import 'package:instagramapp/features/home/presentation/views/home_screen.dart';
import 'package:instagramapp/features/signUp/presentation/view/widget/custom_button.dart';
import 'package:instagramapp/features/signUp/presentation/view/widget/personal_image.dart';
import 'package:instagramapp/features/signUp/presentation/view/widget/text_form.dart';
import 'package:instagramapp/features/signUp/presentation/view/widget/textfield_password.dart';

class CustomForm extends StatefulWidget {
  const CustomForm({super.key, required this.textbutton, String? imageurl});

  final String textbutton;

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  final email = TextEditingController();
  final name = TextEditingController();
  final password = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? imageurl; // Add a variable to store the image URL

  @override
  void dispose() {
    email.dispose();
    name.dispose();
    password.dispose();
    super.dispose();
  }

  void setImageUrl(String url) {
    setState(() {
      imageurl = url;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          PersonalImage(
              onImageSelected: setImageUrl), // Pass callback to PersonalImage
          const SizedBox(height: 80),
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
            onPressed: () async {
              formKey.currentState!.save();
              if (formKey.currentState!.validate() && imageurl != null) {
                try {
                  await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: email.text,
                    password: password.text,
                  );
                  UserModel userModel = UserModel(
                    FirebaseAuth.instance.currentUser!.uid,
                    email.text,
                    password.text,
                    imageurl!, // Use the image URL
                    name.text,
                    [],
                    [],
                  );
                  FirebaseFirestore.instance
                      .collection('users')
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .set(userModel.ConveretToMap());
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
  }
}
