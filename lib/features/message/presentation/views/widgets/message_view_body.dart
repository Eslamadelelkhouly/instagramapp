import 'package:flutter/material.dart';
import 'package:instagramapp/features/message/presentation/views/widgets/card_list_view_message.dart';
import 'package:instagramapp/features/message/presentation/views/widgets/list_view_message.dart';

class MessageViewBody extends StatelessWidget {
  const MessageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 20),
          Expanded(child: ListViewMessage()),
        ],
      ),
    );
  }
}
