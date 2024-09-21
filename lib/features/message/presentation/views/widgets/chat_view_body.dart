import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagramapp/features/message/presentation/views/widgets/card_list_view_chat.dart';
import 'package:instagramapp/features/message/presentation/views/widgets/text_field_chat_view.dart';
import 'package:instagramapp/features/message/presentation/views/widgets/title_chat.dart';

class ChatViewBody extends StatelessWidget {
  const ChatViewBody({
    super.key,
    required this.name,
    required this.image,
    required this.id,
  });
  final String name;
  final String image;
  final String id;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          TitleChat(
            image: image,
            name: name,
          ),
          const SizedBox(height: 10),
          Expanded(
              child: CardListViewChat(
            id: id,
          )),
          TextFieldChatView(
            name: name,
            image: image,
            id: id,
          ),
        ],
      ),
    );
  }
}
