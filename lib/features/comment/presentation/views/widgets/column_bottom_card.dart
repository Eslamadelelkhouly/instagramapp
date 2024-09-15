import 'package:flutter/material.dart';
import 'package:instagramapp/core/utils/style.dart';
import 'package:intl/intl.dart';

class ColumnBottomCard extends StatelessWidget {
  const ColumnBottomCard({
    super.key,
    required this.commentMap,
  });

  final Map<String, dynamic> commentMap;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          commentMap['comment'],
          style: Style.textStyle15.copyWith(
            color: Colors.grey,
          ),
        ),
        Text(
          style: Style.textStyle15.copyWith(color: Colors.grey),
          DateFormat.MMMEd().format(
            commentMap['date'].toDate(),
          ),
        )
      ],
    );
  }
}
