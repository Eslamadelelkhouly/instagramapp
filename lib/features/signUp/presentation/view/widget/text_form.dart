import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  const CustomTextForm({super.key, required this.hintext});
  final String hintext;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      child: TextFormField(
        style: TextStyle(color: Colors.white),
        validator: (value) {},
        decoration: InputDecoration(
          hintText: hintext,
          hintStyle: TextStyle(color: Colors.grey),
          focusedBorder: customborderfoucs(),
          enabledBorder: customborderenable(),
        ),
      ),
    );
  }

  OutlineInputBorder customborderenable() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey,
      ),
    );
  }

  OutlineInputBorder customborderfoucs() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.white,
      ),
    );
  }
}
