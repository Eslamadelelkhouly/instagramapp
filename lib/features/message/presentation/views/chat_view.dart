import 'package:flutter/material.dart';
import 'package:instagramapp/features/message/presentation/views/widgets/chat_view_body.dart';

class ChatView extends StatelessWidget {
  const ChatView(
      {super.key, required this.name, required this.image, required this.id});
  final String name;
  final String image;
  final String id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChatViewBody(name: name, image: image, id: id),
    );
  }
}
