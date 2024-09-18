import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

class Story extends StatelessWidget {
  const Story({super.key, required this.stories});
  final List stories;
  @override
  Widget build(BuildContext context) {
    final storyController = StoryController();
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
