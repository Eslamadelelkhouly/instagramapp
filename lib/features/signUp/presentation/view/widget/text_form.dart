import 'package:flutter/material.dart';
import 'package:instagramapp/core/utils/border.dart';

class CustomTextForm extends StatefulWidget {
  const CustomTextForm({
    super.key,
    required this.hintext,
    required this.validator,
    required this.controller,
  });

  final String hintext;
  final String? Function(String?)? validator;
  final TextEditingController controller;

  @override
  State<CustomTextForm> createState() => _CustomTextFormState();
}

class _CustomTextFormState extends State<CustomTextForm> {
  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      child: TextFormField(
        controller: widget.controller,
        style: const TextStyle(color: Colors.white),
        validator: widget.validator,
        decoration: InputDecoration(
          hintText: widget.hintext,
          hintStyle: const TextStyle(color: Colors.grey),
          focusedBorder: customborderfoucs(),
          enabledBorder: customborderenable(),
        ),
      ),
    );
  }
}
