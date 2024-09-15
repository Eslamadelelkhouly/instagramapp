import 'package:flutter/material.dart';
import 'package:instagramapp/core/utils/style.dart';
import 'package:instagramapp/features/comment/presentation/views/widgets/column_bottom_card.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/cirule_photo.dart';
import 'package:intl/intl.dart';

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
      title: Text(commentMap['username'] ?? '0', style: Style.textStyle20),
      subtitle: ColumnBottomCard(commentMap: commentMap),
    );
  }
}
