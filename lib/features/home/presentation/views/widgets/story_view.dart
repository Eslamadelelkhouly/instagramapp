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
  Map<String, dynamic>? currentStory;
  bool _isCompleted = false;

  @override
  void initState() {
    super.initState();
    storyController = StoryController();
    if (widget.stories.isNotEmpty) {
      currentStory = Map<String, dynamic>.from(widget.stories.first);
    }
  }

  @override
  void dispose() {
    storyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userprovider = Provider.of<ProviderUser>(context, listen: false);

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
                  key: ValueKey(storyMap['id']),
                  url: storyMap['content'],
                  controller: storyController,
                  imageFit: BoxFit.cover,
                );
              } else if (storyMap['type'] == 'video') {
                return StoryItem.pageVideo(
                  storyMap['content'],
                  controller: storyController,
                  key: ValueKey(storyMap['id']),
                );
              } else {
                return StoryItem.text(
                  title: 'Unsupported content',
                  backgroundColor: Colors.red,
                  key: ValueKey(storyMap['id']),
                );
              }
            }).toList(),
            onStoryShow: (storyItem, index) {
              final newStory = widget.stories[index];
              if (currentStory?['id'] != newStory['id']) {
                setState(() {
                  currentStory = Map<String, dynamic>.from(newStory);
                });
              }
            },
            repeat: false,
            onComplete: () {
              setState(() {
                _isCompleted = true;
              });
              Navigator.of(context).pop();
            },
          ),
          Positioned(
            top: 45,
            left: 20,
            child: IconButton(
              onPressed: () async {
                if (currentStory != null &&
                    currentStory!['uid'] ==
                        FirebaseAuth.instance.currentUser!.uid) {
                  try {
                    await Firestore().delete_story(story: currentStory!);
                    userprovider.delete_storyy(story: currentStory!);
                    Navigator.of(context).pop();
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Error: ${e.toString()}')),
                    );
                  }
                }
              },
              icon: const Icon(Icons.remove, color: Colors.white),
            ),
          ),
          if (_isCompleted)
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.black,
              child: const Center(
                child: Text(
                  'No more stories',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
