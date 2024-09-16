import 'package:flutter/material.dart';

class ChoiceImageVideo extends StatelessWidget {
  const ChoiceImageVideo({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: Icon(Icons.upload, color: Colors.white),
      onSelected: (String choice) {
        if (choice == 'option1') {
        } else if (choice == 'option2') {}
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
