import 'package:flutter/material.dart';
import 'package:instagramapp/core/utils/style.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/cirule_photo.dart';
import 'package:instagramapp/features/message/presentation/views/chat_view.dart';

class ListTielSearch extends StatelessWidget {
  const ListTielSearch({
    super.key,
    required this.name,
    required this.image,
    this.onTap,
    required this.id,
  });

  final String name;
  final String image;
  final void Function()? onTap;
  final String id;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        trailing: IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return ChatView(name: name, image: image, id: id);
                },
              ),
            );
          },
          icon: Icon(Icons.message_sharp, color: Colors.white),
        ),
        title: Text(
          name,
          style: Style.textStyle20,
        ),
        leading: CirclePhoto(
          image: image,
          radius: 20,
        ),
      ),
    );
  }
}
