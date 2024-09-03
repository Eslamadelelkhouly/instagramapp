import 'package:flutter/material.dart';
import 'package:instagramapp/core/utils/border.dart';

class CustomTextForm extends StatelessWidget {
  const CustomTextForm({super.key, required this.hintext, required this.validator});
  final String hintext;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      child: TextFormField(
        style: TextStyle(color: Colors.white),
        validator: validator,
        decoration: InputDecoration(
          hintText: hintext,
          hintStyle: TextStyle(color: Colors.grey),
          focusedBorder: customborderfoucs(),
          enabledBorder: customborderenable(),
        ),
      ),
    );
  }
}
