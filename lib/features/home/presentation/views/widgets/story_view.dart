import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagramapp/features/home/function/firebase/firestore.dart';
import 'package:instagramapp/features/home/presentation/manager/provider/provider_user.dart';
import 'package:provider/provider.dart';
import 'package:story_view/story_view.dart';

class Story extends StatefulWidget {
  const Story({super.key, required this.stories});
  final List stories;

  @override
  State<Story> createState() => _StoryState();
}

class _StoryState extends State<Story> {
  late StoryController storyController;
  late Map<String, dynamic> currentStory;

  @override
  void initState() {
    super.initState();
    storyController = StoryController();
    currentStory = Map<String, dynamic>.from(
        widget.stories.first); // Initialize with the first story
  }

  @override
  void dispose() {
    storyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userprovider = Provider.of<ProviderUser>(context);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          StoryView(
            controller: storyController,
            storyItems: widget.stories.map((story) {
              final storyMap = Map<String, dynamic>.from(story);

              if (storyMap['type'] == 'image') {
                return StoryItem.pageImage(
                  url: storyMap['content'],
                  controller: storyController,
                  imageFit: BoxFit.cover, // تحسين عرض الصور
                );
              } else if (storyMap['type'] == 'video') {
                return StoryItem.pageVideo(
                  storyMap['content'],
                  controller: storyController,
                );
              } else {
                return StoryItem.text(
                  title: 'Unsupported content',
                  backgroundColor: Colors.red,
                );
              }
            }).toList(),
            onStoryShow: (storyItem, index) {
              // استخدم addPostFrameCallback لتحديث الحالة بعد بناء الويدجت
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (currentStory != widget.stories[index]) {
                  setState(() {
                    currentStory =
                        Map<String, dynamic>.from(widget.stories[index]);
                  });
                }
              });
            },
            repeat: false,
            onComplete: () {
              Navigator.of(context).pop();
            },
          ),
          Positioned(
            top: 45,
            left: 20,
            child: IconButton(
              onPressed: () {
                if (currentStory['uid'] ==
                    FirebaseAuth.instance.currentUser!.uid) {
                  Firestore().delete_story(story: currentStory);
                  userprovider.delete_storyy(story: currentStory);
                  Navigator.of(context).pop();
                }
              },
              icon: const Icon(Icons.remove, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
