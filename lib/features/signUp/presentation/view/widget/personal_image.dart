import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PersonalImage extends StatefulWidget {
  const PersonalImage({super.key});

  @override
  State<PersonalImage> createState() => _PersonalImageState();
}

class _PersonalImageState extends State<PersonalImage> {
  File? pickimage;

  Future<void> selectImage() async {
    var image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    var selected = File(image!.path);
    if (image != null) {
      setState(() {
        pickimage = selected;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 80,
          backgroundColor: Colors.white,
          backgroundImage: pickimage != null
              ? FileImage(pickimage!)
              : NetworkImage(
                  'https://cdn.pixabay.com/photo/2018/11/13/22/01/instagram-3814080_1280.png',
                ),
        ),
        Positioned(
          height: 80 * 2,
          width: 80 * 2,
          child: IconButton(
            onPressed: selectImage,
            icon: const Icon(
              size: 20,
              Icons.add,
              color: Colors.blue,
            ),
          ),
        )
      ],
    );
  }
}
