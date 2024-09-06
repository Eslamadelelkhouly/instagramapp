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
  bool _isPicking = false; // Track the status of image picker

  Future<void> selectImage() async {
    if (_isPicking) return; // Prevent multiple image picker calls

    setState(() {
      _isPicking = true;
    });

    try {
      var image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );
      if (image != null) {
        setState(() {
          pickimage = File(image.path);
        });
      }
    } catch (e) {
      print('Error picking image: $e');
    } finally {
      setState(() {
        _isPicking = false;
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
              : const NetworkImage(
                  'https://cdn.pixabay.com/photo/2018/11/13/22/01/instagram-3814080_1280.png',
                ) as ImageProvider,
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
