import 'package:flutter/material.dart';
import 'package:instagramapp/features/message/presentation/views/widgets/message_view_body.dart';

class MessageView extends StatelessWidget {
  const MessageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MessageViewBody(),
    );
  }
}
