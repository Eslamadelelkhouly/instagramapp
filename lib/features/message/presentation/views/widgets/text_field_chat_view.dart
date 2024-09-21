import 'package:flutter/material.dart';
import 'package:instagramapp/core/utils/border.dart';

class TextFieldChatView extends StatefulWidget {
  const TextFieldChatView({
    super.key,
  });

  @override
  State<TextFieldChatView> createState() => _TextFieldChatViewState();
}

class _TextFieldChatViewState extends State<TextFieldChatView> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        enabledBorder: customborderenable(),
        focusedBorder: customborderfoucs(),
        suffixIcon: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.send),
        ),
      ),
    );
  }
}
