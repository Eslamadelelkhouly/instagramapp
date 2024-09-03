import 'package:flutter/material.dart';
import 'package:instagramapp/core/utils/border.dart';

class CustomTextFieldPassword extends StatelessWidget {
  const CustomTextFieldPassword({super.key, required this.validator});

  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      child: TextFormField(
        obscureText: true,
        style: TextStyle(color: Colors.white),
        validator: validator,
        decoration: InputDecoration(
          suffixIcon: Icon(Icons.visibility_off),
          hintText: 'password',
          hintStyle: TextStyle(color: Colors.grey),
          focusedBorder: customborderfoucs(),
          enabledBorder: customborderenable(),
        ),
      ),
    );
  }
}
