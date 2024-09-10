import 'package:flutter/material.dart';
import 'package:instagramapp/core/utils/border.dart';

class CustomTextFieldPassword extends StatelessWidget {
  const CustomTextFieldPassword({
    super.key,
    required this.validator,
    required this.controller,
  });

  final String? Function(String?)? validator;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      child: TextFormField(
        controller: controller,
        obscureText: true,
        style: const TextStyle(color: Colors.white),
        validator: validator,
        decoration: InputDecoration(
          suffixIcon: const Icon(Icons.visibility_off),
          hintText: 'password',
          hintStyle: const TextStyle(color: Colors.grey),
          focusedBorder: customborderfoucs(),
          enabledBorder: customborderenable(),
        ),
      ),
    );
  }
}
