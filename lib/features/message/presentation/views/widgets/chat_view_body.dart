import 'package:flutter/material.dart';
import 'package:instagramapp/features/message/presentation/views/widgets/card_list_view_chat.dart';
import 'package:instagramapp/features/message/presentation/views/widgets/text_field_chat_view.dart';
import 'package:instagramapp/features/message/presentation/views/widgets/title_chat.dart';

class ChatViewBody extends StatelessWidget {
  const ChatViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          TitleChat(
            name: 'eslam',
          ),
          const SizedBox(height: 10),
          Expanded(child: CardListViewChat()),
          TextFieldChatView(),
        ],
      ),
    );
  }
}
