import 'package:flutter/material.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/details_personal.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/personal_view_story.dart';

class TitlePersonSearch extends StatelessWidget {
  const TitlePersonSearch(
      {super.key,
      required this.personalimage,
      required this.name,
      required this.followers,
      required this.following,
      required this.posts});

  final String personalimage;
  final String name;
  final String followers;
  final String following;
  final String posts;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize
          .min, // Add this line to make Row take only the necessary space
      children: [
        Expanded(
          child: PersonalViewStory(
            name: name,
            image: personalimage,
          ),
        ),
        const SizedBox(width: 10), // Add spacing if needed
        Expanded(
          child: DetailsPersonal(
            posts: posts,
            followers: followers,
            following: following,
          ),
        ),
      ],
    );
  }
}
