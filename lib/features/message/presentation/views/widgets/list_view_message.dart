import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagramapp/features/message/presentation/views/widgets/card_list_view_message.dart';

class ListViewMessage extends StatelessWidget {
  const ListViewMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (context, index) {
        return CardListViewMessage();
      },
    );
  }
}
