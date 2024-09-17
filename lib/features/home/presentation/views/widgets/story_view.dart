import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

class Story extends StatelessWidget {
  const Story({super.key, required this.userMap});
  final Map<String, dynamic> userMap;
  @override
  Widget build(BuildContext context) {
    final storyController = StoryController();
    List stories = userMap['stories'];
    return StoryView(
      controller: storyController,
      storyItems: stories.map((story) {
        if (story['type'] == 'image') {
          return StoryItem.pageImage(
            url: story['content'],
            controller: storyController,
          );
        }
        if (story['type'] == 'video') {
          return StoryItem.pageVideo(
            story['content'],
            controller: storyController,
          );
        }
      }).toList(),
      repeat: false,
      onComplete: () {},
    );
  }
}
