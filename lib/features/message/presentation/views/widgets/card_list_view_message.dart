import 'package:flutter/material.dart';
import 'package:instagramapp/core/utils/style.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/cirule_photo.dart';
import 'package:instagramapp/features/message/presentation/views/chat_view.dart';

class CardListViewMessage extends StatelessWidget {
  const CardListViewMessage(
      {super.key, required this.name, required this.image, required this.id});

  final String name;
  final String image;
  final String id;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return ChatView(
                id: id,
                image: image,
                name: name,
              );
            },
          ),
        );
      },
      child: ListTile(
        trailing: PopupMenuButton<String>(
          icon: Icon(Icons.more_vert, color: Colors.white),
          onSelected: (String choice) {
            if (choice == 'option1') {
              // delete function
            } else if (choice == 'option2') {
              // block function
            }
          },
          itemBuilder: (BuildContext context) {
            return <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: 'option1',
                child: Text(
                  'delete',
                ),
              ),
              PopupMenuItem<String>(
                value: 'option2',
                child: Text(
                  'block',
                ),
              ),
            ];
          },
        ),
        title: Text(
          name,
          style: Style.textStyle20,
        ),
        subtitle: Text(
          'hello',
          style: Style.textStyle20.copyWith(color: Colors.grey),
        ),
        leading: CirclePhoto(
          radius: 25,
          image: image,
        ),
      ),
    );
  }
}
