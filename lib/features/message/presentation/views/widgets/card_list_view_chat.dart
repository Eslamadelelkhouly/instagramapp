import 'package:flutter/material.dart';
import 'package:instagramapp/features/message/presentation/views/widgets/container_message.dart';

class CardListViewChat extends StatelessWidget {
  const CardListViewChat({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (context, index) {
        return Align(
            alignment: Alignment.centerLeft, child: ContainerMessage());
      },
    );
  }
}
