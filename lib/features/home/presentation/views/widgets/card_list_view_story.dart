import 'package:flutter/material.dart';
import 'package:instagramapp/core/utils/style.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/story_view.dart';

class CardListViewStory extends StatelessWidget {
  const CardListViewStory({
    super.key,
    required this.userMap,
  });
  final Map<String, dynamic> userMap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return Story(
                userMap: userMap,
              );
            },
          ),
        );
      },
      child: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.pink,
                width: 3,
              ),
              image: DecorationImage(
                image: NetworkImage(
                  userMap['image'],
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            userMap['name'],
            style: Style.textStyle10.copyWith(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
