import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

class Story extends StatelessWidget {
  const Story({super.key});

  @override
  Widget build(BuildContext context) {
    final storyController = StoryController();
    return StoryView(
      controller: storyController,
      storyItems: [
        StoryItem.pageImage(
          url:
              'https://img.freepik.com/free-vector/instagram-icon_1057-2227.jpg?t=st=1726528908~exp=1726532508~hmac=7d981fa41479c3d33359ac6787850e82d23eb30e9a3c1ee586eb2bb920f72471&w=740',
          controller: storyController,
        ),
      ],
      repeat: false,
      onComplete: () {},
    );
  }
}
