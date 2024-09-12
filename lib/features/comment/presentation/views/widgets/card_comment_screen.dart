import 'package:flutter/material.dart';
import 'package:instagramapp/core/utils/style.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/cirule_photo.dart';

class CardCommentScreen extends StatelessWidget {
  const CardCommentScreen({super.key, required this.commentMap});
  final Map<String, dynamic> commentMap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: const Icon(Icons.favorite, color: Colors.white),
      leading: CirclePhoto(
        radius: 30,
        image: commentMap['userimage'],
      ),
      title: const Text('Name', style: Style.textStyle20),
      subtitle: Text(
        commentMap['comment'],
        style: Style.textStyle15.copyWith(
          color: Colors.grey,
        ),
      ),
    );
  }
}
