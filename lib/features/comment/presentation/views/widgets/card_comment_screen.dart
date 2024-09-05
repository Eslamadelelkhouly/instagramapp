import 'package:flutter/material.dart';
import 'package:instagramapp/core/utils/style.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/cirule_photo.dart';

class CardCommentScreen extends StatelessWidget {
  const CardCommentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: Icon(Icons.favorite, color: Colors.white),
      leading: CirclePhoto(radius: 30),
      title: Text('Name', style: Style.textStyle20),
      subtitle: Text(
        'Comment',
        style: Style.textStyle15.copyWith(
          color: Colors.grey,
        ),
      ),
    );
  }
}
