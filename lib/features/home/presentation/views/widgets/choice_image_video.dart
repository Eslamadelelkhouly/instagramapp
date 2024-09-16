import 'package:flutter/material.dart';

class ChoiceImageVideo extends StatelessWidget {
  const ChoiceImageVideo({
    super.key,
    required this.selectImage,
    required this.selectVideo,
  });
  final Future<void> Function() selectImage;
  final Future<void> Function() selectVideo;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: Icon(Icons.upload, color: Colors.white),
      onSelected: (String choice) {
        if (choice == 'option1') {
          selectVideo();
        } else if (choice == 'option2') {
          selectImage();
        }
      },
      itemBuilder: (BuildContext context) {
        return <PopupMenuEntry<String>>[
          PopupMenuItem<String>(
            value: 'option1',
            child: Text('Select video'),
          ),
          PopupMenuItem<String>(
            value: 'option2',
            child: Text('Select image'),
          )
        ];
      },
    );
  }
}
